//
//  ArgumentsStatsBwModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsStatsBwModel: Codable {
    //    peer [string]: Specify a peer to print bandwidth for. Required: no.
    let peer: String?
    //    proto [string]: Specify a protocol to print bandwidth for. Required: no.
    let proto: String?
    //    poll [bool]: Print bandwidth at an interval. Default: “false”. Required: no.
    let poll: Bool?
    //    interval [string]: Time interval to wait between updating output, if ‘poll’ is true.
    //    This accepts durations such as “300s”, “1.5h” or “2h45m”. Valid time units are: “ns”, “us” (or “µs”), “ms”, “s”, “m”, “h”. Default: “1s”. Required: no.
    let interval: String?
    
    init(peer: String? = nil,
         proto: String? = nil,
         poll: Bool? = nil,
         interval: String? = nil) {
        self.peer = peer
        self.proto = proto
        self.poll = poll
        self.interval = interval
    }
}
