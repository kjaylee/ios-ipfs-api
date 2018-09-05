//
//  TextFieldVC.swift
//  IpfsApi_Example
//
//  Created by we on 2018. 9. 5..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit

class TextFieldVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override var title: String?
    {
        didSet {
            if titleLabel != nil {
                self.titleLabel.text = self.title
            }
        }
    }
    var subtitle: String?
    {
        didSet {
            if subtitleLabel != nil {
                self.subtitleLabel.text = self.subtitle
            }
        }
    }
    var placeholder: String?
    {
        didSet {
            if textField != nil {
                self.textField.placeholder = placeholder
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = self.title
        self.subtitleLabel.text = self.subtitle
        self.textField.placeholder = placeholder
    }
}
