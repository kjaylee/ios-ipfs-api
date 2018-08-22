//
//  KeysModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct KeysModel: Codable {
    let keys: [String]?
    
    enum CodingKeys: String, CodingKey {
        case keys = "Keys"
    }
}
