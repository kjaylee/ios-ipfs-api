//
//  ArgumentsLogLevelModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsLogLevelModel: Codable {
    //    arg [string]: The subsystem logging identifier. Use ‘all’ for all subsystems. Required: yes.
    //    arg [string]: The log level, with ‘debug’ the most verbose and ‘critical’ the least verbose. One of: debug, info, warning, error, critical. Required: yes.
    public let arg: [String]
    
    init(subsystem: String,
         level: String) {
        self.arg = [subsystem, level]
    }
}
