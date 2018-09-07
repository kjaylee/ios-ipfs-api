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
import Hero

class ViewController: ListVC<DemoVM, DemoLSC>, AdaptedCollectionViewProtocol {
    typealias Item = DemoVM
    @IBOutlet weak var collectionView: UICollectionView!
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ios-ipfs-api Demo"
        initializeItems()
        initializeListView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
extension ViewController {
    func initializeItems() {
        self.items.removeAll()
        self.items.append(Item(model: Demo(id: "1", title:"Change Host", handler: {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "TextFieldVC") as? TextFieldVC else { return }
            vc.title = "Change host"
            vc.subtitle = "host address"
            vc.placeholder = Ipfs.shared().address()
            let alert = PopupDialog(viewController: vc)
            alert.addButtons([
                DefaultButton(title: "Save", action: {
                    if vc.textField != nil {
                        Ipfs.shared().setBase(fullAddress: vc.textField.text!)
                    }
                }),
                DefaultButton(title: "Reset", action: {
                    Ipfs.shared().setBase(fullAddress:"http://127.0.0.1:5001/api/v0")
                }),
                CancelButton(title: "Cancel", action: nil)
                ])
            self.present(alert, animated: true, completion: {
                
            })
        })))
        self.items.append(Item(model: Demo(id: "2", title:"Swarm peers", handler: {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "PeersVC") as? PeersVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        })))
        self.items.append(Item(model: Demo(id: "3", title:"File add&pin test", handler: {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "FileVC") as? FileVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        })))
        self.items.append(Item(model: Demo(id: "4", title:"Pinned files", handler: {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "PinnedVC") as? PinnedVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        })))
    }
}
