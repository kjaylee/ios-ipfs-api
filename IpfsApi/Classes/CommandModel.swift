//
//  CommandModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct CommandModel: Codable {
    public let name: String?
    public let subcommands: [CommandModel]?
    public let options: [CommandOptionsModel]?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case subcommands = "Subcommands"
        case options = "Options"
    }
}
