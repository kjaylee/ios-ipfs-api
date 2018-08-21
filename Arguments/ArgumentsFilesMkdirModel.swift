//
//  ArgumentsFilesMkdirModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsFilesMkdirModel: Codable {
    //    arg [string]: Path to dir to make. Required: yes.
    let arg: String
    //    parents [bool]: No error if existing, make parent directories as needed. Required: no.
    let parents: Bool?
    
    init(arg: String,
         parents: Bool? = nil) {
        self.arg = arg
        self.parents = parents
    }
}
