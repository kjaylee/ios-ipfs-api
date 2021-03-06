//
//  ArgumentsFilesMkdirModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsFilesMkdirModel: Codable {
    //    arg [string]: Path to dir to make. Required: yes.
    public let arg: String
    //    parents [bool]: No error if existing, make parent directories as needed. Required: no.
    public let parents: Bool?
    
    init(path: String,
         parents: Bool? = nil) {
        self.arg = path
        self.parents = parents
    }
}
