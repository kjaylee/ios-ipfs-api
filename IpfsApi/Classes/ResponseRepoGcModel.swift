//
//  ResponseRepoGcModel.swift
//  Alamofire
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ResponseRepoGcModel: Codable {
    public let key, error: String?
    
    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case error = "Error"
    }
}
