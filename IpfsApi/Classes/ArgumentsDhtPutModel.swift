//
//  ArgumentsDhtPutModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsDhtPutModel: Codable {
    //    arg [string]: The key to store the value at. Required: yes.
    //    arg [string]: The value to store. Required: yes.
    public let arg: [String]
    //    verbose [bool]: Print extra information. Default: “false”. Required: no.
    public let verbose: Bool?
   
    init(key: String,
         value: String,
         verbose: Bool? = nil) {
        self.arg = [key, value]
        self.verbose = verbose
    }
}
