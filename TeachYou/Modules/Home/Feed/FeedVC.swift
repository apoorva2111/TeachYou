//
//  FeedVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 04/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Photos

class FeedVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewRatingList: UIView!
    @IBOutlet weak var tblRatingView: UITableView!
    
    @IBAction func btnRatinViewListAction(_ sender: UIButton) {
        viewRatingList.isHidden = true
        viewRatingPopup.isHidden = true
    
    }
    
    var arrNewFeedOrigin : [NSDictionary] = []
    
    @IBOutlet weak var viewRatingPopup: UIView!
    @IBOutlet weak var viewEditCommenPopup: UIView!

    @IBOutlet weak var txtViewEditComent: UITextView!
  
    @IBAction func btnEditCommentSubmitAction(_ sender: Any) {
        if txtViewEditComent.text == "" {
            Utilities.showAlert(title: "", message: "", buttons: ["Ok": {}])
        }
        editcommentOnPost(id: "\(self.editCommentId)", message: txtViewEditComent.text)

    }
    
    @IBAction func btnEditCommentCancelAction(_ sender: Any) {
        viewRatingPopup.isHidden = true
        viewRatingList.isHidden = true
    
    }
    
    @IBOutlet weak var tblBottomConstraint: NSLayoutConstraint!
    
    var refreshTbl: UIRefreshControl!
    var imagePicker : ImagePicker?
    var pickedImage : UIImage?
    var images = [UIImage]()
    var imagePostData = [Data]()
    var docData = [Data]()
    var mimeType = [String]()
    var feedModel = [Posts]()
    var arrAppreciates = [PostAppreciates]()
    var storiesModel = [StoriesArray]()
    var page = 0
    var limit = 10
    var addStoryTapped = false
    var reactToPostId = ""
    var editCommentId = 0
    var commentMessage = ""
    var reactToPostType = ""
    var group = ""
    var shareType = ""
    var imgNames = [String]()
    var post_id = ""
    
    
    let loadingIndicator: ProgressView = {
        let progress = ProgressView(colors: [#colorLiteral(red: 0.6446513191, green: 0.02597923801, blue: 0.1453336775, alpha: 1)], lineWidth: 3)
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshTbl = UIRefreshControl()
    
        tableView.register(UINib(nibName: "ServicesCell", bundle: nil), forCellReuseIdentifier: "services")
        tableView.delegate = self
        tableView.dataSource = self
     
        self.tblRatingView.register(UINib(nibName: "StarAppreciatesTVCell", bundle: nil), forCellReuseIdentifier: "StarAppreciatesTVCell")
     
        viewRatingList.isHidden = true
        viewRatingPopup.isHidden = true
        viewEditCommenPopup.isHidden = true

        setUpLoadingVw()
        getPosts()
        getStories()
      
    }
    
    func run(after wait: TimeInterval, closure: @escaping () -> Void) {
        let queue = DispatchQueue.main
        queue.asyncAfter(deadline: DispatchTime.now() + wait, execute: closure)
    }
    
    @objc func onRefreshTbl() {
        run(after: 1) {
            self.getPosts()
            self.refreshTbl.endRefreshing()
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       

    }
    
    func setUpLoadingVw() {
        overrideUserInterfaceStyle = .light
        self.view.addSubview(loadingIndicator)
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            loadingIndicator.widthAnchor.constraint(equalToConstant: 35),
            loadingIndicator.heightAnchor.constraint(equalTo: self.loadingIndicator.widthAnchor)
        ])
    }
    
    func getPosts() {
        
        self.tableView.isHidden = true
        self.loadingIndicator.isAnimating = true
        
        let parameters: [String: Any] = [
            "action" : "getPosts",
            "post_type" : "discussion",
            "user" : UserSessionManager.shared.getUserId() ?? "",
            "filter" : "all"
        ]
   print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        self.feedModel = []
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                
                print(response)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.tableView.isHidden = false
                    self.loadingIndicator.isAnimating = false
                }
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    
                   
                    let objRes: FeedModel = try JSONDecoder().decode(FeedModel.self, from: dataResponse)
                    if self.feedModel.count>0{
                        self.feedModel.removeAll()
                    }
                    if self.arrNewFeedOrigin.count>0{
                        self.arrNewFeedOrigin.removeAll()
                    }
                    if let result = response.value as? [String:Any] {
                        if  let rePosts = result["posts"] as? [NSDictionary]{
                            for obj in rePosts{
                                self.arrNewFeedOrigin.append(obj)
                            }
                        }

                    }
                    
                    for each in objRes.posts ?? [] {
                        print(each)
                        self.feedModel.append(each)
                    }
             //   self.tableView.setContentOffset(.zero, animated: true)
                    self.refreshTbl.addTarget(self, action: #selector(self.onRefreshTbl), for: .valueChanged)
                    self.tableView.addSubview(self.refreshTbl)
                  
                    let getiPhone = self.getPhoneScreen()
                   
                    if getiPhone == .iphone6 || getiPhone == .iphonePlus {
                        self.tblBottomConstraint.constant = 50
                    }else{
                        self.tblBottomConstraint.constant = 0
                    }
                    self.tableView.reloadData()
                } catch let error{
                    print(error)
                    self.refreshTbl.addTarget(self, action: #selector(self.onRefreshTbl), for: .valueChanged)
                    self.tableView.addSubview(self.refreshTbl)


                }

        }
    }
    
    func getStories() {
        let parameters: [String: Any] = [
            "action" : "getStories",
            "user" : UserSessionManager.shared.getUserId() ?? ""
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
                do
                {
                    let objRes: StoriesModel = try JSONDecoder().decode(StoriesModel.self, from: dataResponse)
                    if self.storiesModel.count>0{
                        self.storiesModel.removeAll()
                    }
                    for each in objRes.stories?.array ?? [] {
                        self.storiesModel.append(each)
                    }
                    self.tableView.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }
    func getPostAppreciates(pid:String){
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
                  //  self.tblRatingView.setContentOffset(.zero, animated: true)
                    self.tblRatingView.reloadData()
                    self.viewRatingList.isHidden = false
                    self.viewRatingPopup.isHidden = false
                    self.viewEditCommenPopup.isHidden = true

                } catch let error{
                    print(error)
                }
            }
    }
    
    
    func addPostWithImage(){
        self.loadingIndicator.isAnimating = true

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
            self.loadingIndicator.isAnimating = false
            Utilities.showAlert(title: "Post", message: "Story uploaded successfully", buttons: ["Ok": {}])
            self.getPosts()
            self.docData.removeAll()
            self.tableView.reloadData()
            CustomPopUpView.instance.parentView.removeFromSuperview()

        })
