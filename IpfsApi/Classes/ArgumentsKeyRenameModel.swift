//
//  ArgumentsKeyRenameModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsKeyRenameModel: Codable {
    //    arg [string]: name of key to rename Required: yes.
    //    arg [string]: new name of the key Required: yes.
    let arg: [String]
    //    force [bool]: Allow to overwrite an existing key. Required: no.
    let force: Bool?
    
    init(oldName: String,
         newName: String,
         force: Bool? = nil) {
        self.arg = [oldName, newName]
        self.force = force
    }
}
