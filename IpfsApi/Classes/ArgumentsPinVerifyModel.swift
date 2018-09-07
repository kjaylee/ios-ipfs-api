//
//  ArgumentsPinVerifyModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsPinVerifyModel: Codable {
    //    verbose [bool]: Also write the hashes of non-broken pins. Required: no.
    public let verbose: Bool?
    //    quiet [bool]: Write just hashes of broken pins. Required: no.
    public let quiet: Bool?
    
    init(verbose: Bool? = nil,
         quiet: Bool? = nil) {
        self.verbose = verbose
        self.quiet = quiet
    }
}
