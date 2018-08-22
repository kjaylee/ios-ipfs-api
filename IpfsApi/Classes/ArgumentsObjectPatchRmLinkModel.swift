//
//  ArgumentsObjectPatchRmLinkModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsObjectPatchRmLinkModel: Codable {
    //    arg [string]: The hash of the node to modify. Required: yes.
    //    arg [string]: Name of the link to remove. Required: yes.
    let arg: [String]
    
    init(root: String,
         link: String) {
        self.arg = [root, link]
    }
}
