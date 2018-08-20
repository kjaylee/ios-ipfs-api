//
//  ArgumentsDhtQueryModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsDhtQueryModel: Codable {
    //    arg [string]: The peerID to run the query against. Required: yes.
    let arg: String
    //    verbose [bool]: Print extra information. Default: “false”. Required: no.
    let verbose: Bool?
    
    init(arg: String,
         verbose: Bool? = nil) {
        self.arg = arg
        self.verbose = verbose
    }
}
