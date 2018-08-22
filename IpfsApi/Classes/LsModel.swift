//
//  LsModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct LsModel: Codable {
    let objects: [ObjectModel]?
    
    enum CodingKeys: String, CodingKey {
        case objects = "Objects"
    }
}
