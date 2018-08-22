//
//  ArgumentsObjectLinksModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsObjectLinksModel: Codable {
    //    arg [string]: Key of the object to retrieve, in base58-encoded multihash format. Required: yes.
    let arg: String
    //    headers [bool]: Print table headers (Hash, Size, Name). Default: “false”. Required: no.
    let headers: Bool?
    
    init(arg: String,
         headers: Bool? = nil) {
        self.arg = arg
        self.headers = headers
    }
}
