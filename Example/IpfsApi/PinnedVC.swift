//
//  PinnedVC.swift
//  IpfsApi_Example
//
//  Created by we on 2018. 9. 7..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit
import Ipfs
import PopupDialog

class PinnedVC: ListVC<PinnedVM, PinnedLSC>, AdaptedCollectionViewProtocol  {
    typealias Item = PinnedVM
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pinned files"
        initializeListView()
        request()
    }
}

extension PinnedVC {
    func request() {
        Ipfs.pin.ls { (result) in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode
                // do something with the response data or statusCode
                print("statusCode: \(statusCode)")
                print("result: \(data)")
                self.items = (try? moyaResponse.map(PinnedObjectsModel.self))?.keys?.map {
                    PinnedVM(model: Pinned(id: $0.0 as NSString, key:  $0.0, pinnedObject:  $0.1))
                } ?? [PinnedVM]()
                self.reloadData()
                break
            case let .failure(error):
                // this means there was a network failure - either the request
                // wasn't sent (connectivity), or no response was received (server
                // timed out).  If the server responds with a 4xx or 5xx error, that
                // will be sent as a ".success"-ful response.
                print("failure: \(error.localizedDescription)")
                let alert = PopupDialog(title: "Error", message: error.localizedDescription)
                self.present(alert, animated: true, completion: {
                    
                })
                break
            }
        }
    }
    func reloadData() {
        DispatchQueue.main.async {
            self.title = "Pinned files - \(self.items.count)"
            self.adapter?.reloadData(completion: { (bool) in
            })
        }
    }
}
