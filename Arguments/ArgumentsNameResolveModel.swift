//
//  ArgumentsNameResolveModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsNameResolveModel: Codable {
    //    arg [string]: The IPNS name to resolve. Defaults to your node’s peerID. Required: no.
    let arg: String?
    //    recursive [bool]: Resolve until the result is not an IPNS name. Default: “false”. Required: no.
    let recursive: Bool?
    //    nocache [bool]: Do not use cached entries. Default: “false”. Required: no.
    let nocache: Bool?

    
    init(arg: String? = nil,
         recursive: Bool? = nil,
         nocache: Bool? = nil) {
        self.arg = arg
        self.recursive = recursive
        self.nocache = nocache
    }
}
