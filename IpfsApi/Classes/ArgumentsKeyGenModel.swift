//
//  ArgumentsKeyGenModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsKeyGenModel: Codable {
    //    arg [string]: name of key to create Required: yes.
    let arg: String
    //    type [string]: type of the key to create [rsa, ed25519]. Required: no.
    let type: String?
    //    size [int]: size of the key to generate. Required: no.
    let size: Int?
    
    init(name: String,
         type: String? = nil,
         size: Int? = nil) {
        self.arg = name
        self.type = type
        self.size = size
    }
}