print("error")
    }
    
    func addStory()
    {
        let imgData = pickedImage!.jpegData(compressionQuality: 0.2)!

        let parameters: [String: Any] = [
            "action"        :   "postStory",
            "user_id"       :   UserSessionManager.shared.getUserId() ?? ""
        ]

        AF.upload(multipartFormData: { (multipartFormData) in
            let jsonData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
            multipartFormData.append(jsonData, withName: "" )

            multipartFormData.append("postStory".data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"action")
            multipartFormData.append("\(UserSessionManager.shared.getUserId() ?? "")".data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data(), withName :"user_id")
            multipartFormData.append(imgData, withName: "photos[]",fileName: "image.jpg", mimeType: "image/jpg")

        }, to: AppConstants.BASE_URL, method: .post).responseJSON(completionHandler: { (response) in
            print(response)
           // self.getPosts()
            self.getStories()
            self.docData.removeAll()
            self.tableView.reloadData()
            CustomPopUpView.instance.parentView.removeFromSuperview()

        })
print("error")
    }
    
    func reactUnreactToPost(id: String, type: String, ratings:String) {
        
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
                    self.tableView.isHidden = false
                    self.loadingIndicator.isAnimating = false
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                    self.getPosts()
                } catch let error{
                    print(error)
                }
        }
    }
    
    
    func commentOnPost(id: String, message:String) {
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
                    self.tableView.isHidden = false
                    self.loadingIndicator.isAnimating = false
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                    self.getPosts()
                } catch let error{
                    print(error)
                }
        }
    }
    
    func editcommentOnPost(id: String, message: String) {
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
                    self.tableView.isHidden = false
                    self.loadingIndicator.isAnimating = false
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                let objRes = try JSONSerialization.jsonObject(with: dataResponse, options: .allowFragments) as? [String: AnyObject]

                    print(objRes?["status"] ?? "")
                    self.getPosts()
                    self.viewRatingList.isHidden = true
                    self.viewEditCommenPopup.isHidden = true
                } catch let error{
                    print(error)
                }
        }
    }
    
    func deletecommentOnPost(id: String, postId: String) {
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
                    self.tableView.isHidden = false
                    self.loadingIndicator.isAnimating = false
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                    self.getPosts()
                    self.tableView.reloadData()


                } catch let error{
                    print(error)
                }
        }
    }
    
    func spreadPost(pid: String, shareMessage:String, share_to: String, page: Int, group:Int) {
        
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
                    self.tableView.isHidden = false
                    self.loadingIndicator.isAnimating = false
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                    self.getPosts()
                } catch let error{
                    print(error)
                }
        }
    }
    
    func reportPost(pid: String) {
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
                    self.tableView.isHidden = false
                    self.loadingIndicator.isAnimating = false
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
                    self.getPosts()
                } catch let error{
                    print(error)
                }
        }
    }
    
    func editPostForWhatsGoingOn() {
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
                self.getPosts()
                CustomPopUpView.instance.viewPublic.isHidden = true
                CustomPopUpView.instance.parentView.removeFromSuperview()
        }
    }
    
    func deletePostForWhatsGoingOn() {
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
                self.getPosts()
                CustomPopUpView.instance.viewPublic.isHidden = true
                CustomPopUpView.instance.parentView.removeFromSuperview()
        }
    }
    func submitWhatsGoingOn() {
        if shareType == ""{
            shareType = "public"
        }

        let parameters: [String: Any] = [
            "action" : "sendPosts",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "user_type" : "user",
            "post_type" : "post",
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
                self.getPosts()
                CustomPopUpView.instance.viewPublic.isHidden = true
                CustomPopUpView.instance.parentView.removeFromSuperview()
        }
    }
}


extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblRatingView {
            return arrAppreciates.count
        }else{
            return self.feedModel.count + 3
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "services", for: indexPath) as! ServicesCell
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as! StoryCell
                cell.storiesCount = self.storiesModel.count
                cell.storyArr = self.storiesModel
                cell.collectionView.reloadData()
                cell.delegate = self
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "StatusCell", for: indexPath) as! StatusCell
                cell.delegate = self
                return cell
            } else {
                if self.feedModel.count > 0 {
                    if self.feedModel[indexPath.row - 3].photos?.count ?? 0 > 0 {
                        let cell = tableView.dequeueReusableCell(withIdentifier: "postWithImage", for: indexPath) as! FeedCell
                        cell.setMyPostdata(post: self.feedModel[indexPath.row - 3], originArr:self.arrNewFeedOrigin[indexPath.row - 3])
                        cell.tableView = tableView
                        cell.feedModel = self.feedModel
                        cell.arrNewFeedOrigin = self.arrNewFeedOrigin
                        cell.delegate = self
                        cell.viewEditPost.isHidden = true
                        cell.viewDeletePost.isHidden = true
                        cell.viewReport.isHidden = true
                        cell.btnReportOutlet.addTarget(self, action: #selector(ReportPostAction), for: .touchUpInside)
                        cell.btnEditPostOutlet.addTarget(self, action: #selector(EditPostAction), for: .touchUpInside)
                        cell.viewDeletePostOutlet.addTarget(self, action: #selector(DeletePostAction), for: .touchUpInside)


                        cell.layoutIfNeeded()
                

                        return cell
                    }else {
                        let cell = tableView.dequeueReusableCell(withIdentifier: "post", for: indexPath) as! FeedCell
                        cell.setMyPostdata(post: self.feedModel[indexPath.row - 3], originArr: self.arrNewFeedOrigin[indexPath.row - 3])
                        cell.delegate = self
                        cell.tableView = tableView
                        cell.feedModel = self.feedModel
                        cell.viewEditPost.isHidden = true
                        cell.viewDeletePost.isHidden = true
                        cell.viewReport.isHidden = true
                        cell.btnReportOutlet.addTarget(self, action: #selector(ReportPostAction), for: .touchUpInside)
                        cell.btnEditPostOutlet.addTarget(self, action: #selector(EditPostAction), for: .touchUpInside)
                        cell.viewDeletePostOutlet.addTarget(self, action: #selector(DeletePostAction), for: .touchUpInside)

                        cell.layoutIfNeeded()
                    
                        return cell
                    }
                    
                } else {
                    return UITableViewCell()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tblRatingView {
            return 60
        }
        else{
            if indexPath.row == 0 {
                return 115
            } else if indexPath.row == 1 {
                return 120
            } else if indexPath.row == 2 {
                return 70
            } else {
                return UITableView.automaticDimension
            }
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 1 {
//
//        } else if indexPath.row > 2 {
//
//        }
//    }
   
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if ((tableView.contentOffset.y + tableView.frame.size.height) >= tableView.contentSize.height)
        {
            
        } else {
            
        }
    }
    
    @objc func loadMoreCells() {
        print("view more tapped")
    }
   
    @objc  func ReportPostAction(_ sender: UIButton) {
        let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: buttonPosition)
        
        let obj = self.feedModel[indexPath!.row-3]
       let id:Int = obj.post_id!
        let strUserId:String = String(describing: id)
        reactToPostId = strUserId
        
        reportPostAction()
    }
    @objc  func EditPostAction(_ sender: UIButton) {
        let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: buttonPosition)
        
        let obj = self.feedModel[indexPath!.row-3]
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
        let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: buttonPosition)
        
        let obj = self.feedModel[indexPath!.row-3]
        let id:Int = obj.post_id!
         let strUserId:String = String(describing: id)
         reactToPostId = strUserId
        BoolValue.isFromEditPost = false
        CustomPopUpView.instance.parentView.removeFromSuperview()
        Utilities.showAlert(title: "", message: "Are you sure want to delete this post?", buttons: ["YES":{
                                                                                                        self.deletePostForWhatsGoingOn()},"CANCEL":{}])

    }

}


extension FeedVC : FeedCellDelegate {
    
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
        self.tableView.reloadData()
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

extension FeedVC: TransferImage {
    
    func sendImageToPreviousView(image: UIImage) {
//        Utilities.showProgressIndicator()
    }
    
}

extension FeedVC : StatusCellDelegate {
    
    func statusCellTapAction() {
        CustomPopUpView.instance.showAuthenticationAlert()
        CustomPopUpView.instance.addStoryVw.isHidden = true
        CustomPopUpView.instance.spreadPostVw.isHidden = true
        CustomPopUpView.instance.reportVw.isHidden = true
        CustomPopUpView.instance.editCommentVw.isHidden = true
        CustomPopUpView.instance.reactVw.isHidden = true
        CustomPopUpView.instance.sharePostVw.isHidden = false
        CustomPopUpView.instance.delegate = self
    }
    
}


extension FeedVC : CustomPopUpDelegate {
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
        loadingIndicator.isAnimating = true
        self.tableView.isHidden = false
        
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
        addStory()
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
                    submitWhatsGoingOn()
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


extension FeedVC : PickerViewDelegate {
    func doneTapped(value: String, index: Int?) {
        
    }
    
    func cancelTapped() {
    }
    
}


extension FeedVC: ImagePickerDelegate {
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

extension FeedVC: UIDocumentPickerDelegate{
    
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


extension FeedVC: StoryCellDelegate {
    
    func addStoryAction() {
        print("create story tapped")
        self.addStoryTapped = true
        CustomPopUpView.instance.showAuthenticationAlert()
        CustomPopUpView.instance.sharePostVw.isHidden = true
        CustomPopUpView.instance.spreadPostVw.isHidden = true
        CustomPopUpView.instance.editCommentVw.isHidden = true
        CustomPopUpView.instance.reportVw.isHidden = true
        CustomPopUpView.instance.reactVw.isHidden = true
        CustomPopUpView.instance.addStoryVw.isHidden = false
        CustomPopUpView.instance.delegate = self
    }
    
    func viewStoryAction() {
        print("View story tapped")
        let storyPreviewScene = Utilities.viewConrollerObject(identifier: "StoriesVC", storyboard: StoryBoardConstants.kMainStoryBoard) as! StoriesVC
        storyPreviewScene.items = self.storiesModel[0].items ?? []
        self.navigationController?.pushViewController(storyPreviewScene, animated: true)
    }
    
}

extension FeedVC{
    
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
