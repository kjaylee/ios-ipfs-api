//
//  ArgumentsMountModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsMountModel: Codable {
    //    ipfs-path [string]: The path where IPFS should be mounted. Required: no.
    public let ipfsPath: String?
    //    ipns-path [string]: The path where IPNS should be mounted. Required: no.
    public let ipnsPath: String?
    
    init(ipfsPath: String? = nil,
         ipnsPath: String? = nil) {
        self.ipfsPath = ipfsPath
        self.ipnsPath = ipnsPath
    }
    enum CodingKeys: String, CodingKey {
        case ipfsPath = "ipfs-path"
        case ipnsPath = "ipns-path"
    }
}
