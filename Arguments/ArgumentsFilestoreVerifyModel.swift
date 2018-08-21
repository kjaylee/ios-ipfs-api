//
//  ArgumentsFilestoreVerifyModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsFilestoreVerifyModel: Codable {
    //    arg [string]: Cid of objects to verify. Required: no.
    let arg: String?
    //    file-order [bool]: verify the objects based on the order of the backing file. Required: no.
    let fileOrder: Bool?
    
    init(arg: String? = nil,
         fileOrder: Bool? = nil) {
        self.arg = arg
        self.fileOrder = fileOrder
    }
    
    enum CodingKeys: String, CodingKey {
        case arg
        case fileOrder = "file-order"
    }
}
