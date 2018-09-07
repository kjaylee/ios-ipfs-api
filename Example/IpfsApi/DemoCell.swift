//
//  DemoCell.swift
//  IpfsApi_Example
//
//  Created by we on 2018. 9. 6..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit

class DemoCell: Cell<DemoVM> {
    typealias Item = DemoVM
    @IBOutlet weak var titleLabel: UILabel!
    override func update(_ item: Item? = nil) {
        guard let item = item else { return }
        self.titleLabel.text = item.title
    }
}
