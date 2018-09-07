//
//  ListenersModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ListenersModel: Codable {
    public let listeners: [ListenerModel]?
    
    enum CodingKeys: String, CodingKey {
        case listeners = "Listeners"
    }
}
