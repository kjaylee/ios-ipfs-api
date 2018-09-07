//
//  PeersModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct PeersModel: Codable {
    public let peers: [String]?
    
    enum CodingKeys: String, CodingKey {
        case peers = "Peers"
    }
}

