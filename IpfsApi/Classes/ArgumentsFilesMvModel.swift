//
//  ArgumentsFilesMvModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsFilesMvModel: Codable {
    //    arg [string]: Source file to move. Required: yes.
    //    arg [string]: Destination path for file to be moved to. Required: yes.
    public let arg: [String]
    
    init(source: String,
         dest: String) {
        self.arg = [source, dest]
    }
}
