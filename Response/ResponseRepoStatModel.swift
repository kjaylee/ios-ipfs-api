//
//  ResponseRepoStatModel.swift
//  Alamofire
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ResponseRepoStatModel: Codable {
    let numObjects, repoSize: UInt64?
    let repoPath, version: String?
    let storageMax: UInt64?
    
    enum CodingKeys: String, CodingKey {
        case numObjects = "NumObjects"
        case repoSize = "RepoSize"
        case repoPath = "RepoPath"
        case version = "Version"
        case storageMax = "StorageMax"
    }
}
