//
//  ArgumentsPubsubSubModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsPubsubSubModel: Codable {
    //    arg [string]: String name of topic to subscribe to. Required: yes.
    let arg: String
    //    discover [bool]: try to discover other peers subscribed to the same topic. Required: no.
    let discover: Bool?
    
    init(arg: String,
         discover: Bool? = nil) {
        self.arg = arg
        self.discover = discover
    }
}
