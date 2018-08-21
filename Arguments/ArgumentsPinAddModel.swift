//
//  ArgumentsPinAddModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsPinAddModel: Codable {
    //    arg [string]: Path to object(s) to be pinned. Required: yes.
    let arg: String
    //    recursive [bool]: Recursively pin the object linked to by the specified object(s). Default: “true”. Required: no.
    let recursive: Bool?
    //    progress [bool]: Show progress. Required: no.
    let progress: Bool?
    
    init(arg: String,
         recursive: Bool? = nil,
         progress: Bool? = nil) {
        self.arg = arg
        self.recursive = recursive
        self.progress = progress
    }
}
