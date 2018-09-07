//
//  ArgumentsNamePublishModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsNamePublishModel: Codable {
    //    arg [string]: ipfs path of the object to be published. Required: yes.
    public let arg: String
    //    resolve [bool]: Resolve given path before publishing. Default: “true”. Required: no.
    public let resolve: Bool?
    //    lifetime [string]: Time duration that the record will be valid for. This accepts durations such as “300s”, “1.5h” or “2h45m”. Valid time units are “ns”, “us” (or “µs”), “ms”, “s”, “m”, “h”. Default: “24h”. Required: no.
    public let lifetime: String?
    //    ttl [string]: Time duration this record should be cached for (caution: experimental). Required: no.
    public let ttl: String?
    //    key [string]: Name of the key to be used or a valid PeerID, as listed by ‘ipfs key list -l’. Default:. Default: “self”. Required: no.
    public let key: String?
    
    init(path: String,
         resolve: Bool? = nil,
         lifetime: String? = nil,
         ttl: String? = nil,
         key: String? = nil) {
        self.arg = path
        self.resolve = resolve
        self.lifetime = lifetime
        self.ttl = ttl
        self.key = key
    }
}
