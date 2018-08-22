//
//  ArgumentsFilesWriteModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsFilesWriteModel: Codable {
    //    arg [string]: Path to write to. Required: yes.
    let arg: String
    //    offset [int]: Byte offset to begin writing at. Required: no.
    let offset: Int?
    //    create [bool]: Create the file if it does not exist. Required: no.
    let create: Bool?
    //    truncate [bool]: Truncate the file to size zero before writing. Required: no.
    let truncate: Bool?
    //    count [int]: Maximum number of bytes to read. Required: no.
    let count: Int?
    
    init(arg: String,
         offset: Int? = nil,
         create: Bool? = nil,
         truncate: Bool? = nil,
         count: Int? = nil) {
        self.arg = arg
        self.offset = offset
        self.create = create
        self.truncate = truncate
        self.count = count
    }
}
