//
//  LatestTrendDetailsVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 30/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class LatestTrendDetailsVC: UIViewController {

    //MARK:- @IBOutlets
    @IBOutlet weak var lblArticleTitle: UILabel!
    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var articleCoverImgVw: UIImageView!
    @IBOutlet weak var lblInterested: UILabel!
    @IBOutlet weak var lblArticleDesc: UILabel!
    @IBOutlet weak var btnReact: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnReshare: UIButton!
    @IBOutlet weak var commentBoxTF: UITextView!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var btnBAck: UIButton!
    @IBOutlet weak var commentsTable: UITableView!
    
    
    var trendId = 0
    var trendTitle = ""
    var trendDetails : LatestTrendsData?
    var commentText = ""
    var reactToPostType = ""
    let loadingIndicator: ProgressView = {
        let progress = ProgressView(colors: [#colorLiteral(red: 0.6446513191, green: 0.02597923801, blue: 0.1453336775, alpha: 1)], lineWidth: 3)
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    var imageUrlString: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        commentsTable.register(UINib(nibName: "PostCommentCell", bundle: nil), forCellReuseIdentifier: "PostCommentCell")
//        self.commentBoxTF.placeholder = "Say something"
        self.lblArticleTitle.text = trendDetails?.heading
        self.lblUserName.text = trendDetails?.heading
        self.lblArticleDesc.text = trendDetails?.description
        //        self.lblInterested.text = "\(String(describing: articleDetails?.event_interested))"
        let urlStr = AppConstants.BASE_TRENDING_UPLOAD_URL + "/" + (trendDetails?.image ?? "")
        self.imageUrlString = urlStr
        self.articleCoverImgVw.imageFromServerURL(urlString: urlStr) { (image) in
            //            cell.imgView.image = cell.imgView.image?.crop(to: cell.imgView.frame.size)
        }
//        self.userProfileImg.imageFromServerURL(urlString: self.trendDetails?.image ?? "") { (image) in
            //            cell.imgView.image = cell.imgView.image?.crop(to: cell.imgView.frame.size)
//        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        commentsTable.reloadData()
        commentBoxTF.roundCornerWithShadow(shadowColor: UIColor.clear, radius: 5, borderWidth: 0.5, borderColor: UIColor.gray, shadowOpacity: 0.3, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: true)
    }
    
    
    func reactUnreactToPost(id: String, type: String, ratings:String) {
        
        let parameters: [String: Any] = [
            "action" : "reactUnreactPost",
            "user" : UserSessionManager.shared.getUserId() ?? "",
            "post_id": id,
            "react_type": type,
            "ratings": ratings,
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.loadingIndicator.isAnimating = false
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                    self.commentsTable.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }
    
    
    
    func spreadPost(pid: String, shareMessage:String, share_to: String, page: Int, group:Int) {
      //  {"action":"sharePost","user":"1","post_id":"2624","share_to":"timeline","message":"happy newyear","page":"0","group":"0"}
        
        let parameters: [String: Any] = [
            "action"        : "sharePost",
            "user"          : UserSessionManager.shared.getUserId() ?? "",
            "post_id"       : pid,
            "message"       : shareMessage,
            "share_to"      : share_to,
            "page"          : "\(page)",
            "group"         : "\(group)"
        ]
        
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.loadingIndicator.isAnimating = false
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                    self.commentsTable.reloadData()
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
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.loadingIndicator.isAnimating = false
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                    self.commentsTable.reloadData()
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
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.loadingIndicator.isAnimating = false
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                    self.commentsTable.reloadData()
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
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.loadingIndicator.isAnimating = false
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                    self.commentsTable.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }
    
     //MARK:- @IBActions
       
       @IBAction func backBtnTapped(_ sender: UIButton) {
           self.navigationController?.popViewController(animated: true)
       }
       
    @IBAction func reactBtnTapped(_ sender: UIButton) {
        print("react tapped")
        //           CustomPopUpView.instance.showAuthenticationAlert()
        //           CustomPopUpView.instance.sharePostVw.isHidden = true
        //           CustomPopUpView.instance.addStoryVw.isHidden = true
        //           CustomPopUpView.instance.reportVw.isHidden = true
        //           CustomPopUpView.instance.spreadPostVw.isHidden = true
        //           CustomPopUpView.instance.reactVw.isHidden = false
        //           CustomPopUpView.instance.delegate = self
        likeTapped(rate: "\(btnReact.tag == 0 ? 1 : 0)", whats_id: "\(self.trendDetails?.what_id ?? 0)")
    }
    
    func likeTapped(rate:String, whats_id:String){
        
        let parameters: [String: Any] = [
            "action" : "reactUnreactWhatsNew",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "whats_id": whats_id,
            "rate": rate
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.loadingIndicator.isAnimating = false
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                    if self.btnReact.tag == 0{
                        self.btnReact.tag = 1
                        self.btnReact.setImage(UIImage(systemName: "star.fill"), for: .normal)
                    }else{
                        self.btnReact.tag = 0
                        self.btnReact.setImage(UIImage(systemName: "star"), for: .normal)
                    }
                    self.commentsTable.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }
       
       @IBAction func commentBtnTapped(_ sender: UIButton) {
           
       }
       
       @IBAction func reshareBtnTapped(_ sender: UIButton) {
      
       }
       
       @IBAction func sendBtnTapped(_ sender: UIButton) {
      
       }
    
    @IBAction func imageTapped(_ sender: UIButton){
        let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kImagePreviewViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! ImagePreviewViewController
        vc.imgStr = self.imageUrlString
//        vc.transferDatadelegate = self
        present(vc, animated: true, completion: nil)
    }
    
    
    
    func sendCommentTapped(comment:String, newsId:String){
        
        let parameters: [String: Any] = [
            "action" : "postTrendingNewsComment",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "news_id": newsId,
            "comment": comment
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.loadingIndicator.isAnimating = false
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                    
                    self.commentsTable.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }
}

extension LatestTrendDetailsVC: CustomPopUpDelegate {
    func shareTypeAction(type: String) {
        
    }
    
    func detetePost() {
        
    }
    
    func editCommentOnFeedAction(type: Int) {
        if type == 0 {
            editcommentOnPost(id: "", message: self.commentText)
        } else {
            deletecommentOnPost(id: "", postId: "\(self.trendDetails?.what_id ?? 0)")
        }
    }
    
   
    func spreadAction(type: String, shareMessage:String, pageId:Int, groupId:Int) {
        print("Spread tapped")
        CustomPopUpView.instance.parentView.removeFromSuperview()
        self.spreadPost(pid: "\(self.trendDetails?.what_id ?? 0)", shareMessage: shareMessage, share_to: type, page: 0, group: 0)
    }
    
    func reactToFeedAction(ratings: Int) {
        print("reactToFeedAction tapped")
        loadingIndicator.isAnimating = true
        
        if self.reactToPostType == "react" {
            reactUnreactToPost(id: "\(self.trendDetails?.what_id ?? 0)", type: self.reactToPostType, ratings: "\(ratings)")
        } else {
            reactUnreactToPost(id: "\(self.trendDetails?.what_id ?? 0)", type: self.reactToPostType, ratings: "0")
        }
        CustomPopUpView.instance.parentView.removeFromSuperview()
    }
    
    func submitBtnAction() {
        
    }
    
    func uploadPhotoBtnAction() {
        
    }
    
    func createAlbumBtnAction() {
        
    }
    
    func uploadVideoBtnAction() {
        
    }
    
    func uploadPdfBtnAction() {
        
    }
    
    func selectModeBtnAction() {
        
    }
    
    func publishBtnAction() {
        
    }
    
    func addPhotoStoryAction() {
        
    }
    
    func addVideoStoryAction() {
        
    }
    
    func spreadDiscussionAction() {
        
    }
    
    func spreadPageAction() {
        
    }
    
    func spreadAction() {
        
    }
    
    func reportPostAction() {
        
    }
    
    func reactAction() {
        //TODO:- react action here
        
    }
    
    
}


extension LatestTrendDetailsVC: UITableViewDelegate, UITableViewDataSource, PostCommentCellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCommentCell", for: indexPath) as! PostCommentCell
        cell.tag = indexPath.row
        cell.delegate = self
//        cell.btnSendComment.addTarget(self, action: #selector(handleSendComment), for: .touchUpInside)
        self.commentText = cell.commentBox.text 
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func sendCommentAction(index: Int) {
        guard let cell = self.commentsTable.cellForRow(at: IndexPath(row: index, section: 0)) as? PostCommentCell else{return}
        if cell.commentBox.text.trimmingCharacters(in: .whitespaces) != ""{
            let comment = cell.commentBox.text ?? ""
            cell.commentBox.text = ""
//            cell.commentBox.placeholder = "Say something..."
            let newsId = self.trendDetails?.what_id ?? 0
            self.sendCommentTapped(comment: comment, newsId: "\(newsId)")
        }
    }
    
}
