//
//  DiffModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct DiffModel: Codable {
    let type: Int?
    let path, before, after: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case path = "Path"
        case before = "Before"
        case after = "After"
    }
}
