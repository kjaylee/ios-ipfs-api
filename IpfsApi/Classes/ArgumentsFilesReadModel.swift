//
//  ArgumentsFilesReadModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsFilesReadModel: Codable {
    //    arg [string]: Path to file to be read. Required: yes.
    let arg: String
    //    offset [int]: Byte offset to begin reading from. Required: no.
    let offset: Int?
    //    count [int]: Maximum number of bytes to read. Required: no.
    let count: Int?
    
    init(arg: String,
         offset: Int? = nil,
         count: Int? = nil) {
        self.arg = arg
        self.offset = offset
        self.count = count
    }
}
