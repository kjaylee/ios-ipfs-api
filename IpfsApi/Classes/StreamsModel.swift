//
//  StreamsModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct StreamsModel: Codable {
    let streams: [StreamModel]?
    
    enum CodingKeys: String, CodingKey {
        case streams = "Streams"
    }
}
