//
//  Pinned.swift
//  IpfsApi_Example
//
//  Created by we on 2018. 9. 7..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import Foundation
import IGListKit
import Ipfs

struct Pinned : ModelProtocol {
    typealias Handler = ()->()
    var id: NSString
    var key: String?
    let pinnedObject: ObjectModel?
}

class PinnedVM: ViewModel<Pinned> {
    typealias Handler = ()->()
    var image: UIImage?
    var key: String?
    {
        set {
            self.model.key = newValue
        }
        get {
            return self.model.key
        }
    }
    var type: String?
    {
        get {
            return self.model.pinnedObject?.type
        }
    }
}
