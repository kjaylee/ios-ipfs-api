//
//  ViewController.swift
//  IpfsApi
//
//  Created by kjaylee on 08/17/2018.
//  Copyright (c) 2018 kjaylee. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import Ipfs
import IGListKit
import PopupDialog

class ViewController: UIViewController {
    typealias Item = Demo
    @IBOutlet weak var collectionView: UICollectionView!
    
    let disposeBag = DisposeBag()
    
    var items = [Item]()
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 3)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ios-ipfs-api Demo"
        initializeItems()
        initializeCollectionView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.items[0].title = "1. Host - \(Ipfs.shared().address())"
    }
}
extension ViewController {
    func initializeItems() {
        self.items.append(Item(title:"1. Host - \(Ipfs.shared().address())", handler: {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "TextFieldVC") as? TextFieldVC else { return }
            vc.title = "Change host"
            vc.subtitle = "host address"
            vc.placeholder = Ipfs.shared().address()
            self.present(PopupDialog(viewController: vc), animated: true, completion: {
                
            })
        }))
        self.items.append(Item(title:"2"))
        self.items.append(Item(title:"3"))
        self.items.append(Item(title:"4"))
        self.items.append(Item(title:"5"))
        self.items.append(Item(title:"6"))
        self.items.append(Item(title:"7"))
        self.items.append(Item(title:"8"))
        self.items.append(Item(title:"9"))
        self.items.append(Item(title:"10"))
        self.items.append(Item(title:"11"))
        self.items.append(Item(title:"12"))
        self.items.append(Item(title:"13"))
        self.items.append(Item(title:"14"))
        self.items.append(Item(title:"15"))
        self.items.append(Item(title:"16"))
        self.items.append(Item(title:"17"))
        self.items.append(Item(title:"18"))
        self.items.append(Item(title:"19"))
    }
}
//MARK: - DataSource
extension ViewController: ListAdapterDataSource {
    func initializeCollectionView() {
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.items as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return DemoLSC()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
        
    }
}

