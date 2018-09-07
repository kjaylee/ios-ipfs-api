//
//  ArgumentsKeyRmModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsKeyRmModel: Codable {
    //    arg [string]: names of keys to remove Required: yes.
    public let arg: String
    //    l [bool]: Show extra information about keys. Required: no.
    public let l: Bool?
    
    init(name: String,
         information: Bool? = nil) {
        self.arg = name
        self.l = information
    }
}
