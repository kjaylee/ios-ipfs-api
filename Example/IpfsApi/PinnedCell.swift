//
//  PinnedCell.swift
//  IpfsApi_Example
//
//  Created by we on 2018. 9. 7..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import FontAwesomeKit


class PinnedCell: Cell<PinnedVM> {
    typealias Item = PinnedVM
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    var request: Request?
    override func update(_ item: Item? = nil) {
        guard let item = item else { return }
        self.imageView.image = FAKFontAwesome.cloudDownloadIcon(withSize: 50).fontToImage()
        self.titleLabel.text = item.key
        self.typeLabel.text = item.type
        guard let hash = item.key else { return }
        guard let url = URL(string: "https://ipfs.io/ipfs/\(hash)") else { return }
        if let image = item.image {
            self.imageView.image = image
        }
        else {
            Alamofire.request(url.absoluteString).responseImage { [weak self] response in
                if let image = response.result.value,
                    response.request?.url?.absoluteString == url.absoluteString {
                        self?.imageView.image = image
                        item.image = image
                }
                else if response.request?.url?.absoluteString == url.absoluteString {
                    self?.imageView.image = FAKFontAwesome.cloudIcon(withSize: 50).fontToImage(color: .black)
                }
            }
        }
    }
}
fileprivate extension FAKIcon {
    func fontToImage(color:UIColor = .lightGray) -> UIImage {
        self.addAttribute(NSAttributedStringKey.foregroundColor.rawValue, value: color)
        return (self.image(with: CGSize(width: 90, height: 90)))!
    }
}
