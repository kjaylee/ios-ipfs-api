//
//  PeerModel.swift
//  Alamofire
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct PeerModel: Codable {
    public let addr, peer, latency, muxer: String?
    public let streams: [StreamModel]?
    
    enum CodingKeys: String, CodingKey {
        case addr = "Addr"
        case peer = "Peer"
        case latency = "Latency"
        case muxer = "Muxer"
        case streams = "Streams"
    }
}
