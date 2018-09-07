//
//  ArgumentsDhtProvideModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsDhtProvideModel: Codable {
    //    arg [string]: The key[s] to send provide records for. Required: yes.
    public let arg: String
    //    verbose [bool]: Print extra information. Default: “false”. Required: no.
    public let verbose: Bool?
    //    recursive [bool]: Recursively provide entire graph. Default: “false”. Required: no.
    public let recursive: Bool?
    
    init(key: String,
         verbose: Bool? = nil,
         recursive: Bool? = nil) {
        self.arg = key
        self.verbose = verbose
        self.recursive = recursive
    }
}
