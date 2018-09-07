//
//  ListVC.swift
//  IpfsApi_Example
//
//  Created by we on 2018. 9. 5..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit
import IGListKit

protocol AdaptedCollectionViewProtocol {
    var collectionView: UICollectionView! { get set }
}

protocol ListVCProtocol where Self: UIViewController {
    associatedtype Item: ListDiffable
    var adapter: ListAdapter? { get set }
    var items: [Item] { get set }
}

extension ListVCProtocol where Self: AdaptedCollectionViewProtocol {
    func initializeListView() {
        adapter?.collectionView = collectionView
        adapter?.dataSource = self as? ListAdapterDataSource
    }
}

