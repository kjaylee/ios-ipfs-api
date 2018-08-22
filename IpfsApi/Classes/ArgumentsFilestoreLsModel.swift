//
//  ArgumentsFilestoreLsModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsFilestoreLsModel: Codable {
    //    arg [string]: Cid of objects to list. Required: no.
    let arg: String?
    //    file-order [bool]: sort the results based on the path of the backing file. Required: no.
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
