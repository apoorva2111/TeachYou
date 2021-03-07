//
//  ProfileDiscussionTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 23/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit


class ProfileDiscussionTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewProfile: UIImageView!
    @IBOutlet weak var imageViewPost: UIImageView!
    
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelFeeling: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelNoPosts: UILabel!
    @IBOutlet weak var lblAdded: UILabel!
    @IBOutlet weak var btnReact: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnReport: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var bottomBtnVw: UIView!
    @IBOutlet weak var commentVw: UIView!
    @IBOutlet weak var commentProfileImgVw: UIImageView!
    //@IBOutlet weak var commentBox: UITextView!
    @IBOutlet weak var btnSendComment: UIButton!
    @IBOutlet weak var btnExpandImg: UIButton!
    @IBOutlet weak var lblCommentCount: UILabel!
    @IBOutlet weak var lblShareCount: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewEditPost: UIView!
    @IBOutlet weak var viewDeletePost: UIView!
    @IBOutlet weak var btnDeletePostOutlet: UIButton!
    @IBOutlet weak var btnEditPostOutlet: UIButton!

    @IBOutlet weak var viewBG: UIView!
    
    
    var delegate: FeedCellDelegate?
    var imgUrl = ""
    var commentsCount = 0
    var commentStr = ""
    var isOpen = false
    var postModel : Posts?
    var postId = ""
    var reactType = ""
    var tableView : UITableView!
    var selectedCommentId = 0
    var selectedComment = ""
    var feedModel = [Posts]()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewSetup()
      // self.commentVw.isHidden = true
        viewBG.roundCornerWithShadow(shadowColor: UIColor.clear, radius: 10, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity: 0.3, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: false)
        imageViewProfile.roundCornerWithShadow(shadowColor: UIColor.black, radius: imageViewProfile.frame.width/2, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity: 1, shadowRadius: 4, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: true)
        if(imageViewPost != nil){
            imageViewPost.roundCornerWithShadow(shadowColor: UIColor.clear, radius: 10, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity: 1, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: true)
        }
        viewEditPost.isHidden = true
        viewDeletePost.isHidden = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionViewSetup() {
        collectionView.register(UINib(nibName: "CommentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CommentCollectionViewCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
//     func setdata(post : Posts){
//            self.labelDescription.text = post.og_description
//            self.labelSubTitle.text = post.privacy
//            if(imageViewPost != nil){
//                if (post.photos?.count == 0) || (post.photos?.count == nil) {
//                    self.imageViewPost.isHidden = true
//                    self.lblAdded.isHidden = true
//                } else {
//                    self.lblAdded.isHidden = false
//                    self.imageViewPost.isHidden = false
//                    imageViewPost.imageFromServerURL(urlString: post.og_image ?? "") { (image) in
//                        self.imgUrl = post.og_image ?? ""
//                        self.imageViewPost.image = self.imageViewPost.image?.crop(to: self.imageViewPost.frame.size)
//                    }
//                }
//            }
//            self.labelTitle.text = (post.user_firstname ?? "") + " " + (post.user_lastname ?? "")
//
//            var urlComponent = URLComponents()
//            urlComponent.scheme = "https"
//            urlComponent.host = AppConstants.BASE_UPDATE_URL
//            urlComponent.path = post.user_picture ?? ""
//            guard let url = urlComponent.url else { return }
//            self.imageViewProfile.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "userPlaceholder"))
//
//        }
        
        func setMyPostdata(post : Posts?){
            self.postModel = post
            if post?.og_description != nil{
                let htmlStr = post?.og_description
                let decoded = htmlStr!.stringByDecodingHTMLEntities
                print(decoded)
                self.labelDescription.text = decoded

            }else{
                self.labelDescription.text = ""

            }
            self.labelSubTitle.text = post?.privacy
            self.postId = "\(post?.post_id ?? 0)"
            
            if post?.reactions_total_count ?? 0 > 0 {
                self.btnReact.isSelected = true
                self.labelNoPosts.text = "\(post?.reactions_total_count ?? 0)"
                if post?.i_react ?? false {
                    self.reactType = "unreact"
                }
            } else {
                self.reactType = "react"
                self.btnReact.isSelected = false
                self.labelNoPosts.text = ""
            }
            
    //        if post?.comments ?? 0 > 0 {
            if post?.post_comments?.count ?? 0 > 0 {
                self.commentsCount = post?.post_comments?.count ?? 0
               self.collectionView.reloadData()
                self.lblCommentCount.text = "\(post?.post_comments?.count ?? 0)"//"\(post?.comments ?? 0)"
            } else {
                self.lblCommentCount.text = ""
                self.collectionView.reloadData()
            }
            
            if self.isOpen {
                self.commentsCount = post?.post_comments?.count ?? 0//post?.comments ?? 0
                if self.commentsCount > 0 {
                    self.collectionViewHeightConstraint.constant = CGFloat((self.commentsCount + 1) * 80)
                } else {
                    self.collectionViewHeightConstraint.constant = 60
                }
            } else {
                 self.collectionViewHeightConstraint.constant = 0
            }
            
            if post?.shares ?? 0 > 0 {
                self.lblShareCount.text = "\(post?.shares ?? 0)"
            } else {
                self.lblShareCount.text = ""
            }
            
            if(imageViewPost != nil){
                if (post?.photos?.count == 0) || (post?.photos?.count ?? 0 < 0) {
                    self.imageViewPost.isHidden = true
                    self.lblAdded.text = ""
                } else {
                    self.imageViewPost.isHidden = false
                    self.lblAdded.text = "added a photo"
                    imageViewPost.imageFromServerURL(urlString: post?.og_image ?? "") { (image) in
                        self.imgUrl = post?.og_image ?? ""
                        self.imageViewPost.image = self.imageViewPost.image?.crop(to: self.imageViewPost.frame.size)
                    }
                }
            }
                    
//            if let objOrigin = originArr["origin"] as? NSDictionary{
//                let strName = (post?.user_firstname ?? "") + " " + (post?.user_lastname ?? "")
//                let shareUserName = (objOrigin["user_firstname"] as! String) + " " + (objOrigin["user_lastname"] as! String)
//                self.labelTitle.text = strName + " " +  "spread" + " " +  shareUserName  + " post"
//
//                if post?.og_description != nil{
//                    let htmlStr = post?.og_description
//                    let decoded = htmlStr!.stringByDecodingHTMLEntities
//                    print(decoded)
//                    self.lblSharePostDiscription.text = decoded
//
//                }else{
//                    self.lblSharePostDiscription.text = ""
//
//                }
//
//                if objOrigin["og_description"] != nil{
//                    let htmlStr = objOrigin["og_description"] as! String
//                    let decoded = htmlStr.stringByDecodingHTMLEntities
//                    self.labelDescription.text = decoded
//
//                }else{
//                    self.labelDescription.text = ""
//
//                }
//
//            }else{
                let strName = (post?.user_firstname ?? "") + " " + (post?.user_lastname ?? "")
                self.labelTitle.text = strName
              
                if post?.og_description != nil{
                    let htmlStr = post?.og_description
                    let decoded = htmlStr!.stringByDecodingHTMLEntities
                    print(decoded)
                    self.labelDescription.text = decoded
    //                self.lblSharePostDiscription.text = decoded


                }else{
                    self.labelDescription.text = ""
                 //   self.lblSharePostDiscription.text = ""

                }
                     //   }
            if post?.post_type == "shared"{

            }else{
                self.labelTitle.text = (post?.user_firstname ?? "") + " " + (post?.user_lastname ?? "")
    //            self.labelDescription.text = ""

            }
           
            if let postImage = post?.user_picture{
                let url = "https://teachyou.in/content/uploads/" + postImage
            self.imageViewProfile.sd_setImage(with: URL(string: url), placeholderImage: #imageLiteral(resourceName: "userPlaceholder"))
                
            }else{
                self.imageViewProfile.image = #imageLiteral(resourceName: "userPlaceholder")
            }
            
        }
//        {
//            self.labelDescription.text = post?.og_description
//            self.labelSubTitle.text = post?.privacy
//            if(imageViewPost != nil){
//                if (post?.photos?.count == 0) {
//                    self.lblAdded.isHidden = true
//                } else {
//                    imageViewPost.imageFromServerURL(urlString: post?.og_image ?? "") { (image) in
//                        self.imgUrl = post?.og_image ?? ""
//                        self.imageViewPost.image = self.imageViewPost.image?.crop(to: self.imageViewPost.frame.size)
//                    }
//                    self.lblAdded.isHidden = false
//                }
//            }
//
//            self.labelTitle.text = (post?.user_firstname ?? "") + " " + (post?.user_lastname ?? "")
//
//            var urlComponent = URLComponents()
//            urlComponent.scheme = "https"
//            urlComponent.host = "https://teachyou.in/content/uploads/"
//            urlComponent.path = post?.user_picture ?? ""
//            guard let url = urlComponent.url else { return }
//            self.imageViewProfile.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "userPlaceholder"))
//
//        }
    
    
    
    @IBAction func reactBtnTapped(_ sender: UIButton) {
        if sender.tag == 10{
            delegate?.starListAction(pid: self.postId)
        }else{
        delegate?.reactAction(pid: self.postId, type: self.reactType)
        }
       }
       
       @IBAction func shareBtnTapped(_ sender: UIButton) {
        delegate?.shareAction(pid: "")
       }
       
       @IBAction func reportBtnTapped(_ sender: UIButton) {
//        delegate?.reportAction(postId: "")
            if sender.isSelected{
                sender.isSelected = false
                viewEditPost.isHidden = true
                viewDeletePost.isHidden = true
            }else{
                sender.isSelected = true
            let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:self.tableView)
            let indexPath = self.tableView.indexPathForRow(at: buttonPosition)
                let obj = self.feedModel[indexPath!.row-2]
            let userID = UserSessionManager.shared.getUserId()
            let id:Int = obj.user_id!
            let strUserId:String = String(describing: id)
         //  let strDiscription = self.labelDescription.text
          //  let privacy = obj.privacy ?? ""
            if strUserId  == userID{
    //            delegate?.editPostAction(userId: userID!, postId: postId, message: strDiscription ?? "" , privacy: privacy)
                viewEditPost.isHidden = false
                viewDeletePost.isHidden = false
                
            }else{
    //            delegate?.reportAction(postId: "\(self.postId)")
                viewEditPost.isHidden = true
                viewDeletePost.isHidden = true
                
            }
                
            }
       }
       
       @IBAction func commentBtnTapped(_ sender: UIButton) {
        if self.isOpen {
            self.isOpen = false
        } else {
            self.isOpen = true
        }
        self.collectionView.reloadData()
        delegate?.commentAction()
    }
       
       @IBAction func sendCommentBtntTapped(_ sender: UIButton) {
        delegate?.sendCommentAction(messageStr: "", id: "")
       }
       
       @IBAction func expandImgBtnTapped(_ sender: UIButton) {
           delegate?.expandImgAction(urlStr: self.imgUrl)
       }
    @IBAction func likeListTapped(_ sender: UIButton) {
        delegate?.starListAction(pid: self.postId)
    }

}

extension ProfileDiscussionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.commentsCount + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommentCollectionViewCell", for: indexPath) as! CommentCollectionViewCell
        if indexPath.item == self.commentsCount {
//            if (self.postModel?.post_comments!.count)! == 0 {
//            }
            cell.lblComment.isHidden = true
            cell.lblProfileNAme.isHidden = true
            cell.lblTimeAgo.isHidden = true
            cell.commentBox.isHidden = false
          
            cell.btnSendComment.isHidden = false
            cell.btnEditComment.isHidden = true

            cell.btnSendComment.addTarget(self, action: #selector(sendComment), for: .touchUpInside)
            cell.collection = collectionView
           // cell.tblCell = self
            cell.tblProfileDiscussionCell = self
             self.commentStr = cell.commentBox.text ?? ""
            cell.btnSendComment.setImage(#imageLiteral(resourceName: "send"), for: .normal)
            
        } else {
            cell.commentBox.isHidden = true
            cell.lblComment.isHidden = false
            cell.lblProfileNAme.isHidden = false
            cell.lblTimeAgo.isHidden = false
//            let iDate = Utilities.UTCToLocal(date: self.postModel?.post_comments?[indexPath.item].page_date ?? "")
            if (self.postModel?.post_comments?.isEmpty == nil) {
                print("empty")
            }else{
                cell.tblProfileDiscussionCell = self
            if (self.postModel?.post_comments!.count)! > 0 {
                cell.lblTimeAgo.text = self.postModel?.post_comments?[indexPath.item].page_date ?? "" //"\(iDate.getElapsedInterval() )"
            
            cell.lblComment.text = self.postModel?.post_comments?[indexPath.item].text ?? ""
                if self.postModel?.post_comments?[indexPath.item].user_firstname != "" && self.postModel?.post_comments?[indexPath.item].user_lastname != ""{
                    cell.lblProfileNAme.text = (self.postModel?.post_comments?[indexPath.item].user_firstname)! + (self.postModel?.post_comments?[indexPath.item].user_lastname)!
                }else if self.postModel?.post_comments?[indexPath.item].user_lastname != ""{
                    cell.lblProfileNAme.text = (self.postModel?.post_comments?[indexPath.item].user_lastname)!

                }else if self.postModel?.post_comments?[indexPath.item].user_firstname != ""{
                    cell.lblProfileNAme.text = (self.postModel?.post_comments?[indexPath.item].user_firstname)!
                }else{
                    cell.lblProfileNAme.text = ""
                }
                //    selectedComment = cell.lblComment.text!
                
            cell.commentProfileImgVw.imageFromServerURL(urlString: self.postModel?.post_comments?[indexPath.item].user_picture ?? "") { (image) in
                cell.commentProfileImgVw.roundCornerWithShadow(shadowColor: .clear, radius: cell.commentProfileImgVw.frame.height/2, borderWidth: 0, borderColor: .clear, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
            }
//                self.selectedCommentId = self.postModel?.post_comments?[indexPath.item].comment_id ?? 0

            }else{
                cell.commentBox.text  = ""
                self.commentStr =  ""
            }
                
            }
            cell.btnSendComment.isHidden = true
            cell.btnEditComment.isHidden = false

            cell.btnEditComment.addTarget(self, action: #selector(editComment), for: .touchUpInside)
            cell.btnEditComment.tag = indexPath.row
            cell.btnEditComment.setImage(#imageLiteral(resourceName: "menu (1)"), for: .normal)
            
        }
        
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == self.commentsCount {
            return CGSize(width: UIScreen.main.bounds.width - 60, height: 50)
        } else {
            return CGSize(width: UIScreen.main.bounds.width - 60, height: 70)
        }
    }
    @objc func sendComment() {
        
        if self.commentStr == "" {
            Utilities.showAlert(title: "Error", message: "Comment text cannot be empty", buttons: ["OK": {}])
        } else {
            delegate?.sendCommentAction(messageStr: self.commentStr, id: self.postId )
        }
        
    }
    @objc func editComment(_ sender: UIButton) {
        let indexpath = sender.tag
   
        self.selectedComment = self.postModel?.post_comments?[indexpath].text ?? ""
        self.selectedCommentId = self.postModel?.post_comments?[indexpath].comment_id ?? 0

        delegate?.editCommentAction(id: selectedCommentId, postId: self.postId, comment: selectedComment)
    }
}
