//
//  ArgumentsDhtProvideModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsDhtProvideModel: Codable {
    //    arg [string]: The key[s] to send provide records for. Required: yes.
    let arg: String
    //    verbose [bool]: Print extra information. Default: “false”. Required: no.
    let verbose: Bool?
    //    recursive [bool]: Recursively provide entire graph. Default: “false”. Required: no.
    let recursive: Bool?
    
    init(arg: String,
         verbose: Bool? = nil,
         recursive: Bool? = nil) {
        self.arg = arg
        self.verbose = verbose
        self.recursive = recursive
    }
}
