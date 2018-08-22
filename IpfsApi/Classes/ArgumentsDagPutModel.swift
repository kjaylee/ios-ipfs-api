//
//  ArgumentsDagPutModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 17..
//

import Foundation

public struct ArgumentsDagPutModel: Codable {
    //    format [string]: Format that the object will be added as. Default: “cbor”. Required: no.
    let format: String?
    //    input-enc [string]: Format that the input object will be. Default: “json”. Required: no.
    let inputEnc: String?
    //    pin [bool]: Pin this object when adding. Default: “false”. Required: no.
    let pin: Bool?
    //    hash [string]: Hash function to use. Default: . Required: no.
    let hash: String?
    
    init(format: String? = nil,
         inputEnc: String? = nil,
         pin: Bool? = nil,
         hash: String? = nil) {
        self.format = format
        self.inputEnc = inputEnc
        self.pin = pin
        self.hash = hash
    }
    
    enum CodingKeys: String, CodingKey {
        case format
        case inputEnc = "input-enc"
        case pin
        case hash
    }
}
