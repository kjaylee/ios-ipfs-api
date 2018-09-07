//
//  ArgumentsPubsubPubModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsPubsubPubModel: Codable {
    //    arg [string]: Topic to publish to. Required: yes.
    //    arg [string]: Payload of message to publish. Required: yes.
    public let arg: [String]
    
    init(topic: String,
         data: String) {
        self.arg = [topic, data]
    }
}
