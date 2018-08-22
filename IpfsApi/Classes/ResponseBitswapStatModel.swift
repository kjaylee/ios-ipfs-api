//
//  ResponseBitswapStatModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ResponseBitswapStatModel: Codable {
    let provideBufLen: Int?
    let wantlist: [String]?
    let peers: [String]?
    let blocksReceived, dataReceived, blocksSent, dataSent: UInt64?
    let dupBlksReceived, dupDataReceived: UInt64?
    
    enum CodingKeys: String, CodingKey {
        case provideBufLen = "ProvideBufLen"
        case wantlist = "Wantlist"
        case peers = "Peers"
        case blocksReceived = "BlocksReceived"
        case dataReceived = "DataReceived"
        case blocksSent = "BlocksSent"
        case dataSent = "DataSent"
        case dupBlksReceived = "DupBlksReceived"
        case dupDataReceived = "DupDataReceived"
    }
}

