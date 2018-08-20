//
//  ArgumentsBlockPutModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 17..
//

import Foundation

public struct ArgumentsBlockPutModel: Encodable {
//    arg [file]: The data to be stored as an IPFS block. Required: yes.
    let arg: Data
//    format [string]: cid format for blocks to be created with. Default: “v0”. Required: no.
    let format: String?
//    mhtype [string]: multihash hash function. Default: “sha2-256”. Required: no.
    let mhtype: String?
//    mhlen [int]: multihash hash length. Default: “-1”. Required: no.
    let mhlen:Int?
    
    init(arg: Data,
         format: String? = nil,
         mhtype: String? = nil,
         mhlen: Int? = nil) {
        self.arg = arg
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
