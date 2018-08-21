//
//  ArgumentsResolveModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsResolveModel: Codable {
    //    arg [string]: The name to resolve. Required: yes.
    let arg: String
    //    recursive [bool]: Resolve until the result is an IPFS name. Default: “false”. Required: no.
    let recursive: Bool?
    
    init(arg: String,
         recursive: Bool? = nil) {
        self.arg = arg
        self.recursive = recursive
    }
}
