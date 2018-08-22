//
//  ResponsePinVerifyModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ResponsePinVerifyModel: Codable {
    let cid: String?
    let pinStatus: PinStatusModel?
    
    enum CodingKeys: String, CodingKey {
        case cid = "Cid"
        case pinStatus = "PinStatus"
    }
}
