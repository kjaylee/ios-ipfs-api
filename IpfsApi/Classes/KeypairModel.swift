//
//  KeypairModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct KeypairModel: Codable {
    let id: String?
    let name: String?
    let was: String?
    let now: String?
    let overwrite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case was = "Was"
        case now = "Now"
        case overwrite = "Overwrite"
    }
}

