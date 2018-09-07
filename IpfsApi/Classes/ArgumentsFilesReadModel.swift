//
//  ArgumentsFilesReadModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsFilesReadModel: Codable {
    //    arg [string]: Path to file to be read. Required: yes.
    public let arg: String
    //    offset [int]: Byte offset to begin reading from. Required: no.
    public let offset: Int?
    //    count [int]: Maximum number of bytes to read. Required: no.
    public let count: Int?
    
    init(path: String,
         offset: Int? = nil,
         count: Int? = nil) {
        self.arg = path
        self.offset = offset
        self.count = count
    }
}
