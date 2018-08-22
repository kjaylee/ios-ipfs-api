//
//  ArgumentsObjectPatchAddLinkModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsObjectPatchAddLinkModel: Codable {
    //    arg [string]: The hash of the node to modify. Required: yes.
    //    arg [string]: Name of link to create. Required: yes.
    //    arg [string]: IPFS object to add link to. Required: yes.
    let arg: [String]
    //    create [bool]: Create intermediary nodes. Default: “false”. Required: no.
    let verbose: Bool?
    
    init(root: String,
         name: String,
         ref: String,
         verbose: Bool? = nil) {
        self.arg = [root, name, ref]
        self.verbose = verbose
    }
}
