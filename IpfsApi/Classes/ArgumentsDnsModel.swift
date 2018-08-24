//
//  ArgumentsDnsModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsDnsModel: Codable {
    //    arg [string]: The domain-name name to resolve. Required: yes.
    let arg: String
    //    recursive [bool]: Resolve until the result is not a DNS link. Default: “false”. Required: no.
    let recursive: Bool?
    
    init(domain: String,
         recursive: Bool? = nil) {
        self.arg = domain
        self.recursive = recursive
    }
}
