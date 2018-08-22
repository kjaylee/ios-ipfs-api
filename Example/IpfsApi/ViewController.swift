//
//  ViewController.swift
//  IpfsApi
//
//  Created by kjaylee on 08/17/2018.
//  Copyright (c) 2018 kjaylee. All rights reserved.
//

import UIKit
import Ipfs

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Ipfs.swarm.peers { (result) in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode
            // do something with the response data or statusCode
                break
            case let .failure(error):
                // this means there was a network failure - either the request
                // wasn't sent (connectivity), or no response was received (server
                // timed out).  If the server responds with a 4xx or 5xx error, that
                // will be sent as a ".success"-ful response.
                break
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

