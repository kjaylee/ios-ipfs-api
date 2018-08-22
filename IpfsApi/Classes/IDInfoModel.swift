//
//  IDInfoModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct IDInfoModel: Codable {
    let id, publicKey: String?
    let addresses: [String]?
    let agentVersion, protocolVersion: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case publicKey = "PublicKey"
        case addresses = "Addresses"
        case agentVersion = "AgentVersion"
        case protocolVersion = "ProtocolVersion"
    }
}
