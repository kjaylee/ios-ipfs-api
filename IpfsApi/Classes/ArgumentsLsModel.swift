//
//  ArgumentsLsModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsLsModel: Codable {
    //    arg [string]: The path to the IPFS object(s) to list links from. Required: yes.
    public let arg: String
    //    headers [bool]: Print table headers (Hash, Size, Name). Default: “false”. Required: no.
    public let headers: Bool?
    //    resolve-type [bool]: Resolve linked objects to find out their types. Default: “true”. Required: no.
    public let resolveType: Bool?
    
    init(arg: String,
         headers: Bool? = nil,
         resolveType: Bool? = nil) {
        self.arg = arg
        self.headers = headers
        self.resolveType = resolveType
    }

    enum CodingKeys: String, CodingKey {
        case arg
        case headers
        case resolveType = "resolve-type"
    }
}
