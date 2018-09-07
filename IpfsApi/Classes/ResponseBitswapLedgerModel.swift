//
//  ResponseBitswapLedgerModel.swift
//  Alamofire
//
//  Created by we on 2018. 8. 17..
//

import Foundation

public struct ResponseBitswapLedgerModel: Codable {
    public let peer: String?
    public let value: Float64?
    public let sent: UInt64?
    public let recv: UInt64?
    public let exchanged: UInt64?
    
    enum CodingKeys: String, CodingKey {
        case peer = "Peer"
        case value = "Value"
        case sent = "Sent"
        case recv = "Recv"
        case exchanged = "Exchanged"
    }
}
