//
//  ViewModel.swift
//  IpfsApi_Example
//
//  Created by we on 2018. 9. 4..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit
import IGListKit
import Ipfs

class ViewModel<T: ModelProtocol>: ListDiffable {
    var model: T
    init(model:T) {
        self.model = model
    }
    func diffIdentifier() -> NSObjectProtocol {
        return self.model.id
    }
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return self.diffIdentifier().isEqual(object?.diffIdentifier())
    }
}

