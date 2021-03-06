//
//  BlockModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct BlockModel: Codable {
    public let key: String?
    public let size: Int?
    
    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case size = "Size"
    }
}
