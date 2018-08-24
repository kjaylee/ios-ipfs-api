//
//  ArgumentsIdModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsIdModel: Codable {
    //    arg [string]: Peer.ID of node to look up. Required: no.
    let arg: String?
    //    format [string]: Optional output format. Required: no.
    let format: String?
    
    init(peerID: String? = nil,
         format: String? = nil) {
        self.arg = peerID
        self.format = format
    }
}
