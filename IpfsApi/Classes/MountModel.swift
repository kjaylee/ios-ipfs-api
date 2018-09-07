//
//  MountModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct MountModel: Codable {
    public let ipfs, ipns: String?
    public let fuseAllowOther: Bool?
    
    enum CodingKeys: String, CodingKey {
        case ipfs = "IPFS"
        case ipns = "IPNS"
        case fuseAllowOther = "FuseAllowOther"
    }
}

