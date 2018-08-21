//
//  AddressModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct AddressModel: Codable {
    let id: String?
    let addrs: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case addrs = "Addrs"
    }
}
