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
    
    init(path: String? = nil,
         long: Bool? = nil) {
        self.arg = path
        self.l = long
    }
}
