//
//  ReferenceModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ReferenceModel: Codable {
    public let ref, error: String?
    
    enum CodingKeys: String, CodingKey {
        case ref = "Ref"
        case error = "Err"
    }
}
