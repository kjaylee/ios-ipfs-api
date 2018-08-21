//
//  ResponseMessageInfoModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ResponseMessageInfoModel: Codable {
    let message: MessageInfoModel?
    
    enum CodingKeys: String, CodingKey {
        case message = "Message"
    }
}
