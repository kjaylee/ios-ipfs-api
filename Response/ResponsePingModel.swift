//
//  ResponsePingModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ResponsePingModel: Codable {
    let success: Bool?
    let time: Int64?
    let text: String?
    
    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case time = "Time"
        case text = "Text"
    }
}

