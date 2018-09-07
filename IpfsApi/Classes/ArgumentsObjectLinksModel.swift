//
//  ArgumentsObjectLinksModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsObjectLinksModel: Codable {
    //    arg [string]: Key of the object to retrieve, in base58-encoded multihash format. Required: yes.
    public let arg: String
    //    headers [bool]: Print table headers (Hash, Size, Name). Default: “false”. Required: no.
    public let headers: Bool?
    
    init(multihash: String,
         headers: Bool? = nil) {
        self.arg = multihash
        self.headers = headers
    }
}
