//
//  EntriesModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct EntriesModel: Codable{
    let entries: [ObjectModel]?
    
    enum CodingKeys: String, CodingKey {
        case entries = "Entries"
    }
}
