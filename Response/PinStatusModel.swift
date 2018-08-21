//
//  PinStatusModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct PinStatusModel: Codable {
    let ok: Bool?
    let badNodes: [CidModel]?
    
    enum CodingKeys: String, CodingKey {
        case ok = "Ok"
        case badNodes = "BadNodes"
    }
}
