//
//  ResponseSwarmPeersModel.swift
//  Alamofire
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ResponseSwarmPeersModel: Codable {
    public let peers: [PeerModel]?
    
    enum CodingKeys: String, CodingKey {
        case peers = "Peers"
    }
}

