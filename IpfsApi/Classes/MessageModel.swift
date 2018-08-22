//
//  MessageModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct MessageModel: Codable {
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case message = "Message"
    }
}
