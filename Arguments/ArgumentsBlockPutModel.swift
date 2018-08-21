//
//  ArgumentsBlockPutModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 17..
//

import Foundation

public struct ArgumentsBlockPutModel: Codable {
    //    format [string]: cid format for blocks to be created with. Default: “v0”. Required: no.
    let format: String?
    //    mhtype [string]: multihash hash function. Default: “sha2-256”. Required: no.
    let mhtype: String?
    //    mhlen [int]: multihash hash length. Default: “-1”. Required: no.
    let mhlen:Int?
    
    init(format: String? = nil,
         mhtype: String? = nil,
         mhlen: Int? = nil) {
        self.format = format
        self.mhtype = mhtype
        self.mhlen = mhlen
    }
    
    enum CodingKeys: String, CodingKey {
        case format
        case mhtype
        case mhlen
    }
}
