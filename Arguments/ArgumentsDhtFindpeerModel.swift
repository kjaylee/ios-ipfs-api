//
//  ArgumentsDhtFindpeerModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 17..
//

import Foundation

public struct ArgumentsDhtFindpeerModel: Codable {
//    arg [string]: The ID of the peer to search for. Required: yes.
    let arg: String
//    verbose [bool]: Print extra information. Default: “false”. Required: no.
    let verbose: Bool?
    
    init(arg: String,
         verbose: Bool? = nil) {
        self.arg = arg
        self.verbose = verbose
    }
}
