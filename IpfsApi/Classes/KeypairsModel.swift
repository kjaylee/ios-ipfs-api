//
//  KeypairsModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct KeypairsModel: Codable {
    let keys: [KeypairModel]?
    
    enum CodingKeys: String, CodingKey {
        case keys = "Keys"
    }
}
