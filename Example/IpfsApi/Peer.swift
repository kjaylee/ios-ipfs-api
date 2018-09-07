//
//  Peer.swift
//  IpfsApi_Example
//
//  Created by we on 2018. 9. 6..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import Foundation
import IGListKit
import Ipfs

extension PeerModel : ModelProtocol {
    public var id: NSString {
        return self.addr! as NSString
    }
}

class PeerVM: ViewModel<PeerModel> {

}
