//
//  ArgumentsObjectDiffModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsObjectDiffModel: Codable {
    //    arg [string]: Object to diff against. Required: yes.
    //    arg [string]: Object to diff. Required: yes.
    let arg: [String]
    //    verbose [bool]: Print extra information. Required: no.
    let verbose: Bool?
    
    init(objA: String,
         objB: String,
         verbose: Bool? = nil) {
        self.arg = [objA, objB]
        self.verbose = verbose
    }
}
