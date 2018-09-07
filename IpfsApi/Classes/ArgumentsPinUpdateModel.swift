//
//  ArgumentsPinUpdateModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsPinUpdateModel: Codable {
    //    arg [string]: Path to old object. Required: yes.
    //    arg [string]: Path to new object to be pinned. Required: yes.
    public let arg: [String]
    //    unpin [bool]: Remove the old pin. Default: “true”. Required: no.
    public let unpin: Bool?
    
    init(fromPath: String,
         toPath: String,
         unpin: Bool? = nil) {
        self.arg = [fromPath, toPath]
        self.unpin = unpin
    }
}
