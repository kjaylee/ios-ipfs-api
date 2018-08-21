//
//  ArgumentsVersionModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsVersionModel: Codable {
    //    number [bool]: Only show the version number. Default: “false”. Required: no.
    let number: Bool?
    //    commit [bool]: Show the commit hash. Default: “false”. Required: no.
    let commit: Bool?
    //    repo [bool]: Show repo version. Default: “false”. Required: no.
    let repo: Bool?
    //    all [bool]: Show all version information. Default: “false”. Required: no.
    let all: Bool?
    
    init(number: Bool? = nil,
         commit: Bool? = nil,
         repo: Bool? = nil,
         all: Bool? = nil) {
        self.number = number
        self.commit = commit
        self.repo = repo
        self.all = all
    }
}
