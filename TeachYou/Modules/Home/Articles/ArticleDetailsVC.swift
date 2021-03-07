//
//  ArticleDetailsVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 22/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire


class ArticleDetailsVC: UIViewController {

    
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
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    var articleDetails: Posts?
    var commentText = ""
    var reactToPostType = ""
    var selectedCommentId = ""
    let loadingIndicator: ProgressView = {
        let progress = ProgressView(colors: [#colorLiteral(red: 0.6446513191, green: 0.02597923801, blue: 0.1453336775, alpha: 1)], lineWidth: 3)
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    //MARK:- Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        commentsTable.register(UINib(nibName: "PostCommentCell", bundle: nil), forCellReuseIdentifier: "PostCommentCell")
        self.lblArticleTitle.text = articleDetails?.og_title
        self.lblUserName.text = articleDetails?.post_author_name
        self.lblArticleDesc.text = articleDetails?.og_description
//        self.lblInterested.text = "\(String(describing: articleDetails?.event_interested))"
        self.articleCoverImgVw.imageFromServerURL(urlString: self.articleDetails?.og_image ?? "") { (image) in
            //            cell.imgView.image = cell.imgView.image?.crop(to: cell.imgView.frame.size)
        }
        self.userProfileImg.imageFromServerURL(urlString: self.articleDetails?.post_author_picture ?? "") { (image) in
            //            cell.imgView.image = cell.imgView.image?.crop(to: cell.imgView.frame.size)
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableViewHeightConstraint.constant = CGFloat((self.articleDetails?.post_comments?.count ?? 0 + 1) * 60)
        commentBoxTF.roundCornerWithShadow(shadowColor: UIColor.clear, radius: 5, borderWidth: 0.5, borderColor: UIColor.gray, shadowOpacity: 0.3, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: true)
    }
    
    @objc func handleSendComment() {
        commentOnPost(id: "\(articleDetails?.post_id)", message: self.commentText)
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
    
    @objc func sendComment() {
        
        if self.commentText == "" {
            Utilities.showAlert(title: "Error", message: "Comment text cannot be empty", buttons: ["OK": {}])
        } else {
//            delegate?.sendCommentAction(messageStr: self.commentStr, id: self.postId )
        }
    }
    
    @objc func editComment() {
//        delegate?.editCommentAction(id: selectedCommentId, postId: self.postId)
    }
    
    
    //MARK:- @IBActions
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func reactBtnTapped(_ sender: UIButton) {
        print("react tapped")
        CustomPopUpView.instance.showAuthenticationAlert()
        CustomPopUpView.instance.sharePostVw.isHidden = true
        CustomPopUpView.instance.addStoryVw.isHidden = true
        CustomPopUpView.instance.reportVw.isHidden = true
        CustomPopUpView.instance.spreadPostVw.isHidden = true
        CustomPopUpView.instance.reactVw.isHidden = false
        CustomPopUpView.instance.delegate = self
    }
    
    @IBAction func commentBtnTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func reshareBtnTapped(_ sender: UIButton) {
   
    }
    
    @IBAction func sendBtnTapped(_ sender: UIButton) {
   
    }


}


extension ArticleDetailsVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleDetails?.post_comments?.count ?? 0 + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCommentCell", for: indexPath) as! PostCommentCell
        if indexPath.item == self.articleDetails?.post_comments?.count ?? 0 {
            cell.lblCommentText.isHidden = true
            cell.lblUserName.isHidden = true
            cell.lblTimeAgo.isHidden = true
            cell.commentBox.isHidden = false
            cell.btnSendComment.addTarget(self, action: #selector(sendComment), for: .touchUpInside)
            self.commentText = cell.commentBox.text ?? ""
            cell.btnSendComment.setImage(#imageLiteral(resourceName: "send"), for: .normal)
            
        } else {
            cell.commentBox.isHidden = true
            cell.lblCommentText.isHidden = false
            cell.lblUserName.isHidden = false
            cell.lblTimeAgo.isHidden = false
            //            let iDate = Utilities.UTCToLocal(date: self.postModel?.post_comments?[indexPath.item].page_date ?? "")
            cell.lblTimeAgo.text = self.articleDetails?.post_comments?[indexPath.item].page_date ?? "" //"\(iDate.getElapsedInterval() )"
            cell.lblCommentText.text = self.articleDetails?.post_comments?[indexPath.item].text ?? ""
            cell.lblUserName.text = self.articleDetails?.post_comments?[indexPath.item].user_name ?? ""
            cell.commentProfileImgVw.imageFromServerURL(urlString: self.articleDetails?.post_comments?[indexPath.item].user_picture ?? "") { (image) in
                cell.commentProfileImgVw.roundCornerWithShadow(shadowColor: .clear, radius: cell.commentProfileImgVw.frame.height/2, borderWidth: 0, borderColor: .clear, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
            }
            cell.btnSendComment.addTarget(self, action: #selector(editComment), for: .touchUpInside)
            cell.btnSendComment.setImage(#imageLiteral(resourceName: "menu (1)"), for: .normal)
            self.selectedCommentId = "\(self.articleDetails?.post_comments?[indexPath.item].comment_id ?? 0)"
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}


extension ArticleDetailsVC: CustomPopUpDelegate {

    
    func shareTypeAction(type: String) {
    }
    
    func detetePost() {
    }
    
    func editCommentOnFeedAction(type: Int) {
        if type == 0 {
            editcommentOnPost(id: "", message: self.commentText)
        } else {
            deletecommentOnPost(id: "", postId: "\(self.articleDetails?.post_id ?? 0)")
        }
    }
    
   
    func spreadAction(type: String, shareMessage: String, pageId: Int, groupId: Int) {
        print("Spread tapped")
        CustomPopUpView.instance.parentView.removeFromSuperview()
        self.spreadPost(pid: "\(self.articleDetails?.post_id ?? 0)", shareMessage: shareMessage, share_to: type, page: 0, group: 0)
    }
    
    func reactToFeedAction(ratings: Int) {
        print("reactToFeedAction tapped")
        loadingIndicator.isAnimating = true
        
        if self.reactToPostType == "react" {
            reactUnreactToPost(id: "\(self.articleDetails?.post_id ?? 0)", type: self.reactToPostType, ratings: "\(ratings)")
        } else {
            reactUnreactToPost(id: "\(self.articleDetails?.post_id ?? 0)", type: self.reactToPostType, ratings: "0")
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
