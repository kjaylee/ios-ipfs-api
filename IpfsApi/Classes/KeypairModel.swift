//
//  KeypairModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct KeypairModel: Codable {
    public let id: String?
    public let name: String?
    public let was: String?
    public let now: String?
    public let overwrite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case was = "Was"
        case now = "Now"
        case overwrite = "Overwrite"
    }
}

