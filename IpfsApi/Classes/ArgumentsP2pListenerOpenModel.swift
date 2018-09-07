//
//  ArgumentsP2pListenerOpenModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsP2pListenerOpenModel: Codable {
    //    arg [string]: Protocol identifier. Required: yes.
    //    arg [string]: Request handling application address. Required: yes.
    public let arg: [String]
    
    init(protocolID: String,
         address: String) {
        self.arg = [protocolID, address]
    }
}
