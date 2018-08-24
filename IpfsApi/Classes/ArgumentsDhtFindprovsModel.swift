//
//  ArgumentsDhtFindprovsModel.swift
//  Alamofire
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsDhtFindprovsModel: Codable {
    //    arg [string]: The key to find providers for. Required: yes.
    let arg: String
    //    verbose [bool]: Print extra information. Default: “false”. Required: no.
    let verbose: Bool?
    //    num-providers [int]: The number of providers to find. Default: “20”. Required: no.
    let numProviders: Int?
    
    init(key: String,
         verbose: Bool? = nil,
         numProviders: Int? = nil) {
        self.arg = key
        self.verbose = verbose
        self.numProviders = numProviders
    }
    
    enum CodingKeys: String, CodingKey {
        case arg
        case verbose
        case numProviders = "num-providers"
    }
}
