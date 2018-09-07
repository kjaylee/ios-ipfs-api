//
//  ArgumentsFilesCpModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsFilesCpModel: Codable {
    //    arg [string]: Source object to copy. Required: yes.
    //    arg [string]: Destination to copy object to. Required: yes.
    public let arg: [String]
    
    init(source: String,
         dest: String) {
        self.arg = [source, dest]
    }
}
