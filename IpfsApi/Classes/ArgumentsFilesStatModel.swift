//
//  ArgumentsFilesStatModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsFilesStatModel: Codable {
    //    arg [string]: Path to node to stat. Required: yes.
    let arg: String
    //    format [string]: Print statistics in given format. Allowed tokens: . Conflicts with other format options. Default: Size: CumulativeSize: ChildBlocks: Type: . Default: “ Size: CumulativeSize: ChildBlocks: Type: ”. Required: no.
    let format: String?
    //    hash [bool]: Print only hash. Implies ‘–format=’. Conflicts with other format options. Default: “false”. Required: no.
    let hash: Bool?
    //    size [bool]: Print only size. Implies ‘–format=’. Conflicts with other format options. Default: “false”. Required: no.
    let size: Bool?
    
    init(arg: String,
         format: String? = nil,
         hash: Bool? = nil,
         size: Bool? = nil) {
        self.arg = arg
        self.format = format
        self.hash = hash
        self.size = size
    }
}
