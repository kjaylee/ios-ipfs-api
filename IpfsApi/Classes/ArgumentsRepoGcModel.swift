//
//  ArgumentsRepoGcModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsRepoGcModel: Codable {
    //    quiet [bool]: Write minimal output. Default: “false”. Required: no.
    public let quiet: Bool?
    //    stream-errors [bool]: Stream errors. Default: “false”. Required: no.
    public let streamErrors: Bool?
    
    init(quiet: Bool? = nil,
         streamErrors: Bool? = nil) {
        self.quiet = quiet
        self.streamErrors = streamErrors
    }
    
    enum CodingKeys: String, CodingKey {
        case quiet
        case streamErrors = "stream-errors"
    }
}
