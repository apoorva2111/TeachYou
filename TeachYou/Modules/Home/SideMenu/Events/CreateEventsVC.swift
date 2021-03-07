//
//  CreateEventsVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 15/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class CreateEventsVC: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var startDateTF: UITextField!
    @IBOutlet weak var endDateTF: UITextField!
    @IBOutlet weak var privacyTF: UITextField!
    @IBOutlet weak var categoryTF: UITextField!
    @IBOutlet weak var btnAddPhoto: UIButton!
    @IBOutlet weak var summaryTV: UITextView!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var cameraBgVw: UIView!
    @IBOutlet weak var coverPhoto: UIImageView!
    
    var imagePicker : ImagePicker?
    var pickedImage : UIImage?
    var cellCount = 5
    var isStudy = false
    var isGoing = false
    var isInterested = false
    var myEvents = false
    var createEvent = false
    var privacyArr = ["Select Privacy", "Public", "Closed", "Secret"]
    var categoryArr = ["Select Category", "Tutor", "Art", "Craft", "Film", "Health", "Language Institue", "Doctor", "School", "Sport", "Party", "Music", "Real Estate", "Theatre", "News", "College", "Dance", "Play School", "Global College"]
    var isDOBTapped = false
    var isStartDateTapped = false
    var isEndDateTapped = false
    var isPrivacyTapped = false
    var isCategoryTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewes()
        self.privacyTF.text = privacyArr[0]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm"
        let dateStr = dateFormatter.string(from: Date())
        
        self.startDateTF.text = "\(dateStr)"
        self.categoryTF.text = categoryArr[0]
        
    }
    
    
    
    func setUpViewes() {
        self.summaryTV.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        self.cameraBgVw.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
    }
    
    @IBAction func btnStartDateTapped(_ sender: UIButton) {
        isStartDateTapped = true
        isEndDateTapped = false
        isPrivacyTapped = false
        isCategoryTapped = false
        Utilities.initDOBPicker(delegate: self, mode: 3, isDOB: isDOBTapped)
    }
    
    @IBAction func btnEndDateTapped(_ sender: UIButton) {
        isStartDateTapped = false
        isEndDateTapped = true
        isPrivacyTapped = false
        isCategoryTapped = false
        Utilities.initDOBPicker(delegate: self, mode: 3, isDOB: isDOBTapped)
    }
    
    @IBAction func btnSelectPrivacyTapped(_ sender: UIButton) {
        isStartDateTapped = false
        isEndDateTapped = false
        isPrivacyTapped = true
        isCategoryTapped = false
        Utilities.initPicker(title: "Select Privacy", currentSelection: 0, delegate: self, data: privacyArr)
    }
    @IBAction func btnSelectCategoryTapped(_ sender: UIButton) {
        isStartDateTapped = false
        isEndDateTapped = false
        isPrivacyTapped = false
        isCategoryTapped = true
        Utilities.initPicker(title: "Select Category", currentSelection: 0, delegate: self, data: categoryArr)
    }
    
    @IBAction func cameraBtnDidTap(_ sender: UIButton) {
        imagePicker = ImagePicker()
        imagePicker?.imageDelegate = self
        imagePicker?.uploadImage()
    }
    
    @IBAction func creteEventClicked(_ sender: UIButton){
        var categoryIndex:Int = 1
        guard let title = self.isFieldValid(textValue: self.nameTF.text) else{showAlert(message: "Name can't be blank."); return}
        guard let category = self.isFieldValid(textValue: self.categoryTF.text) else{showAlert(message: "Category can't be blank."); return}
        for i in 0..<categoryArr.count{
            if category == categoryArr[i]{
                categoryIndex = i
            }
        }
        guard let description = self.isFieldValid(textValue: self.summaryTV.text) else{showAlert(message: "Description can't be blank."); return}
        guard let start_date = self.isFieldValid(textValue: self.startDateTF.text) else{showAlert(message: "Start date can't be blank.");return}
        guard let end_date = self.isFieldValid(textValue: self.endDateTF.text) else{showAlert(message: "End date can't be blank.");return}
        guard let privacy = self.isFieldValid(textValue: self.privacyTF.text) else {showAlert(message: "Privacy can't be blank.");return}
        guard let location = self.isFieldValid(textValue: self.locationTF.text) else{showAlert(message: "Location can't be blank.");return}
        guard let eventImage = self.pickedImage else{showAlert(message: "Please select cover image.");return}
        self.createEventAPI(title: title, type: "create", category: "\(categoryIndex)", description: description, start_date: start_date, end_date: end_date, privacy: privacy, location: location, eventImage: eventImage)
    }
    
    func isFieldValid(textValue:String?)->String?{
        if let text = textValue, text.trimmingCharacters(in: CharacterSet.whitespaces) != ""{
            return text
        }else{
            return nil
        }
    }
    
    func showAlert(title:String = "Error!", message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func createEventAPI(title: String, type: String, category:String, description:String, start_date:String, end_date:String, privacy:String, location:String, eventImage:UIImage) {
        
        let imgData = eventImage.jpegData(compressionQuality: 0.2)!
        let parameters: [String: Any] = [
            "action" : "AddEditevent",
            "method" : type,
            "user"   : UserSessionManager.shared.getUserId() ?? "",
            "title" : title,
            "category": category,
            "description": description,
            "end_date": end_date,
            "start_date": start_date,
            "location": location,
            "privacy": privacy
        ]
        
        AF.upload(multipartFormData: { (multipartFormData) in
            let jsonData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
//            multipartFormData.append(jsonData, withName: "" )
            multipartFormData.append("AddEditevent".data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"action")
            multipartFormData.append(type.data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"method")
            multipartFormData.append((UserSessionManager.shared.getUserId() ?? "").data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"user")
            multipartFormData.append(title.data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"title")
            multipartFormData.append(category.data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"category")
            multipartFormData.append(description.data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"description")
            multipartFormData.append(end_date.data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"end_date")
            multipartFormData.append(start_date.data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"start_date")
            multipartFormData.append(location.data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"location")
            multipartFormData.append(privacy.lowercased().data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"privacy")
            multipartFormData.append(imgData, withName: "cover",fileName: "image.jpg", mimeType: "image/jpg")
        }, to: AppConstants.BASE_URL, method: .post).responseJSON(completionHandler: { (response) in
            print(response)
            if response.error != nil{
                print(response.error?.localizedDescription)
            }else{
                let alertController = UIAlertController(title: "Success", message: "Event created successfully", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .cancel) { (action) in
                    self.nameTF.text = ""
                    self.categoryTF.text = ""
                    self.summaryTV.text = ""
                    self.privacyTF.text = self.privacyArr[0]
                    self.locationTF.text = ""
                    self.categoryTF.text = self.categoryArr[0]
                    self.startDateTF.text = ""
                    self.endDateTF.text = ""
                    self.coverPhoto.image = nil
                }
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
            }
        })
       
    }
}


