//
//  ImagePreviewViewController.swift
//  Al-Anon
//
//  Created by Resourcifi-Kriti on 02/03/20.
//  Copyright © 2020 Rnf-Yogita. All rights reserved.
//

import UIKit

protocol TransferImage: class {
    func sendImageToPreviousView(image: UIImage)
}


class ImagePreviewViewController: BaseViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    var img: UIImage!
    weak var transferDatadelegate: TransferImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addCustomNavigationBar(leftTitle: Validation.kCancelPlaceholder, leftImage: "", rightTitle: Validation.kSendPlaceholder, centerTitle: "", leftSpacing: 0, leftButtonWidth: 30)
        imgView.image = img
    }

    override func LeftButtonTapped() {
        dismiss(animated: true) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func RightButtonTapped() {
        print("Send image")
        self.transferDatadelegate?.sendImageToPreviousView(image: img)
        self.navigationController?.popViewController(animated: true)
    }
    
}
