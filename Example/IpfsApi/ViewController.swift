//
//  ViewController.swift
//  IpfsApi
//
//  Created by kjaylee on 08/17/2018.
//  Copyright (c) 2018 kjaylee. All rights reserved.
//

import UIKit
import IpfsApi

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Ipfs.shared().swarmPeers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

