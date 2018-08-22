//
//  ArgumentsFilesLsModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsFilesLsModel: Codable {
    //    arg [string]: Path to show listing for. Defaults to ‘/’. Required: no.
    let arg: String?
    //    l [bool]: Use long listing format. Required: no.
    let l: Bool?
    
    init(arg: String? = nil,
         l: Bool? = nil) {
        self.arg = arg
        self.l = l
    }
}
