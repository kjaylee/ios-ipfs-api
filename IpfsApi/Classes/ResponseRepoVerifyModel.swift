//
//  ResponseRepoVerifyModel.swift
//  Alamofire
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ResponseRepoVerifyModel: Codable {
    public let message: String?
    public let progress: Int?
    
    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case progress = "Progress"
    }
}
