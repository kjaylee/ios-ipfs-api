//
//  PeersVC.swift
//  IpfsApi_Example
//
//  Created by we on 2018. 9. 6..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import Ipfs
import IGListKit
import PopupDialog

class PeersVC: ListVC<PeerVM, PeerLSC>, AdaptedCollectionViewProtocol {
    typealias Item = PeerVM
    @IBOutlet weak var collectionView: UICollectionView!
    let disposeBag = DisposeBag()
    var count: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swarm peers"
        initializeListView()
        request()
        self.navigationItem.setRightBarButton(UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(self.request)), animated: true)
    }
    @objc func request() {
        let service = IAService.swarmPeers(arguments: nil)
        let queue = DispatchQueue(label: service.path, qos: .utility, attributes: [.concurrent])
        Ipfs.shared().rx.request(MultiTarget(service), callbackQueue: queue)
            .filterSuccessfulStatusCodes()
            .map(ResponseSwarmPeersModel.self)
            .subscribe(onSuccess: { (model) in
                print("model count: \(model.peers?.count ?? 0)")
                print("model peers: \(String(describing: model.peers ?? nil))")
                self.items = (model.peers?.map { PeerVM(model:$0) }) ?? []
                self.count = model.peers?.count ?? 0
                self.reloadData()
            }) { (error) in
                print("failure: \(error.localizedDescription)")
                let alert = PopupDialog(title: "Error", message: error.localizedDescription)
                self.present(alert, animated: true, completion: {
                    
                })
            }.disposed(by: self.disposeBag)
    }
    func reloadData() {
        DispatchQueue.main.async {
            self.title = "Swarm peers - \(self.count)"
            self.adapter?.reloadData(completion: { (bool) in
            })
        }
    }
}
