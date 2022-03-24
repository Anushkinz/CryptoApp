//
//  CourseTableViewCell.swift
//  Crypto
//
//  Created by anushkinz on 19/3/22.
//

import UIKit

struct CourseTableViewCellViewModel {
    let name: String
    let symbol: String
    let price: String
    let logo_url: String
}

class CourseTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCrypto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func prepareForReuse() {
        nameLabel.text = nil
        priceLabel.text = nil
        symbolLabel.text = nil
    }
    
    static let id = "CourseTableViewCell"
    
    func configure(with viewModel: CourseTableViewCellViewModel){
        nameLabel.text = viewModel.name
        symbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.price
        if let url = URL(string: "https://cryptoicon-api.vercel.app/api/icon/\(viewModel.symbol.lowercased())") {
                    DispatchQueue.main.async {
                        if let data = try? Data(contentsOf: url)
                        {
                        self.imageCrypto.image = UIImage(data: data)
                    }
            }
        }
    }

}
