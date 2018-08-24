//
//  ArgumentsDhtGetModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsDhtGetModel: Codable {
    //    arg [string]: The key to find a value for. Required: yes.
    let arg: String
    //    verbose [bool]: Print extra information. Default: “false”. Required: no.
    let verbose: Bool?
    
    init(key: String,
         verbose: Bool? = nil) {
        self.arg = key
        self.verbose = verbose
    }
}
