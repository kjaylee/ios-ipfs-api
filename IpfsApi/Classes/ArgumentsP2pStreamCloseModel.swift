//
//  ArgumentsP2pStreamCloseModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsP2pStreamCloseModel: Codable {
    //    arg [string]: Stream HandlerID Required: no.
    public let arg: String?
    //    all [bool]: Close all streams. Default: “false”. Required: no.
    public let all: Bool?
    
    init(arg: String? = nil,
         all: Bool? = nil) {
        self.arg = arg
        self.all = all
    }
}
