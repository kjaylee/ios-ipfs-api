//
//  StreamModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct StreamModel: Codable {
    public let handlerID, streamProtocol, localPeer, localAddress: String?
    public let remotePeer, remoteAddress: String?
    
    enum CodingKeys: String, CodingKey {
        case handlerID = "HandlerID"
        case streamProtocol = "Protocol"
        case localPeer = "LocalPeer"
        case localAddress = "LocalAddress"
        case remotePeer = "RemotePeer"
        case remoteAddress = "RemoteAddress"
    }
}
