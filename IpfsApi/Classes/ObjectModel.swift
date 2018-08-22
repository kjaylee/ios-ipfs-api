//
//  ObjectModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ObjectModel: Codable {
    let hash: String?
    let size: UInt64?
    let type: String?
    let links: [ObjectModel]?
    let name: String?
    let bytes: Int64?
    let blocks: Int?
    let cumulativeSize: UInt64?
    let data: String?
    
    enum CodingKeys: String, CodingKey {
        case hash = "Hash"
        case size = "Size"
        case type = "Type"
        case links = "Links"
        case name = "Name"
        case bytes = "Bytes"
        case blocks = "Blocks"
        case cumulativeSize = "CumulativeSize"
        case data = "Data"
    }
}

