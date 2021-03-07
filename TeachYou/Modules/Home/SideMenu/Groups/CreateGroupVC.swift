//
//  CreateGroup.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 28/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD

class CreateGroupVC: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var privacyTF: UITextField!
    @IBOutlet weak var categoryTF: UITextField!
    @IBOutlet weak var btnPrivacy: UIButton!
    @IBOutlet weak var btnCategory: UIButton!
    @IBOutlet weak var btnAddPhoto: UIButton!
    @IBOutlet weak var summaryTV: UITextView!
    @IBOutlet weak var btnSubmit: UIButton!
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
    
    var filter = ""
    var method = "create"
    var selectedCategoryIndex = 0
    var selectedPrivacyIndex = 0
    var groupsModel = [Groups]()
    var responseGroupPath = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViewes()
        self.privacyTF.text = privacyArr[0]
        self.categoryTF.text = categoryArr[0]
    }
    
    func setUpViewes() {
        self.summaryTV.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        self.cameraBgVw.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
    }
    
    func createGroupApiRequest() {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action"        : "AddEditgroup",
            "user"          : UserSessionManager.shared.getUserId() ?? "",
            "method"        : method,
            "description"   : self.summaryTV.text ?? "",
            "category"      : "1",
            "privacy"       : "public",
            "title"        : self.nameTF.text ?? ""
        ]
        
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                KRProgressHUD.dismiss()
                if response.response?.statusCode == 200 {
                    self.refreshPage()
                }else{
                    Utilities.showInformationAlert(title: "Error", message: "Something went wrong")
                    self.refreshPage()
                }
                
//                guard let dataResponse = response.data else {
//                    print("Response Error")
//                    return }
               
//                let objRes = String(data: dataResponse, encoding: .utf8)!
//                if let data = objRes.data(using: String.Encoding.utf8) {
//                    do {
//                        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
//                        if let jsonStatus = Int( json?["status"] as! String),  jsonStatus == 0 {
//                            Utilities.showAlert(title: "Error", message: json?["message"] as! String, buttons: ["Ok":{}])
//                        } else {
//                            self.responseGroupPath = "\(json?["path"] as AnyObject)"
//                        }
//
//                        self.refreshPage()
//
//                    } catch {
//                        Utilities.showAlert(title: "Error", message: "Something went wrong", buttons: ["Ok":{}])
//                        self.refreshPage()
//                    }
//                }
        }
    }
    
    func refreshPage() {
        self.nameTF.text = ""
        self.categoryTF.text = categoryArr[0]
        self.privacyTF.text = privacyArr[0]
        self.cameraBgVw.image = UIImage()
        self.summaryTV.text = ""
    }
    
    @IBAction func submitBtnTapped(_ sender: UIButton) {
        createGroupApiRequest()
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


extension CreateGroupVC: PickerViewDelegate{
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


extension CreateGroupVC: ImagePickerDelegate {
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
