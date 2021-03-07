//
//  AddNewArticleVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 15/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class AddNewArticleVC: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var contentTV: UITextView!
    @IBOutlet weak var cameraBgVw: UIView!
    @IBOutlet weak var categoryTF: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var cameraBtnTapped: UIButton!
    @IBOutlet weak var fullImgVw: UIImageView!
    
    var cellCount = 0
    var imagePicker : ImagePicker?
    var pickedImage : UIImage?
    var images = [UIImage]()
    var mimeType = [String]()
    var docData = [Data]()
    var categoryArr = ["Select Category", "Tutor", "Art", "Craft", "Film", "Health", "Language Institue", "Doctor", "School", "Sport", "Party", "Music", "Real Estate", "Theatre", "News", "College", "Dance", "Play School", "Global College"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewes()
        
    }
    
    func setUpViewes() {
        self.contentTV.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        self.cameraBgVw.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
    }
    
    func addNewArticle() {
        let parameters: [String: Any] = [
            "action"        : "AddEditarticle",
            "title"         : nameTF.text ?? "",
            "text"          : contentTV.text ?? "",
            "category"      : categoryTF.text ?? "",
            "tags"          : "2222",
            "user"          : UserSessionManager.shared.getUserId() ?? ""
        ]
        let urlString = "https://newcommunity.teachyou.in/androidApi.php"
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                
                guard response.data != nil else {
                    print("Response Error")
                    return }
                
                print(response.value ?? "")
                print(response.response)
                
                //                do
                //                {
                //                    let objRes: EventsModel = try JSONDecoder().decode(EventsModel.self, from: dataResponse)
                //                    for each in objRes.events ?? [] {
                //                        self.eventsModel.append(each)
                //                    }
                //                    self.tableView.reloadData()
                //                } catch let error{
                //                    print(error)
                //                }
        }
    }
    
    @IBAction func submitBtnTapped(_ sender: UIButton) {
        print("Submit tapped")
        addNewArticle()
    }
    
    @IBAction func cameraBtnDidTap(_ sender: UIButton) {
        
        imagePicker = ImagePicker()
        imagePicker?.imageDelegate = self
        imagePicker?.uploadImage()
        
    }
    
    @IBAction func selectCategoryTapped(_ sender: UIButton) {
        Utilities.initPicker(title: "Select Category", currentSelection: 0, delegate: self, data: categoryArr)
    }
    
}


extension AddNewArticleVC: ImagePickerDelegate {
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
        
        self.fullImgVw.image = pickedImage
        self.fullImgVw.isHidden = false
        
    }
    
}

extension AddNewArticleVC: PickerViewDelegate{
    func doneTapped(value: String, index: Int?) {
        self.categoryTF.text = value
    }
    
    func cancelTapped() {
        
    }
    
    
}
