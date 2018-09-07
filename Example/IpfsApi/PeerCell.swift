//
//  PeerCell.swift
//  IpfsApi_Example
//
//  Created by we on 2018. 9. 6..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit

class PeerCell: Cell<PeerVM> {
    typealias Item = PeerVM
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    override func update(_ item: Item? = nil) {
        guard let item = item else { return }
        titleLabel.text = item.model.addr
        subtitleLabel.text = item.model.peer
    }
}
