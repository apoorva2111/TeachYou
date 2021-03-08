//
//  ProfileViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 22/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD




enum SelectedTab {
    case discussion
    case about
    case articles
    case events
    case friends
    case photos
    case videos
}

enum SelectedSubTab {
    case about
    case education
    case experience
    case skills
    case language
    case interests
}

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableMAinView: customTblView!
    @IBOutlet weak var viewRatingList: UIView!
    @IBOutlet weak var tblRatingView: UITableView!
    @IBOutlet weak var viewRatingPopup: UIView!
    @IBOutlet weak var viewEditCommenPopup: UIView!
    @IBOutlet weak var txtViewEditComent: UITextView!
    @IBOutlet weak var tbleHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tblBottomConstraint: NSLayoutConstraint!

    @IBOutlet weak var viewEditExperience: UIView!
    @IBOutlet weak var viewEditEducation: UIView!
    
   
    @IBAction func btnEditCommentCancelAction(_ sender: Any) {
        viewRatingPopup.isHidden = true
        viewRatingList.isHidden = true
    
    }
  //Popup Edit Education OR Experience
   
    
    @IBOutlet weak var txtviewPopupColgName: UITextView!
    @IBOutlet weak var txtviewDegree: UITextView!

    @IBOutlet weak var txtviewPopupExperience: UITextView!
    @IBOutlet weak var txtviewCompanyName: UITextView!
    @IBOutlet weak var viewEndDate: UIView!
    @IBOutlet weak var btnOutletStartDate: UIButton!
    @IBOutlet weak var btnOutletEndDate: UIButton!
    @IBOutlet weak var imgCheckPresentDate: UIImageView!
    @IBOutlet weak var btnOutletEduStarDate: UIButton!
    @IBOutlet weak var btnOutletExpEndDate: UIButton!
    @IBOutlet weak var imgEduCheckPresentDate: UIImageView!
    @IBOutlet weak var viewExpEndDate: UIView!
    @IBOutlet weak var btnEduPresentlyOutlet: UIButton!
    @IBOutlet weak var btnExpPresentlyOutlet: UIButton!
    
    var addStoryTapped = false
    var selectedTab : SelectedTab = .discussion
    var selectedSubType: SelectedSubTab = .about
    var followerCount = 0
    var followingCount = 0
    var postsModel = [Posts]()
    var articlesModel = [ArticlesDetails]()
    var arrArticles : [NSDictionary] = []
    var arrImages : [NSDictionary] = []
    var eventsModel = [Events]()
    var userData: ProfileModel?
    var reactToPostId = ""
    var shareType = ""
    var arrAppreciates = [PostAppreciates]()
    var reactToPostType = ""
    var editCommentId = 0
    var commentMessage = ""
    var imagePicker : ImagePicker?
    var pickedImage : UIImage?
    var images = [UIImage]()
    var imagePostData = [Data]()
    var docData = [Data]()
    var mimeType = [String]()
    var imgNames = [String]()
    var friendsModel = [FriendsDataModel]()

    var arrExperience = [NSDictionary]()
    var arrEducation = [NSDictionary]()
    var strLanguage = ""
    var strSkills = ""
    var strIntrests = ""
    
    
    var strTitle = ""
    var strSubTitlee = ""
    var strStartDatr = ""
    var strEndDate = ""
    var strPresent = 0
    var strexp_eduID = 0
    var selectDateFor = ""

    override func viewDidLoad() {
        super.viewDidLoad()
     
        initialSetUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       // getUserData()
    }
    
    func initialSetUp() {
        getFollowers()
        getFollowingMembers()
        getDiscussionPosts()
        getAbout()
        
        tableMAinView.delegate = self
        tableMAinView.dataSource = self

        self.tblRatingView.register(UINib(nibName: "StarAppreciatesTVCell", bundle: nil), forCellReuseIdentifier: "StarAppreciatesTVCell")
        
        self.tableMAinView.register(UINib(nibName: "ProfileArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileArticleTableViewCell")

        self.tableMAinView.register(UINib(nibName: "ProfilePhotosTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfilePhotosTableViewCell")
        
        self.tableMAinView.register(UINib(nibName: "ProfileEventTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileEventTableViewCell")
     
        self.tableMAinView.register(UINib(nibName: "ProfileFriendTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileFriendTableViewCell")

        self.tableMAinView.register(UINib(nibName: "ProfileAboutTVCell", bundle: nil), forCellReuseIdentifier: "ProfileAboutTVCell")
        self.tableMAinView.register(UINib(nibName: "AboutTVCell", bundle: nil), forCellReuseIdentifier: "AboutTVCell")

        
        
        viewRatingList.isHidden = true
        viewRatingPopup.isHidden = true
        viewEditCommenPopup.isHidden = true
        viewEditEducation.isHidden = true
        viewEditExperience.isHidden = true
        
    }
    
}


//MARK:- API Requests
extension ProfileViewController {
    
    func addPostWithImage(){
        KRProgressHUD.show()

        if shareType == ""{
            shareType = "public"
        }
        let parameters: [String: Any] = [
            "action" : "upload_file",
            "user" : UserSessionManager.shared.getUserId() ?? "",
            "size" : docData.count,
            "handle" : "post",
            "message" : CustomPopUpView.instance.textView.text ?? "",
            "id" : UserSessionManager.shared.getUserId() ?? "",
            "privacy" : shareType,
            "album" : ""
        ]
print(parameters)
        AF.upload(multipartFormData: { (multipartFormData) in
            let jsonData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
            multipartFormData.append(jsonData, withName: "" )

            multipartFormData.append("postStory".data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"action")
            multipartFormData.append("\(UserSessionManager.shared.getUserId() ?? "")".data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"user")
            
            multipartFormData.append("\(self.docData.count)".data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"size")
            
            multipartFormData.append("post".data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"handle")

            multipartFormData.append(CustomPopUpView.instance.textView.text.data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"message")

            multipartFormData.append("\(UserSessionManager.shared.getUserId() ?? "")".data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"id")

            multipartFormData.append(self.shareType.data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"privacy")

            multipartFormData.append("".data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"album")

            for i in 0..<self.docData.count{
                
                multipartFormData.append(self.docData[i], withName: "photos[]",fileName: self.imgNames[i], mimeType: "image/jpg")
            }

        }, to: AppConstants.BASE_URL, method: .post).responseJSON(completionHandler: { (response) in
            print(response)
            KRProgressHUD.dismiss()
            Utilities.showAlert(title: "Post", message: "Story uploaded successfully", buttons: ["Ok": {}])
            self.getDiscussionPosts()
            self.docData.removeAll()
            self.tableMAinView.reloadData()
            self.tableMAinView.layoutIfNeeded()
            CustomPopUpView.instance.parentView.removeFromSuperview()

        })
print("error")
    }
    
    func spreadPost(pid: String, shareMessage:String, share_to: String, page: Int, group:Int) {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action"        : "sharePost",
            "user"          : UserSessionManager.shared.getUserId() ?? "",
            "post_id"       : pid,
            "message"       : shareMessage,
            "share_to"      : "timeline",
            "page"          : "\(page)",
            "group"         : "\(group)"
        ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.tableMAinView.isHidden = false
                }
                KRProgressHUD.dismiss()
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                    self.getDiscussionPosts()
                } catch let error{
                    print(error)
                }
        }
    }
    
    func deletecommentOnPost(id: String, postId: String) {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "deleteComment",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "comment_id": id,
            "post_id": postId
        ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.tableMAinView.isHidden = false
                    KRProgressHUD.dismiss()
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                  //  self.getPosts()
                    self.getDiscussionPosts()
                    self.tableMAinView.reloadData()
                    self.tableMAinView.layoutIfNeeded()


                } catch let error{
                    print(error)
                }
        }
    }
    
    func reportPost(pid: String) {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action"        : "report",
            "user_id"       : UserSessionManager.shared.getUserId() ?? "",
            "id"            : pid,
            "handle"        : "post"
        ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.tableMAinView.isHidden = false
                    KRProgressHUD.dismiss()
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                    CustomPopUpView.instance.parentView.removeFromSuperview()
                    Utilities.showAlert(title: "Report", message: (objRes?["message"] ?? "" as AnyObject) as! String, buttons: ["Ok": {}])
                    //self.getPosts()
                    self.getDiscussionPosts()
                } catch let error{
                    print(error)
                }
        }
    }
    
    
    func editcommentOnPost(id: String, message: String) {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "editComment",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "comment_id": id,
            "message": message
        ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseString { response in
                //to get status code
                print(response)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.tableMAinView.isHidden = false
                    KRProgressHUD.dismiss()
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                let objRes = try JSONSerialization.jsonObject(with: dataResponse, options: .allowFragments) as? [String: AnyObject]

                    print(objRes?["status"] ?? "")
                    self.getDiscussionPosts()
                    self.viewRatingList.isHidden = true
                    self.viewEditCommenPopup.isHidden = true
                    self.viewEditEducation.isHidden = true
                    self.viewEditExperience.isHidden = true

                } catch let error{
                    print(error)
                }
        }
    }
    
    func commentOnPost(id: String, message:String) {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "commentPost",
            "user" : UserSessionManager.shared.getUserId() ?? "",
            "message" : message,
            "post_id": id,
            "handle": "post"
        ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.tableMAinView.isHidden = false
                    KRProgressHUD.dismiss()
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                    self.getDiscussionPosts()
                } catch let error{
                    print(error)
                }
        }
    }
    
    func reactUnreactToPost(id: String, type: String, ratings:String) {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "reactUnreactPost",
            "user" : UserSessionManager.shared.getUserId() ?? "",
            "post_id": id,
            "react_type": type,
            "ratings": ratings
        ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.tableMAinView.isHidden = false
                }
                KRProgressHUD.dismiss()
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes)
                    self.getDiscussionPosts()
                    
                } catch let error{
                    print(error)
                }
        }
    }
    
    func getPostAppreciates(pid:String){
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "getPostAppreciates",
            "post_id" : pid
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                guard let dataResponse = response.data else {
                    print("Response Error")
                    
                    return }
                do{
                    let objRes: PostAppreciatesModel = try JSONDecoder().decode(PostAppreciatesModel.self, from: dataResponse)
                    //                                    for each in objRes.PostAppreciates ?? [] {
                    //                                        self.feedModel.append(each)
                    //
                    if self.arrAppreciates.count>0{
                        self.arrAppreciates.removeAll()
                }
                    for each in objRes.appreciates ?? []{
                        print(each)
                        self.arrAppreciates.append(each)
                    }
                    KRProgressHUD.dismiss()
                  //  self.tblRatingView.setContentOffset(.zero, animated: true)
                    self.tblRatingView.reloadData()
                    self.viewRatingList.isHidden = false
                    self.viewRatingPopup.isHidden = false
                    self.viewEditCommenPopup.isHidden = true
                    self.viewEditEducation.isHidden = true
                    self.viewEditExperience.isHidden = true


                } catch let error{
                    print(error)
                }
            }
    }
    
    func deletePostForWhatsGoingOn() {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "deletePosts",
            "user" : UserSessionManager.shared.getUserId() ?? "",
            "post_id" : reactToPostId
        ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                KRProgressHUD.dismiss()
                self.getDiscussionPosts()
                self.tableMAinView.reloadData()
                self.tableMAinView.layoutIfNeeded()
                CustomPopUpView.instance.viewPublic.isHidden = true
                CustomPopUpView.instance.parentView.removeFromSuperview()
        }
    }
