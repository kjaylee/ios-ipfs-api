//
//  Demo.swift
//  IpfsApi_Example
//
//  Created by we on 2018. 9. 4..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit
import IGListKit

class Demo: ListDiffable {
    typealias Handler = ()->()
    var title: String = ""
    var handler: Handler?
    init(title:String, handler: Handler? = nil) {
        self.title = title 
        self.handler = handler
    }
    func diffIdentifier() -> NSObjectProtocol {
        return title as NSString
    }
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return self.diffIdentifier().isEqual(object?.diffIdentifier())
    }
}
