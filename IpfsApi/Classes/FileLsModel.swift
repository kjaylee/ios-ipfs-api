//
//  FileLsModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct FileLsModel: Codable{
    public let arguments: [String:String]?
    public let objects: [String:ObjectModel]?
    
    enum CodingKeys: String, CodingKey {
        case arguments = "Arguments"
        case objects = "Objects"
    }
}