//    func getUserData() {
//        let parameters: [String: Any] = [
//            "action" : "getUserData",
//            "user_id" : UserSessionManager.shared.getUserId() ?? ""
//        ]
//        let urlString = AppConstants.BASE_URL
//        let url = URL.init(string: urlString)
//
//        AF.request(url!, method: .post, parameters: parameters)
//            .responseJSON { response in
//                //to get status code
//
//                guard let dataResponse = response.data else {
//                    print("Response Error")
//                    return }
//                self.userData = nil
//                do
//                {
//                    let objRes: ProfileModel = try JSONDecoder().decode(ProfileModel.self, from: dataResponse)
//                    self.userData = objRes
//                    self.tableView.reloadData()
//                } catch let error{
//                    print(error)
//                }
//        }
//    }
    
    func getDiscussionPosts() {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "getMyPosts",
            "user_id" : UserSessionManager.shared.getUserId() ?? ""
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                self.postsModel = []
                do
                {
                    let objRes: FeedModel = try JSONDecoder().decode(FeedModel.self, from: dataResponse)
                    for each in objRes.posts ?? [] {
                        self.postsModel.append(each)
                    }
                    KRProgressHUD.dismiss()
                    let getiPhone = self.getPhoneScreen()

                    if getiPhone == .iphone6 || getiPhone == .iphonePlus {
                        self.tblBottomConstraint.constant = 150
                    }else{
                      self.tblBottomConstraint.constant = 50
                    }
                    self.tableMAinView.reloadData()
                    self.tableMAinView.layoutIfNeeded()
                } catch let error{
                    print(error)
                }
        }
    }
    
    func getArticles() {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "getMyArticles",
            "user_id" : UserSessionManager.shared.getUserId() ?? ""
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code

                if self.arrArticles.count>0{
                    self.arrArticles.removeAll()
                }
                if let respData = response.value as? [String:Any]{
                    if  let rePosts = respData["posts"] as? [NSDictionary]{
                        for objDict in rePosts {
                            self.arrArticles.append(objDict)
                        }
                        
                    }
                    KRProgressHUD.dismiss()

                    if self.arrArticles.count>0 {
                        self.tableMAinView.reloadData()
                        self.tableMAinView.layoutIfNeeded()
                    }
                }
        }
    }
    
    func getEvents() {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "getEvents",
            "user" : UserSessionManager.shared.getUserId() ?? "",
            "filter" : "all"
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes: EventsModel = try JSONDecoder().decode(EventsModel.self, from: dataResponse)
                    if self.eventsModel.count>0{
                        self.eventsModel.removeAll()
                    }
                    for each in objRes.events ?? [] {
                        self.eventsModel.append(each)
                    }
                    KRProgressHUD.dismiss()
                    self.tableMAinView.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }
    
    func getFollowers() {
        let parameters: [String: Any] = [
            "action" : "getChaserChaging",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "event" : "chaser"
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                let getiPhone = self.getPhoneScreen()
                if getiPhone == .iphone6 || getiPhone == .iphonePlus {
                    self.tblBottomConstraint.constant = 150
                }else{
                self.tblBottomConstraint.constant = 50
                }
                
                if let respData = response.value as? NSDictionary{
                    let strMsg = respData["message"] as! String
                    let fullMesgArr = strMsg.components(separatedBy: " ")
                    let fullMesg: String = fullMesgArr[0]
                    self.followerCount = Int(fullMesg) ?? 0

                }
                KRProgressHUD.dismiss()
                   self.tableMAinView.reloadData()
                self.tableMAinView.layoutIfNeeded()

        }
    }
    
    func getFollowingMembers() {

        let parameters: [String: Any] = [
            "action" : "getChaserChaging",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "event" : "chasing"
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
             
                let getiPhone = self.getPhoneScreen()
                if getiPhone == .iphone6 || getiPhone == .iphonePlus {
                    self.tblBottomConstraint.constant = 150
                }else{
                    self.tblBottomConstraint.constant = 50
                }
                
                if let respData = response.value as? NSDictionary{
                    let strMsg = respData["message"] as! String
                    let fullMesgArr = strMsg.components(separatedBy: " ")
                    let fullMesg: String = fullMesgArr[0]
                    self.followingCount = Int(fullMesg) ?? 0

                }
                    self.tableMAinView.reloadData()
        }
    }
    
    func getPhotos() {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "getMedia",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "event" : "photo"
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                if self.arrImages.count>0{
                    self.arrImages.removeAll()
                }
                if let respData = response.value as? [String:Any]{
                    if  let rePosts = respData["media"] as? [NSDictionary]{
                        for objDict in rePosts {
                            self.arrImages.append(objDict)
                        }
                        
                    }
                    KRProgressHUD.dismiss()

                    if self.arrImages.count>0 {
                        self.tableMAinView.reloadData()
                        self.tableMAinView.layoutIfNeeded()
                    }
                }

        }
    }
    
    func getVideos() {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "getEvent",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "event" : "video"
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                KRProgressHUD.dismiss()

                //                guard let dataResponse = response.data else {
                //                    print("Response Error")
                //                    return }
                //                do
                //                {
                //                    let objRes: MemberCountModel = try JSONDecoder().decode(MemberCountModel.self, from: dataResponse)
                //                    self.followingCount = objRes.members?.count ?? 0
                //                    self.tableView.reloadData()
                //                } catch let error{
                //                    print(error)
                //                }
        }
    }
    
    func getAbout() {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "getUserData",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                KRProgressHUD.dismiss()
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                self.userData = nil
                do
                                {
                                    let objRes: ProfileModel = try JSONDecoder().decode(ProfileModel.self, from: dataResponse)
                                    self.userData = objRes
                                   // let allCount = self.userData?.experiences?.count ?? 0
                                   // DispatchQueue.main.async {
                                     //   self.tbleHeightConstraint.constant = CGFloat(allCount*100) //+ 10
                                   // }
                                    let getiPhone = self.getPhoneScreen()
                                    if getiPhone == .iphone6 || getiPhone == .iphonePlus {
                                        self.tblBottomConstraint.constant = 150
                                    }else{
                                        self.tblBottomConstraint.constant = 50
                                    }
//
                                    self.tableMAinView.reloadData()
                                    self.tableMAinView.layoutIfNeeded()
                                } catch let error{
                                    print(error)
                                }
            }
        
    }
   
    func getFriends() {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "all_friend1",
            "user" : UserSessionManager.shared.getUserId() ?? "",
        ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                KRProgressHUD.dismiss()
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes: FriendsModel = try JSONDecoder().decode(FriendsModel.self, from: dataResponse)
                    for each in objRes.all_data ?? [] {
                        self.friendsModel.append(each)
                    }
                    self.tableMAinView.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }
   
    func editPostForWhatsGoingOn() {
        KRProgressHUD.show()
        if shareType == ""{
            shareType = "public"
        }
        let parameters: [String: Any] = [
            "action" : "updatesendPosts",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "user_type" : "user",
            "post_id" : reactToPostId,
            "message" : CustomPopUpView.instance.textView.text ?? "",
            "privacy" : shareType
        ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                KRProgressHUD.dismiss()
                self.getDiscussionPosts()
                CustomPopUpView.instance.viewPublic.isHidden = true
                CustomPopUpView.instance.parentView.removeFromSuperview()
        }
    }
   
    func addEducation(eduSchoolName: String, eduDegree: String, eduStartDatr: String, eduEndDate: String, eduPresent: Int, eduId: Int) {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "addEditEducation",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "action_name" : ProfileAboutString.edu_ActionType,//"Edit"
            "user_edu_major" : txtviewPopupColgName.text ?? "",
            "user_edu_degree" : txtviewDegree.text ?? "",
            "edu_from_date" : strStartDatr,
            "edu_present" : ProfileAboutString.edu_Present,
            "edu_to_date" : strEndDate,
            "edu_id" : eduId
         ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                KRProgressHUD.dismiss()
              
              if let respValuev = response.value as?[String:Any] {
                let status = respValuev["status"] as? Bool
                if status == true{
                    self.viewRatingList.isHidden = true
                    self.viewRatingPopup.isHidden = true
                    self.viewEditCommenPopup.isHidden = true
                    self.viewEditEducation.isHidden = true
                    self.viewEditExperience.isHidden = true
                    self.getAbout()
                }
                }
                                
            }
        
    }
    
    func AddExperience(expWorkTitle: String, expCompanyName: String, expStartDatr: String, expEndDate: String, expPresent: Int, expId: Int) {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "addEditExperience",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "action_name" : ProfileAboutString.exp_ActionType,//"Edit"
            "user_work_title" : txtviewPopupExperience.text ?? "",
            "user_work_place" : txtviewCompanyName.text ?? "",
            "user_work_from_date" : strStartDatr,
            "user_work_present" : ProfileAboutString.exp_Present,
            "user_work_to_date" : strEndDate,
            "exp_id" : expId
         ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                KRProgressHUD.dismiss()
              
              if let respValuev = response.value as?[String:Any] {
                let status = respValuev["status"] as? Bool
                if status == true{
                    self.viewRatingList.isHidden = true
                    self.viewRatingPopup.isHidden = true
                    self.viewEditCommenPopup.isHidden = true
                    self.viewEditEducation.isHidden = true
                    self.viewEditExperience.isHidden = true
                    self.getAbout()
                }
                }
                                
            }
        
    }
}



extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblRatingView {
            return arrAppreciates.count
        }else{
        var cellCount = 2
        
        if selectedTab == .discussion {
            cellCount += self.postsModel.count
        } else if selectedTab == .about {
            if selectedSubType == .about{
                cellCount += 1
            }
        } else if selectedTab == .articles {
            cellCount += self.arrArticles.count
        } else if selectedTab == .events {
            cellCount += self.eventsModel.count
        } else if selectedTab == .friends {
            cellCount += self.friendsModel.count
        } else if selectedTab == .photos {
            cellCount += self.arrImages.count
        } else {
            cellCount += 0
            
        }
        return cellCount
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblRatingView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "StarAppreciatesTVCell", for: indexPath) as! StarAppreciatesTVCell
            let objPost = arrAppreciates[indexPath.row]
            if objPost.user_picture != "" {
                cell.imgProfile.sd_setImage(with: URL(string: objPost.user_picture!), placeholderImage: #imageLiteral(resourceName: "userPlaceholder"))
            }else{
                cell.imgProfile.image = #imageLiteral(resourceName: "userPlaceholder")
            }
            cell.lblUserName.text = objPost.user_firstname! + objPost.user_lastname!
            if objPost.ratings == 1{
                cell.imgStarOne.isHidden = false
                cell.imgStarTwo.isHidden = true
                cell.imgStarThree.isHidden = true
            }else if objPost.ratings == 2{
                cell.imgStarOne.isHidden = true
                cell.imgStarTwo.isHidden = false
                cell.imgStarThree.isHidden = true
                
            }else{
                cell.imgStarOne.isHidden = false
                cell.imgStarTwo.isHidden = false
                cell.imgStarThree.isHidden = false
                
            }
            
            
            return cell
        }else{
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTopViewTableViewCell", for: indexPath) as! ProfileTopViewTableViewCell
                cell.btnEditProfile.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 1, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0)
                cell.lblUsername.text = UserSessionManager.shared.getName() ?? ""
                cell.lblFollowerCount.text = "\(self.followerCount )"
                cell.lblFollowingCount.text = "\(self.followingCount )"
                cell.profileImgVw.imageFromServerURL(urlString: UserSessionManager.shared.getAvatar() ?? "") { (image) in
                }
                
                cell.btnEditProfile.addTarget(self, action: #selector(segueToEditVC), for: .touchUpInside)
                
                return cell
            }else if indexPath.row == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeadingTableViewCell", for: indexPath) as! ProfileHeadingTableViewCell
                cell.delegate = self
                return cell
            }else{
                if selectedTab == .discussion {
                    if self.postsModel[indexPath.row - 2].photos?.count ?? 0 > 0 {
                        let cell = tableView.dequeueReusableCell(withIdentifier: "profilePostWithImage", for: indexPath) as! ProfileDiscussionTableViewCell
                        cell.setMyPostdata(post: self.postsModel[indexPath.row - 2])
                        cell.delegate = self
                        cell.tableView = tableView
                        cell.feedModel = postsModel
                        cell.btnEditPostOutlet.addTarget(self, action: #selector(EditPostAction), for: .touchUpInside)
                        cell.btnDeletePostOutlet.addTarget(self, action: #selector(DeletePostAction), for: .touchUpInside)
                        
                        return cell
                    }else {
                        let cell = tableView.dequeueReusableCell(withIdentifier: "profilePost", for: indexPath) as! ProfileDiscussionTableViewCell
                        cell.setMyPostdata(post: self.postsModel[indexPath.row - 2])
                        cell.delegate = self
                        cell.tableView = tableView
                        cell.feedModel = postsModel
                        cell.btnEditPostOutlet.addTarget(self, action: #selector(EditPostAction), for: .touchUpInside)
                        cell.btnDeletePostOutlet.addTarget(self, action: #selector(DeletePostAction), for: .touchUpInside)
                        return cell
                    }
                }else if selectedTab == .articles{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileArticleTableViewCell", for: indexPath) as! ProfileArticleTableViewCell
                    if arrArticles.count>0{
                    let objDict = arrArticles[indexPath.row - 2]
                    let dictArticle = objDict["article"] as? NSDictionary
                        let imgUrl = dictArticle?["parsed_cover"]
                        cell.imgView.sd_setImage(with: URL(string: imgUrl as! String), placeholderImage: #imageLiteral(resourceName: "New Project"))
                        let userFirstName = objDict["user_firstname"] as? String
                        let userLastName = objDict["user_lastname"] as? String
                        cell.lblTag.text = (userFirstName ?? "") + " " + (userLastName ?? "")
                        cell.lblTitle.text = dictArticle?["title"] as? String
                        let view = dictArticle?["views"] as? Int
                        cell.lblViewCount.text = String(view!)
                        let appreciate = objDict["reactions_total_count"] as? Int
                        cell.lblAppreciate.text = String(appreciate!) + " Appreciate"
                    }
                    cell.BGView.roundCornerWithShadow(shadowColor: .lightGray, radius: 10, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
                    return cell
                }else if selectedTab == .photos{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilePhotosTableViewCell", for: indexPath) as! ProfilePhotosTableViewCell
                    cell.setPhotos(arrPhoto: arrImages)
                    cell.layoutIfNeeded()
                   cell.delegate = self
                    let height: CGFloat = cell.collectionPhoto.collectionViewLayout.collectionViewContentSize.height
                    cell.collectionPhotoHeightConstraint.constant = height

                    return cell
                }else if selectedTab == .events{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileEventTableViewCell", for: indexPath) as! ProfileEventTableViewCell
                        //cell.setCellData(data: self.eventsModel)
                    cell.setCellData(data: self.eventsModel[indexPath.row - 2])
                    cell.btnOutletIntrest.isHidden = true
                    cell.bgView.roundCornerWithShadow(shadowColor: .gray, radius: 10, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
//                    cell.delegate = self

                    return cell
                }else if selectedTab == .friends{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileFriendTableViewCell", for: indexPath) as! ProfileFriendTableViewCell
                    
                    cell.userName.text = (self.friendsModel[indexPath.row - 2].user_firstname ?? "") + " " + (self.friendsModel[indexPath.row - 2].user_lastname ?? "")
                    cell.userImgVw.imageFromServerURL(urlString: self.friendsModel[indexPath.row - 2].user_picture ?? "") { (image) in
                        //            cell.imgView.image = cell.imgView.image?.crop(to: cell.imgView.frame.size)
                    }
                    cell.bgView.roundCornerWithShadow(shadowColor: .gray, radius: 5, borderWidth: 0, borderColor: .clear, shadowOpacity: 1, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1)

                    return cell
                }else if selectedTab == .about{
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileAboutTVCell", for: indexPath) as! ProfileAboutTVCell
                    cell.viewCntrl = self
                    cell.setData(userData: userData)
                    cell.delegate = self
                    cell.tableViewMain = tableView
                    return cell
                    
                }
            }
            return UITableViewCell()
        }
      
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tblRatingView {
            return 60
        }else if tableView == self.tableMAinView{
        if indexPath.row == 0 {
            return 200
        } else if indexPath.row == 1 {
            return 360
        } else {
            if selectedTab == .discussion {
                return UITableView.automaticDimension
            }else if selectedTab == .about{
                return UITableView.automaticDimension
            }else if selectedTab == .articles{
                return 150
            }else if selectedTab == .photos{
                return UITableView.automaticDimension
            }else if selectedTab == .events{
                return 150
            }else if selectedTab == .friends{
                return 100
            }
        }
       
        }
        return UITableView.automaticDimension

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedTab == .articles{
        let vc = Utilities.viewConrollerObject(identifier: "ArticleDetailsVC", storyboard: StoryBoardConstants.kMainStoryBoard) as! ArticleDetailsVC
//        vc.articleDetails = self.articlesModel[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        }

    }
    
    @objc  func EditPostAction(_ sender: UIButton) {
        let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:self.tableMAinView)
        let indexPath = self.tableMAinView.indexPathForRow(at: buttonPosition)
        
        let obj = self.postsModel[indexPath!.row-2]
       let id:Int = obj.post_id!
        let strUserId:String = String(describing: id)
        reactToPostId = strUserId
       BoolValue.isFromEditPost = true
//        submitBtnAction()
        
        CustomPopUpView.instance.showAuthenticationAlert()
        CustomPopUpView.instance.sharePostVw.isHidden = false
        CustomPopUpView.instance.spreadPostVw.isHidden = true
        CustomPopUpView.instance.addStoryVw.isHidden = true
        CustomPopUpView.instance.reactVw.isHidden = true
        CustomPopUpView.instance.reportVw.isHidden = true
        CustomPopUpView.instance.editCommentVw.isHidden = true
        CustomPopUpView.instance.textView.text = obj.og_description
        CustomPopUpView.instance.delegate = self
    }
    @objc  func DeletePostAction(_ sender: UIButton) {
        let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:self.tableMAinView)
        let indexPath = self.tableMAinView.indexPathForRow(at: buttonPosition)
        
        let obj = self.postsModel[indexPath!.row-2]
        let id:Int = obj.post_id!
         let strUserId:String = String(describing: id)
         reactToPostId = strUserId
        BoolValue.isFromEditPost = false
        CustomPopUpView.instance.parentView.removeFromSuperview()
        Utilities.showAlert(title: "", message: "Are you sure want to delete this post?", buttons: ["YES":{
                                                                                                        self.deletePostForWhatsGoingOn()},"CANCEL":{}])

    }

    @objc func segueToEditVC() {
        let vc = Utilities.viewConrollerObject(identifier: "EditProfileViewController", storyboard: StoryBoardConstants.kProfileStoryBoard) as! EditProfileViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
//extension ProfileViewController: UITextViewDelegate{
//    
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.textColor == UIColor.lightGray {
//            textView.text = nil
//            textView.textColor = UIColor.black
//        }
//    }
//    
//    func textViewDidEndEditing(_ textView: UITextView) {
//
//        if txtviewPopupExperience.text.isEmpty{
//            txtviewPopupExperience.text = "Experience"
//            txtviewPopupExperience.textColor = UIColor.lightGray
//        }
//        if txtviewCompanyName.text.isEmpty{
//            txtviewCompanyName.text = "Company Name"
//            txtviewCompanyName.textColor = UIColor.lightGray
//        }
//        if txtviewPopupColgName.text.isEmpty{
//            txtviewPopupColgName.text = "School/Collage Name"
//            txtviewPopupColgName.textColor = UIColor.lightGray
//        }
//        if txtviewDegree.text.isEmpty{
//            txtviewDegree.text = "Degree"
//            txtviewDegree.textColor = UIColor.lightGray
//        }
//    }
//}
extension ProfileViewController : ProfileAboutTVCellDelegate{
    func editExperience(expWorkTitle: String, expCompanyName: String, expStartDatr: String, expEndDate: String, expPresent: Int, expId: Int) {
        
        strTitle = txtviewPopupExperience.text
        strSubTitlee = txtviewCompanyName.text
        strStartDatr = expStartDatr//btnOutletEduStarDate.currentTitle ?? ""
        strEndDate = expEndDate//btnOutletEduEndDate.currentTitle ?? ""
        strPresent = expPresent
        strexp_eduID = expId
        //exp - btnOutletEduStarDate,btnOutletEduEndDate
        //edu = btnOutletStartDate,btnOutletEndDate
        txtviewPopupExperience.text = expWorkTitle
        txtviewCompanyName.text = expCompanyName
        btnOutletEduStarDate.setTitle(expStartDatr, for: .normal)
        btnOutletEduStarDate.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        if expPresent == 1{
            viewExpEndDate.isHidden = true
          //  imgCheckPresentDate.image = #imageLiteral(resourceName: "checked")
            imgEduCheckPresentDate.image = #imageLiteral(resourceName: "checked")
            btnExpPresentlyOutlet.isSelected = true

        }else{
            btnOutletExpEndDate.setTitle(expEndDate, for: .normal)
            btnOutletExpEndDate.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            
            viewExpEndDate.isHidden = false
            imgEduCheckPresentDate.image = #imageLiteral(resourceName: "unchecked")
        }
        viewRatingList.isHidden = false
        viewRatingPopup.isHidden = true
        viewEditCommenPopup.isHidden = true
        viewEditEducation.isHidden = true
        viewEditExperience.isHidden = false

    }
    
    func editEducation(eduSchoolName: String, eduDegree: String, eduStartDatr: String, eduEndDate: String, eduPresent: Int, eduId: Int) {
        strTitle = eduSchoolName
        strSubTitlee = eduDegree
        strStartDatr = eduStartDatr
        strEndDate = eduEndDate
        strPresent = eduPresent
        strexp_eduID = eduId
        
        txtviewPopupColgName.text = eduSchoolName
        txtviewDegree.text = eduDegree
        btnOutletStartDate.setTitle(eduStartDatr, for: .normal)
        btnOutletStartDate.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        if eduPresent == 1{
            viewEndDate.isHidden = true
            imgCheckPresentDate.image = #imageLiteral(resourceName: "checked")
            btnEduPresentlyOutlet.isSelected = true
        }else{
            btnOutletEndDate.setTitle(eduEndDate, for: .normal)
            btnOutletEndDate.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            viewEndDate.isHidden = false
            imgCheckPresentDate.image = #imageLiteral(resourceName: "unchecked")

        }
        viewRatingList.isHidden = false
        viewRatingPopup.isHidden = true
        viewEditCommenPopup.isHidden = true
        viewEditEducation.isHidden = false
        viewEditExperience.isHidden = true
    }
    
    
   
    
    
}
extension ProfileViewController: ProfileHeadingCellDelegate {
    
    func btnSelected(type: SelectedTab) {
        print(type)
        let getiPhone = self.getPhoneScreen()
       
        if getiPhone == .iphone6 || getiPhone == .iphonePlus {
            self.tblBottomConstraint.constant = 150
        }else{
            self.tblBottomConstraint.constant = 50
        }
        self.selectedTab = type
        
        switch self.selectedTab {
            
        case .discussion:
            getDiscussionPosts()
            self.tableMAinView.reloadData()
        case .about:
            
           self.tableMAinView.reloadData()
            self.tableMAinView.layoutIfNeeded()
            getAbout()
            
        case .articles:
            getArticles()
          //  self.tableView.reloadData()
        case .photos:
            getPhotos()
            self.tableMAinView.reloadData()
        case .events:
            getEvents()
            self.tableMAinView.reloadData()
        case .friends:
            getFriends()
            self.tableMAinView.reloadData()
        case .videos:
            getVideos()
            self.tableMAinView.reloadData()
        default:
            break
        
        }
    }
    func getPhoneScreen()->IphoneScreen{
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {

            case 1136:
                return IphoneScreen.iphone5
            case 1334:
                return IphoneScreen.iphone6
            case 2208:
                return IphoneScreen.iphonePlus
            case 2436:
                return IphoneScreen.iphoneX
            case 2688:
                return IphoneScreen.iphoneXSMax
            default:
                return IphoneScreen.unknown
            }
        }
        return IphoneScreen.unknown
    }
    
}


extension ProfileViewController: ProfileAboutCellDelegate {
    
    func btnSelected(type: SelectedSubTab) {
        print(type)
        self.selectedSubType = type
        self.tableMAinView.reloadData()
    }
    
}

extension ProfileViewController: FeedCellDelegate {
    
    func starListAction(pid: String) {
        print(pid)
        getPostAppreciates(pid: pid)
        
    }
    func editPostAction(userId:String, postId: String, message:String, privacy:String)
    {
        BoolValue.isFromEditPost = true
        CustomPopUpView.instance.showAuthenticationAlert()
        CustomPopUpView.instance.sharePostVw.isHidden = true
        CustomPopUpView.instance.spreadPostVw.isHidden = true
        CustomPopUpView.instance.addStoryVw.isHidden = true
        CustomPopUpView.instance.reactVw.isHidden = true
        CustomPopUpView.instance.reportVw.isHidden = true
        CustomPopUpView.instance.editCommentVw.isHidden = false
        CustomPopUpView.instance.userId = userId
        CustomPopUpView.instance.postId = postId
        CustomPopUpView.instance.message = message
        CustomPopUpView.instance.privacy = privacy
        shareType = privacy
        CustomPopUpView.instance.delegate = self

    }
    func shareAction(pid: String) {
        CustomPopUpView.instance.showAuthenticationAlert()
        CustomPopUpView.instance.sharePostVw.isHidden = true
        CustomPopUpView.instance.addStoryVw.isHidden = true
        CustomPopUpView.instance.editCommentVw.isHidden = true
        CustomPopUpView.instance.reportVw.isHidden = true
        CustomPopUpView.instance.reactVw.isHidden = true
        CustomPopUpView.instance.spreadPostVw.isHidden = false
        CustomPopUpView.instance.delegate = self
        self.reactToPostId = pid
    }
    
    func reactAction(pid: String, type: String) {
        print("react tapped")
        self.reactToPostId = pid
        self.reactToPostType = type
        if type == "react" {
            CustomPopUpView.instance.showAuthenticationAlert()
            CustomPopUpView.instance.sharePostVw.isHidden = true
            CustomPopUpView.instance.addStoryVw.isHidden = true
            CustomPopUpView.instance.editCommentVw.isHidden = true
            CustomPopUpView.instance.reportVw.isHidden = true
            CustomPopUpView.instance.spreadPostVw.isHidden = true
            CustomPopUpView.instance.reactVw.isHidden = false
            CustomPopUpView.instance.delegate = self
        } else {
            CustomPopUpView.instance.delegate = self
//            CustomPopUpView.instance.parentView.removeFromSuperview()
            reactUnreactToPost(id: self.reactToPostId, type: self.reactToPostType, ratings: "0")

        }
    }
    
    func expandImgAction(urlStr : String) {
        let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kImagePreviewViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! ImagePreviewViewController
        vc.imgStr = urlStr
        vc.transferDatadelegate = self
        present(vc, animated: true, completion: nil)
    }
    
    func sendCommentAction(messageStr: String, id: String) {
        print("send comment tapped")
        self.commentOnPost(id: id, message: messageStr)
    }
    
    func editCommentAction(id: Int, postId: String, comment: String) {
        print("edit comment tapped")
        self.reactToPostId = postId
        self.editCommentId = id
        self.commentMessage = comment
        
        CustomPopUpView.instance.showAuthenticationAlert()
        CustomPopUpView.instance.sharePostVw.isHidden = true
        CustomPopUpView.instance.spreadPostVw.isHidden = true
        CustomPopUpView.instance.addStoryVw.isHidden = true
        CustomPopUpView.instance.reactVw.isHidden = true
        CustomPopUpView.instance.reportVw.isHidden = true
        CustomPopUpView.instance.editCommentVw.isHidden = false
        CustomPopUpView.instance.delegate = self
    }
    
    func commentAction() {
        print("comment tapped")
        self.tableMAinView.reloadData()
    }
    
    func reportAction(postId: String) {
        CustomPopUpView.instance.showAuthenticationAlert()
        CustomPopUpView.instance.sharePostVw.isHidden = true
        CustomPopUpView.instance.spreadPostVw.isHidden = true
        CustomPopUpView.instance.addStoryVw.isHidden = true
        CustomPopUpView.instance.reactVw.isHidden = true
        CustomPopUpView.instance.editCommentVw.isHidden = true
        CustomPopUpView.instance.reportVw.isHidden = false
        CustomPopUpView.instance.delegate = self
        self.reactToPostId = postId
    }
}


extension ProfileViewController : CustomPopUpDelegate {
    func detetePost() {
        BoolValue.isFromEditPost = false
        CustomPopUpView.instance.parentView.removeFromSuperview()
        Utilities.showAlert(title: "", message: "Are you sure want to delete this post?", buttons: ["YES":{
                                                                                                        self.deletePostForWhatsGoingOn()},"CANCEL":{}])
    }
    
    
    func editCommentOnFeedAction(type: Int) {
        if type == 0 {
            CustomPopUpView.instance.viewPublic.isHidden = true
            CustomPopUpView.instance.parentView.removeFromSuperview()
            viewRatingPopup.isHidden = true
            viewEditCommenPopup.isHidden = false
            viewRatingList.isHidden = false
            txtViewEditComent.text = commentMessage
            viewRatingList.isHidden = false
            viewEditCommenPopup.isHidden = false
            viewRatingPopup.isHidden = true
            viewEditEducation.isHidden = true
            viewEditExperience.isHidden = true

    
        } else {
            CustomPopUpView.instance.parentView.removeFromSuperview()
            Utilities.showAlert(title: "", message: "Are you sure want to delete this comment?", buttons: ["YES":{
                self.deletecommentOnPost(id: "\(self.editCommentId)", postId: self.reactToPostId)
            },"CANCEL":{}])
           //
        }
    }
    func shareTypeAction(type:String){
        if type == "Public"{
            CustomPopUpView.instance.btnMode.setTitle("Public", for: .normal)
            CustomPopUpView.instance.viewPublic.isHidden = true
            shareType = "public"
        }else if type == "Friends"{
            CustomPopUpView.instance.btnMode.setTitle("Friends", for: .normal)
            CustomPopUpView.instance.viewPublic.isHidden = true
            shareType = "friends"
        }else{
            CustomPopUpView.instance.btnMode.setTitle("Private", for: .normal)
            CustomPopUpView.instance.viewPublic.isHidden = true
            shareType = "private"
        }
    }

    
  //  func spreadAction(type: String, shareMessage: String,page: Int, group: Int) {
    func spreadAction(type: String, shareMessage:String, pageId:Int, groupId:Int) {
    print("Spread tapped")
        if type == "page" && pageId == 0{
            Utilities.showAlert(title: "", message: "There is no page, Please create page", buttons: ["Ok":{}])
        }else if type == "group" && groupId == 0{
            Utilities.showAlert(title: "", message: "There is no group, Please create group", buttons: ["Ok":{}])
        }else{
            CustomPopUpView.instance.parentView.removeFromSuperview()
//            if type == "discussion"{
//                self.spreadPost(pid: self.reactToPostId, shareMessage: shareMessage, share_to: type, page: pageId, group: groupId)
//            }else{
                self.spreadPost(pid: self.reactToPostId, shareMessage: shareMessage, share_to: type, page: pageId, group: groupId)
          //  }
        }
    }
    
    func reactToFeedAction(ratings: Int) {
        print("reactToFeedAction tapped")
       // loadingIndicator.isAnimating = true
        self.tableMAinView.isHidden = false
        
        if self.reactToPostType == "react" {
            reactUnreactToPost(id: self.reactToPostId, type: self.reactToPostType, ratings: "\(ratings)")
        } else {
            reactUnreactToPost(id: self.reactToPostId, type: self.reactToPostType, ratings: "0")
        }
        CustomPopUpView.instance.parentView.removeFromSuperview()
    }
    
    func reportPostAction() {
        print("report tapped")
        reportPost(pid: self.reactToPostId)
    }
    
    func publishBtnAction() {
        print("publish Tapped")
    }
    
    func addPhotoStoryAction() {
        print("add photo story Tapped")
        ImageString.image = "Image"
        imagePicker = ImagePicker()
        imagePicker?.imageDelegate = self
        imagePicker?.uploadImage()
    }
    
    func addVideoStoryAction() {
        print("add video story Tapped")
        ImageString.image = "Video"
        imagePicker = ImagePicker()
        imagePicker?.imageDelegate = self
        imagePicker?.uploadImage()
    }
    
    func submitBtnAction() {
        print("Submit Tapped")
        if CustomPopUpView.instance.textView.text == "What\'s going on...#Hashtag @Memories"{
            Utilities.showAlert(title: "", message: "Please Say Something", buttons: ["Ok":{}])
        }else{
            if docData.count>0{
               addPostWithImage()
            }else{
                if BoolValue.isFromEditPost{
                    BoolValue.isFromEditPost = false
                    editPostForWhatsGoingOn()
                }else{
                  //  submitWhatsGoingOn()
                }
            }
           
        }
    }
    
    func uploadPhotoBtnAction() {
        print("Upload photo Tapped")
        imagePicker = ImagePicker()
        imagePicker?.imageDelegate = self
        imagePicker?.uploadImage()
    }
    
    func createAlbumBtnAction() {
        print("Create album Tapped")
        ImageString.image = "Image"
        imagePicker = ImagePicker()
        imagePicker?.imageDelegate = self
        imagePicker?.uploadImage()
    }
    
    func uploadVideoBtnAction() {
        print("upload video Tapped")
        ImageString.image = "Video"
        imagePicker = ImagePicker()
        imagePicker?.imageDelegate = self
        imagePicker?.uploadImage()
    }
    
    func uploadPdfBtnAction() {
        print("upload pdf Tapped")
        let documentPicker = UIDocumentPickerViewController(documentTypes: ["com.microsoft.word.doc","org.openxmlformats.wordprocessingml.document" as String], in: UIDocumentPickerMode.import)
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }
    
    func selectModeBtnAction() {
        print("select mode Tapped")
//        Utilities.initPicker(title: "Select Mode", currentSelection: 0, delegate: self, data: ["Public"])
        CustomPopUpView.instance.viewPublic.isHidden = false
    }
    
    
}
extension ProfileViewController{
    @IBAction func btnEducationAction(_ sender: UIButton) {
        let isDOBTapped = false
        if sender.tag == 10{
            print("Expreience Start Date")
            selectDateFor = "Expreience Start Date"
            Utilities.initDOBPicker(delegate: self, mode: 0, isDOB: isDOBTapped)


        }else if sender.tag == 20 {
            print("Expreience End Date")
            selectDateFor = "Expreience End Date"
            Utilities.initDOBPicker(delegate: self, mode: 0, isDOB: isDOBTapped)

        }else if sender.tag == 30 {
            print("Expreience Presently")
            if sender.isSelected{
                sender.isSelected = false
                viewExpEndDate.isHidden = false
            //    imgCheckPresentDate.image = #imageLiteral(resourceName: "unchecked")
                imgEduCheckPresentDate.image = #imageLiteral(resourceName: "unchecked")

                ProfileAboutString.exp_Present = 0

            }else{
                sender.isSelected = true
                viewExpEndDate.isHidden = true
                imgEduCheckPresentDate.image = #imageLiteral(resourceName: "checked")
                let date = Utilities.getCurrentDate(format: DateFormatterConstant.kdateyyyy_mm_dd)
                print(date)
                strEndDate = date
                ProfileAboutString.exp_Present = 1
            }

        }else if sender.tag == 40 {
            print("Education Start Date")
            selectDateFor = "Education Start Date"

            Utilities.initDOBPicker(delegate: self, mode: 0, isDOB: isDOBTapped)


        }else if sender.tag == 50 {
            print("Education End Date")
            selectDateFor = "Education End Date"

            Utilities.initDOBPicker(delegate: self, mode: 0, isDOB: isDOBTapped)


        }else if sender.tag == 60 {
            print("Education Presently")
            if sender.isSelected{
                sender.isSelected = false
                viewEndDate.isHidden = false
                imgCheckPresentDate.image = #imageLiteral(resourceName: "unchecked")
                ProfileAboutString.edu_Present = 0


            }else{
                sender.isSelected = true
                viewEndDate.isHidden = true
                imgCheckPresentDate.image = #imageLiteral(resourceName: "checked")
                let date = Utilities.getCurrentDate(format: DateFormatterConstant.kdateyyyy_mm_dd)
                print(date)
                strEndDate = date
                ProfileAboutString.edu_Present = 1
            }

        }
    }
    @IBAction func btnEditpopUpAction(_ sender: UIButton) {
        if sender.tag == 1{
            viewEditExperience.isHidden = true
            viewRatingList.isHidden = true
            tableMAinView.reloadData()
            tableMAinView.layoutIfNeeded()
        }else if sender.tag == 2{
            viewEditEducation.isHidden = true
            viewRatingList.isHidden = true
            tableMAinView.reloadData()
            tableMAinView.layoutIfNeeded()
        }
    }
    
    @IBAction func btnSubmitAction(_ sender: UIButton) {
        if sender.tag == 10{
            AddExperience(expWorkTitle: strTitle, expCompanyName: strSubTitlee, expStartDatr: strStartDatr, expEndDate: strEndDate, expPresent: strPresent, expId: strexp_eduID)

        }else if sender.tag == 20{
            print("Submit Education")
            addEducation(eduSchoolName: strTitle, eduDegree: strSubTitlee, eduStartDatr: strStartDatr, eduEndDate: strEndDate, eduPresent: strPresent, eduId: strexp_eduID)
        }
         
    }
    @IBAction func btnRatinViewListAction(_ sender: UIButton) {
        viewRatingList.isHidden = true
        viewRatingPopup.isHidden = true
    
    }
   
    @IBAction func btnEditCommentSubmitAction(_ sender: Any) {
        if txtViewEditComent.text == "" {
            Utilities.showAlert(title: "", message: "", buttons: ["Ok": {}])
        }
        editcommentOnPost(id: "\(self.editCommentId)", message: txtViewEditComent.text)

    }
}
extension ProfileViewController: UIDocumentPickerDelegate{
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        let fileName = url.lastPathComponent
        if(fileName.contains(".pdf")){
            mimeType.append("application/pdf")
            images.append(UIImage.init(named: "pdf") ?? UIImage())
        }else if(fileName.contains(".docx")){
            mimeType.append("application/vnd.openxmlformats-officedocument.wordprocessingml.document")
            images.append(UIImage.init(named: "doc") ?? UIImage())
        }
        else{
            mimeType.append("application/msword")
            images.append(UIImage.init(named: "doc") ?? UIImage())
        }
        
        do {
            let data = try Data(contentsOf: url)
            docData.append(data)
        } catch {
            print(error)
        }
        
    }
}

extension ProfileViewController: ImagePickerDelegate {
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

        
        self.imgNames.append(imageName)
        
        
        docData.append(image.jpegData(compressionQuality: 0.5)!)
        print(docData)
        if addStoryTapped {
            CustomPopUpView.instance.cameraimgVw.image = pickedImage
        } else {
            print(pickedImage!)
        }
        
    }
    
    func imagePicked(image: UIImage) {
    }
}
extension ProfileViewController: TransferImage {
   
    func sendImageToPreviousView(image: UIImage) {

    }
}
extension ProfileViewController:DatePickerViewDelegate{
    func dobDoneTapped(value: String) {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = DateFormatterConstant.kMM_dd_yyyy//kdateyyyy_dd_mm

        if selectDateFor == "Expreience Start Date"{

            let showStartDate = inputFormatter.date(from: value)
            inputFormatter.dateFormat = DateFormatterConstant.kdateyyyy_mm_dd
            let resultString = inputFormatter.string(from: showStartDate!)
            strStartDatr = resultString
           
            btnOutletEduStarDate.setTitle(resultString, for: .normal)
            btnOutletEduStarDate.setTitleColor(.black, for: .normal)
        }else if selectDateFor == "Expreience End Date"{
            
            let showEndDate = inputFormatter.date(from: value)
            inputFormatter.dateFormat = DateFormatterConstant.kdateyyyy_mm_dd
            let resultString = inputFormatter.string(from: showEndDate!)
            strEndDate = resultString
            ProfileAboutString.exp_Present = 0
            btnOutletExpEndDate.setTitle(resultString, for: .normal)
            btnOutletExpEndDate.setTitleColor(.black, for: .normal)

        }else if selectDateFor == "Education Start Date"{
            
            let showStartDate = inputFormatter.date(from: value)
            inputFormatter.dateFormat = DateFormatterConstant.kdateyyyy_mm_dd
            let resultString = inputFormatter.string(from: showStartDate!)
            strStartDatr = resultString
            btnOutletStartDate.setTitle(resultString, for: .normal)
            btnOutletStartDate.setTitleColor(.black, for: .normal)
            
        }else if selectDateFor == "Education End Date"{
            
            let showEndDate = inputFormatter.date(from: value)
            inputFormatter.dateFormat = DateFormatterConstant.kdateyyyy_mm_dd
            let resultString = inputFormatter.string(from: showEndDate!)
            strEndDate = resultString
            ProfileAboutString.edu_Present = 0
            btnOutletEndDate.setTitle(resultString, for: .normal)
            btnOutletEndDate.setTitleColor(.black, for: .normal)
        }
    }
    
    func dobCancelTapped() {
        
    }
    
    
}

/*
 
 */

class customTblView: UITableView {
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }
    
    override var contentSize: CGSize {
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
}
