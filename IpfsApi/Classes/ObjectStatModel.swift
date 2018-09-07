//
//  ObjectStatModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ObjectStatModel: Codable {
    public let hash: String?
    public let numLinks, blockSize, linksSize, dataSize: Int?
    public let cumulativeSize: Int?
    
    enum CodingKeys: String, CodingKey {
        case hash = "Hash"
        case numLinks = "NumLinks"
        case blockSize = "BlockSize"
        case linksSize = "LinksSize"
        case dataSize = "DataSize"
        case cumulativeSize = "CumulativeSize"
    }
}
