//
//  SettingCell.swift
//  TeachYou
//
//  Created by Sandeep on 14/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD

class SettingCell: UITableViewCell {
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var privacyTF: UITextField!
    @IBOutlet weak var categoryTF: UITextField!
    @IBOutlet weak var btnPrivacy: UIButton!
    @IBOutlet weak var btnCategory: UIButton!
    @IBOutlet weak var summaryTV: UITextView!
    @IBOutlet weak var btnAddPhoto: UIButton!
    @IBOutlet weak var cameraBgVw: UIImageView!
    
    var privacyArr = ["Select Privacy", "Public", "Closed", "Secret"]
    var categoryArr = ["Select Category", "Tutor", "Art", "Craft", "Film", "Health", "Language Institue", "Doctor", "School", "Sport", "Party", "Music", "Real Estate", "Theatre", "News", "College", "Dance", "Play School", "Global College"]
    
    var isPrivacyTapped = false
    var isCategoryTapped = false
    var imagePicker : ImagePicker?
    var pickedImage : UIImage?
    var images = [UIImage]()
    var mimeType = [String]()
    var docData = [Data]()
    
    var method = "create"
    var selectedCategoryIndex = 0
    var selectedPrivacyIndex = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViewes()
    }

    func setData(data: Groups) {
        self.nameTF.text = data.group_title
        self.privacyTF.text = data.group_privacy
//        self.categoryTF.text = data.gr
        self.cameraBgVw.imageFromServerURL(urlString: data.group_picture ?? "") { (image) in }
        self.summaryTV.text = data.group_description
    }
    
    func setUpViewes() {
        self.summaryTV.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        self.cameraBgVw.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
    }
    
    @IBAction func submitBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func btnSelectPrivacyTapped(_ sender: UIButton) {
        isPrivacyTapped = true
        isCategoryTapped = false
        Utilities.initPicker(title: "Select Privacy", currentSelection: 0, delegate: self, data: privacyArr)
    }
    @IBAction func btnSelectCategoryTapped(_ sender: UIButton) {
        isPrivacyTapped = false
        isCategoryTapped = true
        Utilities.initPicker(title: "Select Category", currentSelection: 0, delegate: self, data: categoryArr)
    }
    
    @IBAction func btnAddPhotoTapped(_ sender: UIButton) {
        imagePicker = ImagePicker()
        imagePicker?.imageDelegate = self
        imagePicker?.uploadImage()
    }
    
}

extension SettingCell: PickerViewDelegate{
    func doneTapped(value: String, index: Int?) {
        if isPrivacyTapped == true {
            self.selectedPrivacyIndex = index ?? 1
            self.privacyTF.text = value
        } else {
            self.selectedCategoryIndex = index ?? 1
            self.categoryTF.text = value
        }
    }
    
    func cancelTapped() {
        
    }
    
    
}


extension SettingCell: ImagePickerDelegate {
    func imagePicked(image: UIImage) {
        print("image picked")
    }
    
    func pickedImageName(image: UIImage, imageName: String) {
        pickedImage = image
        images.append(image)
        if(imageName.contains("jpeg") || imageName.contains("jpg")){
            mimeType.append("image/jpeg")
        }
        else if(imageName.contains("png") || imageName.contains("PNG")){
            mimeType.append("image/png")
        }
        else{
            mimeType.append("image/jpeg")
        }
        docData.append(image.jpegData(compressionQuality: 0.5)!)
        
        self.cameraBgVw.image = pickedImage
        self.cameraBgVw.isHidden = false
        
    }
    
}
