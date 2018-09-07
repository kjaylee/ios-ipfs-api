//
//  ArgumentsObjectPutModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsObjectPutModel: Codable {
    //    inputenc [string]: Encoding type of input data. One of: {“protobuf”, “json”}. Default: “json”. Required: no.
    public let inputenc: String?
    //    datafieldenc [string]: Encoding type of the data field, either “text” or “base64”. Default: “text”. Required: no.
    public let datafieldenc: String?
    //    pin [bool]: Pin this object when adding. Default: “false”. Required: no.
    public let pin: Bool?
    
    init(inputenc: String? = nil,
         datafieldenc: String? = nil,
         pin: Bool? = nil) {
        self.inputenc = inputenc
        self.datafieldenc = datafieldenc
        self.pin = pin
    }
}
