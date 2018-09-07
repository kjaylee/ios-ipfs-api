//
//  ResponseDhtModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ResponseDhtModel: Codable {
    public let id: String?
    public let type: Int?
    public let responses: [AddressModel]?
    public let extra: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case type = "Type"
        case responses = "Responses"
        case extra = "Extra"
    }
}
