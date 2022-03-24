//
//  Model.swift
//  Crypto
//
//  Created by anushkinz on 19/3/22.
//

import Foundation

struct Crypto: Codable {
    let id: String?
    let currency: String?
    let symbol: String?
    let name: String?
    let price: String?
    let logo_url: String?
}
