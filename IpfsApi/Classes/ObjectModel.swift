//
//  ObjectModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ObjectModel: Codable {
    public let hash: String?
    public let size: String?
    public let type: String?
    public let links: [ObjectModel]?
    public let name: String?
    public let bytes: Int64?
    public let blocks: Int?
    public let cumulativeSize: UInt64?
    public let data: String?
    
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

