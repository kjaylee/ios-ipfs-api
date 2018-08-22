//
//  PeerModel.swift
//  Alamofire
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct PeerModel: Codable {
    let addr, peer, latency, muxer: String?
    let streams: [StreamModel]?
    
    enum CodingKeys: String, CodingKey {
        case addr = "Addr"
        case peer = "Peer"
        case latency = "Latency"
        case muxer = "Muxer"
        case streams = "Streams"
    }
}
