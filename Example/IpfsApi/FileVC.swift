//
//  FileVC.swift
//  IpfsApi_Example
//
//  Created by we on 2018. 9. 6..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit
import FontAwesomeKit
import AVFoundation
import Photos
import Ipfs
import TUSafariActivity
import PopupDialog


class FileVC: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var pinButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var pinImageView: UIImageView!
    
    
    
    var address: String?
    {
        didSet {
            DispatchQueue.main.async {
                self.addressLabel.text = self.address
            }
        }
    }
    
    var image: UIImage?
    {
        didSet {
            DispatchQueue.main.async {
                self.cameraButton.isHidden = self.image != nil
                self.photoButton.isHidden = self.image != nil
                self.imageView.image = self.image
                self.pinImageView.isHidden = !(self.pinned && self.image != nil)
            }
        }
    }
    
    var object: ObjectModel?
    {
        didSet {
            guard let hash = object?.hash else { return }
            self.address = String(describing: "https://ipfs.io/ipfs/\(hash)")
        }
    }
    var pinned: Bool = false
    {
        didSet {
            DispatchQueue.main.async {
                self.pinImageView.isHidden = !(self.pinned && self.image != nil)
                self.pinButton.isSelected = self.pinned
            }
        }
    }
    var pins: [String] = []
    {
        didSet {
            pinned = pins.count > 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "File add&pin test"
        self.initializeViews()
        self.navigationItem.setRightBarButton(UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(self.reload)), animated: true)
    }
    @IBAction func tapAddress(_ sender: UITapGestureRecognizer) {
        guard let address = self.address else { return }
        UIPasteboard.general.string = address
        let alert = PopupDialog(title: "Copied", message: address)
        self.present(alert, animated: true) {
            
        }
    }
    @IBAction func pinAction(_ sender: UIButton) {
        guard let path = self.object?.hash else {
            let alert = PopupDialog(title: "Please", message: "First, upload your image.")
            self.present(alert, animated: true, completion: {
                
            })
            return
        }
        if pinned {
            Ipfs.pin.rm(path: path) { (result) in
                switch result {
                case let .success(moyaResponse):
                    let data = moyaResponse.data
                    let statusCode = moyaResponse.statusCode
                    // do something with the response data or statusCode
                    print("statusCode: \(statusCode)")
                    print("result: \(data)")
                    let rmPins = (try? moyaResponse.map(PinsModel.self))?.pins ?? []
                    var indexs = [Int]()
                    for rmPin in rmPins {
                        for (index, pin) in self.pins.enumerated() {
                            if pin == rmPin {
                                indexs.append(index)
                            }
                        }
                    }
                    for index in indexs {
                        self.pins.remove(at: index)
                    }
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
        else {
            Ipfs.pin.add(path: path) { (result) in
                switch result {
                case let .success(moyaResponse):
                    let data = moyaResponse.data
                    let statusCode = moyaResponse.statusCode
                    // do something with the response data or statusCode
                    print("statusCode: \(statusCode)")
                    print("result: \(data)")
                    self.pins = (try? moyaResponse.map(PinsModel.self))?.pins ?? []
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
    }
    @IBAction func goAction(_ sender: UIButton) {
        guard let url = URL(string: self.address ?? "") else {
            let alert = PopupDialog(title: "Please", message: "First, upload your image.")
            self.present(alert, animated: true, completion: {
                
            })
            return
        }
        let activity = TUSafariActivity()
        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: [activity])
        self.present(activityViewController, animated: true) {
            
        }
    }
}
extension FileVC {
    func initializeViews() {
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5.0
        cameraButton.layer.borderWidth = 2.0
        cameraButton.layer.borderColor = UIColor.white.cgColor
        cameraButton.layer.cornerRadius = 5.0
        cameraButton.setImage(FAKFontAwesome.cameraIcon(withSize: 40.0).fontToImage(), for: .normal)
        photoButton.layer.borderWidth = 2.0
        photoButton.layer.borderColor = UIColor.white.cgColor
        photoButton.layer.cornerRadius = 5.0
        photoButton.setImage(FAKFontAwesome.filePhotoOIcon(withSize: 40.0).fontToImage(), for: .normal)
        pinButton.layer.borderWidth = 1.0
        pinButton.layer.borderColor = UIColor.black.cgColor
        pinButton.layer.cornerRadius = 5.0
        pinButton.setImage(FAKFontAwesome.mapPinIcon(withSize: 15.0).fontToImage(), for: .normal)
        pinButton.setImage(FAKFontAwesome.mapPinIcon(withSize: 15.0).fontToImage(color: UIColor(red: 118.0/255.0, green: 214.0/255.0, blue: 255.0/255.0, alpha: 0.95)), for: .selected)
        pinButton.setTitle("PIN", for: .normal)
        pinButton.setTitle("UNPIN", for: .selected)
        goButton.layer.borderWidth = 1.0
        goButton.layer.borderColor = UIColor.black.cgColor
        goButton.layer.cornerRadius = 5.0
        goButton.setImage(FAKFontAwesome.rocketIcon(withSize: 15.0).fontToImage(), for: .normal)
        pinImageView.image = FAKFontAwesome.mapPinIcon(withSize: 40.0).fontToImage(color: UIColor(red: 118.0/255.0, green: 214.0/255.0, blue: 255.0/255.0, alpha: 0.95))
        pinImageView.isHidden = true
    }
    @objc func reload() {
        self.address = nil
        self.image = nil
        self.pins = []
    }
}


extension FileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBAction func openCamera(sender: UIButton) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
            break
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { [weak self] (accessGranted) in
                guard accessGranted == true else { return }
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.sourceType = .camera;
                    imagePicker.allowsEditing = false
                    self?.present(imagePicker, animated: true, completion: nil)
                }
            })
            break
        default:
            
            break
            
        }
    }
    
   @IBAction func openPhotoLibrary(sender: UIButton) {
        // Get the current authorization state.
        PHPhotoLibrary.authorizationStatus()
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
            break
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ [weak self] (status) in
                guard status == .authorized else { return }
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.sourceType = .photoLibrary;
                    imagePicker.allowsEditing = false
                    self?.present(imagePicker, animated: true, completion: nil)
                }
            })
            break
        default:
            break
            
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated:true, completion: {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageUpload(imag: image, handler: { (success) in
                if success {
                    self.image = image
                }
            })
        })
    }
    func imageUpload(imag:UIImage, handler: @escaping (Bool)->()) {
        guard let data = UIImagePNGRepresentation(imag) else { return }
        Ipfs.files.add(data: data) { (result) in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode
                // do something with the response data or statusCode
                print("statusCode: \(statusCode)")
                print("result: \(data)")
                let object = try? moyaResponse.map(ObjectModel.self)
                self.object = object
                handler(object != nil)
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
                handler(false)
                break
            }
        }
    }
}


fileprivate extension FAKIcon {
    func fontToImage(color:UIColor = .lightGray) -> UIImage {
        self.addAttribute(NSAttributedStringKey.foregroundColor.rawValue, value: color)
        return (self.image(with: CGSize(width: iconFontSize, height: iconFontSize)))!
    }
}
