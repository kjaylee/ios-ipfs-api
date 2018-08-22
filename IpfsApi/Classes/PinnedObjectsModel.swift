//
//  PinnedObjectsModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct PinnedObjectsModel: Codable {
    let keys: [String:ObjectModel]?
    
    enum CodingKeys: String, CodingKey {
        case keys = "Keys"
    }
}
