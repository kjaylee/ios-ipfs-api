//
//  ArgumentsDhtFindpeerModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 17..
//

import Foundation

public struct ArgumentsDhtFindpeerModel: Codable {
    //    arg [string]: The ID of the peer to search for. Required: yes.
    public let arg: String
    //    verbose [bool]: Print extra information. Default: “false”. Required: no.
    public let verbose: Bool?
    
    init(peerID: String,
         verbose: Bool? = nil) {
        self.arg = peerID
        self.verbose = verbose
    }
}
