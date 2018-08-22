//
//  ResponseRepoVersionModel.swift
//  Alamofire
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ResponseRepoVersionModel: Codable {
    let version: String?
    
    enum CodingKeys: String, CodingKey {
        case version = "Version"
    }
}
