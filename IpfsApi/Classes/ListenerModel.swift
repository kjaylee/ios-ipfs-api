//
//  ListenerModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ListenerModel: Codable {
    let listenerProtocol, address: String?
    
    enum CodingKeys: String, CodingKey {
        case listenerProtocol = "Protocol"
        case address = "Address"
    }
}
