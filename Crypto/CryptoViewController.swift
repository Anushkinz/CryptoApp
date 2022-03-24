//
//  ViewController.swift
//  Crypto
//
//  Created by anushkinz on 19/3/22.
//

import UIKit

class CryptoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModels = [CourseTableViewCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Loaded")
        tableView.dataSource = self
        tableView.delegate = self
        
        NomicsAPICaller.shared.getAllCryptoData{[weak self] result in
            switch result {
            case .success(let models):
                print(models.count)
                print(models[0].name! + " - " + models[0].price!)
                self?.viewModels = models.compactMap({
                    CourseTableViewCellViewModel(name: $0.name ?? "",symbol: $0.symbol ?? "",price: $0.price ?? "", logo_url: $0.logo_url ?? "")
                })
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                print("no")
            }
        }
    }


}

extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseTableViewCell.id, for: indexPath) as? CourseTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
}
