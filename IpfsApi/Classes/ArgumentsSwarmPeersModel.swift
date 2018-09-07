//
//  ArgumentsSwarmPeersModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsSwarmPeersModel: Codable {
    //    verbose [bool]: display all extra information. Required: no.
    public let verbose: Bool?
    //    streams [bool]: Also list information about open streams for each peer. Required: no.
    public let streams: Bool?
    //    latency [bool]: Also list information about latency to each peer. Required: no.
    public let latency: Bool?
    
    init(verbose: Bool? = nil,
         streams: Bool? = nil,
         latency: Bool? = nil) {
        self.verbose = verbose
        self.streams = streams
        self.latency = latency
    }
}
