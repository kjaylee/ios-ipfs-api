//
//  MountModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct MountModel: Codable {
    let ipfs, ipns: String?
    let fuseAllowOther: Bool?
    
    enum CodingKeys: String, CodingKey {
        case ipfs = "IPFS"
        case ipns = "IPNS"
        case fuseAllowOther = "FuseAllowOther"
    }
}

