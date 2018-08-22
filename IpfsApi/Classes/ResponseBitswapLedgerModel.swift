//
//  ResponseBitswapLedgerModel.swift
//  Alamofire
//
//  Created by we on 2018. 8. 17..
//

import Foundation

public struct ResponseBitswapLedgerModel: Codable {
    let peer: String?
    let value: Float64?
    let sent: UInt64?
    let recv: UInt64?
    let exchanged: UInt64?
    
    enum CodingKeys: String, CodingKey {
        case peer = "Peer"
        case value = "Value"
        case sent = "Sent"
        case recv = "Recv"
        case exchanged = "Exchanged"
    }
}
