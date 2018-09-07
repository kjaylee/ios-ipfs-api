//
//  PeerLSC.swift
//  IpfsApi_Example
//
//  Created by we on 2018. 9. 6..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit
import IGListKit

class PeerLSC: ListSectionController {
    typealias Item = PeerVM
    
    var item: Item!
    override init(){
        super.init()
        inset = UIEdgeInsets(top:0, left:0, bottom: 1, right: 0)
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext, let _ = item else { return .zero }
        let width = context.containerSize.width
        let height: CGFloat = 60.0
        return CGSize(width: width, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cellIdentifier = "PeerCell"
        guard let cell = collectionContext?.dequeueReusableCellFromStoryboard(withIdentifier: cellIdentifier, for: self, at: index) as? PeerCell else {fatalError()}
        cell.update(item)
        
        return cell
    }
    
    
    
    override func didUpdate(to object: Any) {
        item = object as? Item
    }
    
    override func didSelectItem(at index: Int) {
        collectionContext?.cellForItem(at: index, sectionController: self)?.isSelected = false
    }
}
