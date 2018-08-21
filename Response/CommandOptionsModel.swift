//
//  CommandOptionsModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct CommandOptionsModel: Codable {
    let names: [String]?
    
    enum CodingKeys: String, CodingKey {
        case names = "Names"
    }
}
