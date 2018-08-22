//
//  IPNSModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct IPNSModel: Codable {
    let name: String?
    let value: String?
    let path: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case value = "Value"
        case path = "Path"
    }
}
