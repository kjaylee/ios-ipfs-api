//
//  ResponseBitswapRmModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ResponseBlockRmModel: Codable {
    let hash, error: String?
    
    enum CodingKeys: String, CodingKey {
        case hash = "Hash"
        case error = "Error"
    }
}
