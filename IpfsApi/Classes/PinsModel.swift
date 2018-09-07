//
//  PinsModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct PinsModel: Codable {
    public let pins: [String]?
    public let progress: Int?
    
    enum CodingKeys: String, CodingKey {
        case pins = "Pins"
        case progress = "Progress"
    }
}
