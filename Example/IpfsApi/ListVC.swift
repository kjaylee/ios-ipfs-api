//
//  ListVC.swift
//  IpfsApi_Example
//
//  Created by we on 2018. 9. 5..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit
import IGListKit

class ListVC<T: ListDiffable, LSC: ListSectionController>:
UIViewController, ListVCProtocol, ListAdapterDataSource {
   
    var workingRangeSize: Int = 3
    
    lazy var adapter: ListAdapter? = {
       return ListAdapter(updater: ListAdapterUpdater(),
                          viewController: self,
                          workingRangeSize: workingRangeSize)
    }()
    
    var items: [T] = []
    
    var emptyView: UIView?
    
    typealias Item = T
    typealias ListSC = LSC
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.items as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return ListSC()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return emptyView
        
    }
}

