//
//  ArgumentsBlockRmModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 17..
//

import Foundation

public struct ArgumentsBlockRmModel: Codable {
//arg [string]: Bash58 encoded multihash of block(s) to remove. Required: yes.
    public let arg: String
//force [bool]: Ignore nonexistent blocks. Default: “false”. Required: no.
    public let force: Bool?
//quiet [bool]: Write minimal output. Default: “false”. Required: no.
    public let quiet: Bool?
    
    init(arg: String,
         force: Bool? = nil,
         quiet: Bool? = nil) {
        self.arg = arg
        self.force = force
        self.quiet = quiet
    }

}
