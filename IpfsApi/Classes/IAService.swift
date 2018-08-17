//
//  IAService.swift
//  ipfs-api service
//
//  Created by Jay on 2018. 4. 25..
//  Copyright © 2018년 Jay All rights reserved.
//
// ipfs-api service
import Foundation
import Moya


enum IAService {
    case swarmPeers()
}

extension IAService: TargetType {
    
    var baseURL: URL {
        return URL(string: Ipfs.shared().baseAddress)!
    }
    
    var path: String {
        switch self {
        case .swarmPeers:
            return "/swarm/peers"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .swarmPeers:
            return .get
        }
    }
    
    var sampleData: Data {
       return "{}".utf8Encoded
    }
    
    var task: Task {
        switch self {
        case .swarmPeers():
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
//        case .postMemberLoginResult,
//             .postMemberLoginSalt:
//            return ["Content-type": "application/x-www-form-urlencoded"]
        default:
            return ["Content-type": "application/json"]
        }
        
    }
}

// MARK: - Helpers
fileprivate extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

fileprivate extension Dictionary {
    var jsonData: Data {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        } catch {
            return Data()
        }
    }
}

fileprivate extension Array {
    var jsonData: Data {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        } catch {
            return Data()
        }
    }
}
