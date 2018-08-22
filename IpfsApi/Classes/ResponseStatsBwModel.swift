//
//  ResponseStatsBwModel.swift
//  Alamofire
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct ResponseStatsBWModel: Codable {
    let totalIn, totalOut: Int64?
    let rateIn, rateOut: Float64?
    
    enum CodingKeys: String, CodingKey {
        case totalIn = "TotalIn"
        case totalOut = "TotalOut"
        case rateIn = "RateIn"
        case rateOut = "RateOut"
    }
}