extension CreateEventsVC: PickerViewDelegate{
    func doneTapped(value: String, index: Int?) {
        if isPrivacyTapped == true {
            self.privacyTF.text = value
        } else {
            self.categoryTF.text = value
        }
    }
    
    func cancelTapped() {
        
    }
    
    
}

extension CreateEventsVC: DatePickerViewDelegate{
    func dobDoneTapped(value: String) {
        if isStartDateTapped == true {
            self.startDateTF.text = value
        } else {
            self.endDateTF.text = value
        }
    }
    
    func dobCancelTapped() {
        
    }
    
    
}


extension CreateEventsVC:ImagePickerDelegate{
    func imagePicked(image: UIImage) {
        print("image picked")
    }
    
    func pickedImageName(image: UIImage, imageName: String) {
        pickedImage = image
        coverPhoto.image = image
//        images.append(image)
//        if(imageName.contains("jpeg") || imageName.contains("jpg")){
//            mimeType.append("image/jpeg")
//        }
//        else if(imageName.contains("png") || imageName.contains("PNG")){
//            mimeType.append("image/png")
//        }
//        else{
//            mimeType.append("image/jpeg")
//        }
//        docData.append(image.jpegData(compressionQuality: 0.5)!)
//
//        self.fullImgVw.image = pickedImage
//        self.fullImgVw.isHidden = false
        
    }
}
