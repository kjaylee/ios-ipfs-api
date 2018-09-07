//
//  ArgumentsPingModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsPingModel: Codable {
    //    arg [string]: ID of peer to be pinged. Required: yes.
    public let arg: String
    //    count [int]: Number of ping messages to send. Default: “10”. Required: no.
    public let count: Int?
    
    init(peerID: String,
         count: Int? = nil) {
        self.arg = peerID
        self.count = count
    }
}
