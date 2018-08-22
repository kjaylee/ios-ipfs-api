//
//  ArgumentsKeyRmModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsKeyRmModel: Codable {
    //    arg [string]: names of keys to remove Required: yes.
    let arg: String
    //    l [bool]: Show extra information about keys. Required: no.
    let l: Bool?
    
    init(arg: String,
         l: Bool? = nil) {
        self.arg = arg
        self.l = l
    }
}
