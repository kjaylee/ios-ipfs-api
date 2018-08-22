//
//  ArgumentsP2pStreamDialModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsP2pStreamDialModel: Codable {
    //    arg [string]: Remote peer to connect to Required: yes.
    //    arg [string]: Protocol identifier. Required: yes.
    //    arg [string]: Address to listen for connection/s (default: /ip4/127.0.0.1/tcp/0). Required: no.
    let arg: [String]
    
    init(peer: String,
         protocolID: String,
         bindAddress: String? = nil) {
        var args = [peer, protocolID]
        if let address = bindAddress {
            args.append(address)
        }
        self.arg = args
    }
}
