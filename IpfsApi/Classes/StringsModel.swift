//
//  StringsModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct StringsModel: Codable {
    let strings: [String]?
    
    enum CodingKeys: String, CodingKey {
        case strings = "Strings"
    }
}

