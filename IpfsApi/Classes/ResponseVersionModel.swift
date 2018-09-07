//
//  ResponseVersionModel.swift
//  Alamofire
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ResponseVersionModel: Codable {
    public let version, commit, repo, system: String?
    public let golang: String?
    
    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case commit = "Commit"
        case repo = "Repo"
        case system = "System"
        case golang = "Golang"
    }
}
