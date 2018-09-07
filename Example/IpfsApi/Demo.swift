//
//  Demo.swift
//  IpfsApi_Example
//
//  Created by we on 2018. 9. 6..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import Foundation
import IGListKit
import Ipfs

struct Demo : ModelProtocol {
    typealias Handler = ()->()
    var id: NSString
    var title: String?
    var handler: Handler?
}

class DemoVM: ViewModel<Demo> {
    typealias Handler = ()->()
    var title: String?
    {
        set {
            self.model.title = newValue
        }
        get {
            return self.model.title
        }
    }
    var handler: Handler?
    {
        set {
            self.model.handler = newValue
        }
        get {
            return self.model.handler
        }
    }
}
