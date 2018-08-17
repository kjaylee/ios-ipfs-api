//
//  Ipfs.swift
//  ipfsApi
//
//  Created by Jay on 2018. 8. 16..
//

import Foundation
import Moya

public class Ipfs : MoyaProvider<MultiTarget> {
    
    var baseAddress: String = "http://127.0.0.1:5001/api/v0"
    
    private static var sharedProvider: Ipfs = {
        #if DEBUG
        let provider = Ipfs(
            plugins: [NetworkLoggerPlugin(verbose: true)]
        )
        #else
        let provider = IAProvider()
        #endif
        return provider
    }()
    
    public class func shared() -> Ipfs {
        return sharedProvider
    }
}

//Initialize IPFS host address
extension Ipfs {
    public func setBase(address:String, port:Int? = 5001, apiVersionPath:String? = "/api/v0") {
        self.baseAddress = address + String(describing: ":\(port!)") + apiVersionPath!
    }
}

extension Ipfs {
//    public func swarmPeers() {
//        self.request(MultiTarget(IAService.swarmPeers())) { (result) in
//            
//        }
//    }
}

