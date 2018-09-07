//
//  ArgumentsPinRmModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsPinRmModel: Codable {
    //    arg [string]: Path to object(s) to be unpinned. Required: yes.
    public let arg: String
    //    recursive [bool]: Recursively unpin the object linked to by the specified object(s). Default: “true”. Required: no.
    public let recursive: Bool?
    
    init(path: String,
         recursive: Bool? = nil) {
        self.arg = path
        self.recursive = recursive
    }
}
