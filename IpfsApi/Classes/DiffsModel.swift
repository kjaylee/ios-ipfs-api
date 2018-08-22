//
//  DiffsModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct DiffsModel: Codable {
    let changes: [DiffModel]?
    
    enum CodingKeys: String, CodingKey {
        case changes = "Changes"
    }
}
