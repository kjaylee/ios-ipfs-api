//
//  Cell.swift
//  IpfsApi_Example
//
//  Created by we on 2018. 9. 4..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit


class Cell<T>: UICollectionViewCell {
    typealias Item = T
    override var isHighlighted: Bool {
        didSet {
            self.contentView.backgroundColor = isHighlighted ? UIColor(white: 0.0, alpha: 0.02) : .white
        }
    }
    func update(_ item: Item? = nil) {
        
    }
}
