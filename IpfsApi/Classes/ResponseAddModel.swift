//
//  ResponseAddModel.swift
//  Alamofire
//
//  Created by we on 2018. 8. 17..
//

import Foundation

public struct ResponseAddModel: Codable {
    let name: String?
    let hash: String?
    let bytes: Int64?
    let size: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case hash = "Hash"
        case bytes = "Bytes"
        case size = "Size"
    }
}
