//
//  ViewController.swift
//  IpfsApi
//
//  Created by kjaylee on 08/17/2018.
//  Copyright (c) 2018 kjaylee. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import Ipfs

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Ipfs.swarm.peers { (result) in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode
                // do something with the response data or statusCode
                print("statusCode: \(statusCode)")
                print("result: \(data)")
                break
            case let .failure(error):
                // this means there was a network failure - either the request
                // wasn't sent (connectivity), or no response was received (server
                // timed out).  If the server responds with a 4xx or 5xx error, that
                // will be sent as a ".success"-ful response.
                print("failure: \(error.localizedDescription)")
                break
            }
        }
        
        let service = IAService.swarmPeers(arguments: nil)
        let queue = DispatchQueue(label: service.path, qos: .utility, attributes: [.concurrent])
        Ipfs.shared().rx.request(MultiTarget(service), callbackQueue: queue)
            .filterSuccessfulStatusCodes()
            .map(ResponseSwarmPeersModel.self)
            .subscribe(onSuccess: { (model) in
                print("model count: \(model.peers?.count ?? 0)")
                print("model peers: \(String(describing: model.peers ?? nil))")
            }) { (error) in
                print("failure: \(error.localizedDescription)")
        }.disposed(by: disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

