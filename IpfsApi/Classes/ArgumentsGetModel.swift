//
//  ArgumentsGetModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsGetModel: Codable {
    //    arg [string]: The path to the IPFS object(s) to be outputted. Required: yes.
    public let arg: String
    //    output [string]: The path where the output should be stored. Required: no.
    public let output: String?
    //    archive [bool]: Output a TAR archive. Default: “false”. Required: no.
    public let archive: Bool?
    //    compress [bool]: Compress the output with GZIP compression. Default: “false”. Required: no.
    public let compress: Bool?
    //    compression-level [int]: The level of compression (1-9). Default: “-1”. Required: no.
    public let compressionLevel: Int?
    
    init(arg: String,
         output: String? = nil,
         archive: Bool? = nil,
         compress: Bool? = nil,
         compressionLevel: Int? = nil) {
        self.arg = arg
        self.output = output
        self.archive = archive
        self.compress = compress
        self.compressionLevel = compressionLevel
    }
    
    enum CodingKeys: String, CodingKey {
        case arg
        case output
        case archive
        case compress
        case compressionLevel = "compression-level"
    }
}
