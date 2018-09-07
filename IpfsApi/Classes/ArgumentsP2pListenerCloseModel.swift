//
//  ArgumentsP2pListenerCloseModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsP2pListenerCloseModel: Codable {
    //    arg [string]: P2P listener protocol Required: no.
    public let arg: String?
    //    all [bool]: Close all listeners. Default: “false”. Required: no.
    public let all: Bool?
    
    init(arg: String? = nil,
         all: Bool? = nil) {
        self.arg = arg
        self.all = all
    }
}
