//
//  CustomPopUpView.swift
//  Shopoholic
//
//  Created by Kriti Agarwal on 20/05/20.
//  Copyright © 2020 Gurdeep Singh. All rights reserved.
//

import UIKit
import Alamofire
protocol CustomPopUpDelegate {
    func submitBtnAction()
    func uploadPhotoBtnAction()
    func createAlbumBtnAction()
    func uploadVideoBtnAction()
    func uploadPdfBtnAction()
    func selectModeBtnAction()
    func publishBtnAction()
    func addPhotoStoryAction()
    func addVideoStoryAction()
    func spreadAction(type: String, shareMessage:String, pageId:Int, groupId:Int)
    func reportPostAction()
    func reactToFeedAction(ratings:Int)
    func editCommentOnFeedAction(type:Int)
    func shareTypeAction(type:String)
    func detetePost()

}

class CustomPopUpView: UIView, UITextViewDelegate {

    //MARK:- @IBOutlets
   /*
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var popUpHeightConstraint: NSLayoutConstraint!
    
  
    
  
    
     */
    @IBOutlet weak var lblSelectPage: UILabel!
    @IBOutlet weak var reactVw: UIView!
    @IBOutlet weak var viewPage: UIView!
    @IBOutlet weak var btnAddVideoStory: UIButton!
    @IBOutlet weak var spreadPostVw: UIView!
    @IBOutlet weak var btnDiscussion: UIButton!
    @IBOutlet weak var btnPage: UIButton!
    @IBOutlet weak var btnGroup: UIButton!
    @IBOutlet weak var lblPage: UILabel!
    @IBOutlet weak var spreadMessageBox: UITextView!
    @IBOutlet weak var btnSpread: UIButton!
    @IBOutlet weak var tblPage: UITableView!
    @IBOutlet weak var viewPublic: UIView!
    @IBOutlet weak var sharePostVw: UIView!
    @IBOutlet weak var mainVw: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var userimgSpreed: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var btnUploadPhoto: UIButton!
    @IBOutlet weak var btnCreateAlbum: UIButton!
    @IBOutlet weak var btnUploadVideo: UIButton!
    @IBOutlet weak var btnUploadPdf: UIButton!
    @IBOutlet weak var btnMode: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var addStoryVw: UIView!
    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var btnAddStoryPhoto: UIView!
    @IBOutlet weak var cameraimgVw: UIImageView!
    @IBOutlet weak var videoImgVw: UIImageView!
    @IBOutlet weak var btnPublish: UIButton!
    @IBOutlet weak var reportVw: UIView!
    @IBOutlet weak var btnReportPost: UIButton!
    @IBOutlet weak var editCommentVw: UIView!
    @IBOutlet var btnReact: [UIButton]!
    @IBOutlet var parentView: UIView!

    
    //MARK:- Properties
    static let instance = CustomPopUpView()
    var goToLogin = false
    var authenticationFlag = false
    var delegate : CustomPopUpDelegate?
    var contentView: UIView!
    var spreadType = ""
    var arrPageList = [Pages]()
    var arrGroupList = [Groups]()
    var pageId = 0
    var groupId = 0
   
    var userId = ""
    var postId = ""
    var message = ""
    var privacy = ""
    
    let loadingIndicator: ProgressView = {
        let progress = ProgressView(colors: [#colorLiteral(red: 0.6446513191, green: 0.02597923801, blue: 0.1453336775, alpha: 1)], lineWidth: 3)
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    //MARK:- Required Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("CustomPopUpView", owner: self, options: nil)
        for each in btnReact {
            each.isSelected = false
        }
        viewPublic.isHidden = true

        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- Extra Methods
    
    func commonInit() {
        bgView.roundCornerWithShadow(shadowColor: .clear, radius: 10, borderWidth: 0, borderColor: .clear, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        addStoryVw.roundCornerWithShadow(shadowColor: .clear, radius: 10, borderWidth: 0, borderColor: .clear, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        mainVw.roundCornerWithShadow(shadowColor: .clear, radius: 10, borderWidth: 0.75, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        btnUploadVideo.roundCornerWithShadow(shadowColor: .clear, radius: btnUploadVideo.frame.height/2, borderWidth: 0.75, borderColor: .black, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        btnMode.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 0.75, borderColor: .black, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        btnSubmit.roundCornerWithShadow(shadowColor: .clear, radius: btnUploadVideo.frame.height/2, borderWidth: 0, borderColor: .black, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
//        btnUploadPdf.roundCornerWithShadow(shadowColor: .clear, radius: btnUploadVideo.frame.height/2, borderWidth: 0.75, borderColor: .black, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        btnCreateAlbum.roundCornerWithShadow(shadowColor: .clear, radius: btnUploadVideo.frame.height/2, borderWidth: 0.75, borderColor: .black, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        btnUploadPhoto.roundCornerWithShadow(shadowColor: .clear, radius: btnUploadVideo.frame.height/2, borderWidth: 0.75, borderColor: .black, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        btnAddStoryPhoto.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 0.75, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        btnAddVideoStory.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 0.75, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        textView.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 1, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)

        btnDiscussion.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 0.5, borderColor: .red, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        self.spreadType = "discussion"

        btnPage.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        spreadMessageBox.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        reportVw.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        self.btnGroup.roundCornerWithShadow(shadowColor: .clear, radius: 3, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        
        textView.text = "What's going on...#Hashtag @Memories"
        textView.textColor = UIColor.lightGray

        textView.delegate = self
        
        viewPublic.isHidden = true
        
        let image = UserSessionManager.shared.getImage() ?? ""
            let url = "https://teachyou.in/content/uploads/" + image
        self.userimgSpreed.sd_setImage(with: URL(string: url), placeholderImage: #imageLiteral(resourceName: "userPlaceholder"))

        viewPage.isHidden = true
        tblPage.register(UINib(nibName: "PageTVCell", bundle: nil), forCellReuseIdentifier: "PageTVCell")

        tblPage.isHidden = true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "What's going on...#Hashtag @Memories"
            textView.textColor = UIColor.lightGray
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func showAuthenticationAlert() {
        
        UIApplication.shared.keyWindow?.addSubview(parentView)

    }

    
    //MARK:- @IBActions
    @IBAction func submitBtnTapped(_ sender: UIButton) {
       viewPublic.isHidden = true
        delegate?.submitBtnAction()
    }
    
    @IBAction func uploadPhotoTapped(_ sender: UIButton) {
        delegate?.uploadPhotoBtnAction()
    }
    
    @IBAction func createAlbumTapped(_ sender: UIButton) {
        delegate?.createAlbumBtnAction()
    }
    
    @IBAction func uploadPdfTapped(_ sender: UIButton) {
        delegate?.uploadPdfBtnAction()
    }
    
    @IBAction func uploadVideoTapped(_ sender: UIButton) {
        delegate?.uploadVideoBtnAction()
    }
    
    @IBAction func selectModeTapped(_ sender: UIButton) {
        delegate?.selectModeBtnAction()
    }
    
    @IBAction func dismissBtnTapped(_ sender: UIButton) {
        viewPublic.isHidden = true
        BoolValue.isFromEditPost = false
        parentView.removeFromSuperview()
    }
    
    @IBAction func publishTapped(_ sender: UIButton) {
        delegate?.publishBtnAction()
    }
    
    @IBAction func addPhotoStoryTapped(_ sender: UIButton) {
        delegate?.addPhotoStoryAction()
    }
    
    @IBAction func addVideoStoryTapped(_ sender: UIButton) {
        delegate?.addVideoStoryAction()
    }
    @IBAction func btnPageDropDownAction(_ sender: UIButton) {
        tblPage.isHidden = false
    }
    @IBAction func discussionBtnTapped(_ sender: UIButton) {
        self.btnDiscussion.roundCornerWithShadow(shadowColor: .clear, radius: 3, borderWidth: 0.5, borderColor: .red, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        self.btnPage.roundCornerWithShadow(shadowColor: .clear, radius: 3, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        self.btnGroup.roundCornerWithShadow(shadowColor: .clear, radius: 3, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)

        self.spreadType = "discussion"
        viewPage.isHidden = true
        tblPage.isHidden = true
        pageId = 0
        groupId = 0

    }
    @IBAction func btnGroupAction(_ sender: UIButton) {
        self.btnGroup.roundCornerWithShadow(shadowColor: .clear, radius: 3, borderWidth: 0.5, borderColor: .red, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        self.btnPage.roundCornerWithShadow(shadowColor: .clear, radius: 3, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        self.btnDiscussion.roundCornerWithShadow(shadowColor: .clear, radius: 3, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)

        self.spreadType = "group"
        lblSelectPage.text = "Select Group"
        lblPage.text = ""
        pageId = 0
        groupId = 0
        viewPage.isHidden = true
        tblPage.isHidden = true
        getMyGroup()
        

    }
    @IBAction func pageBtnTapped(_ sender: UIButton) {
        self.btnPage.roundCornerWithShadow(shadowColor: .clear, radius: 3, borderWidth: 0.5, borderColor: .red, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        self.btnDiscussion.roundCornerWithShadow(shadowColor: .clear, radius: 3, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        self.btnGroup.roundCornerWithShadow(shadowColor: .clear, radius: 3, borderWidth: 0.5, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        pageId = 0
        groupId = 0
        self.spreadType = "page"
        lblSelectPage.text = "Select Page"
        lblPage.text = ""
        viewPage.isHidden = true
        tblPage.isHidden = true
        getMyPages()
        
        
    }
    
    @IBAction func spreadBtnTapped(_ sender: UIButton) {
        delegate?.spreadAction(type: self.spreadType, shareMessage: self.spreadMessageBox.text ?? "", pageId:pageId, groupId:groupId)
    }
    
    @IBAction func reportPostTapped(_ sender: UIButton) {
        delegate?.reportPostAction()
    }
   
    @IBAction func btnPublicAction(_ sender: UIButton) {
        if sender.tag == 10 {
           
            delegate?.shareTypeAction(type: "Public")
        }else if sender.tag == 20 {
            
            delegate?.shareTypeAction(type: "Friends")
        }else{
          
            delegate?.shareTypeAction(type: "Private")
        }
    }
  
    @IBAction func reactionBtnSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sender.setImage(UIImage.init(systemName: "star"), for: .normal)
            sender.tintColor = #colorLiteral(red: 0.8090842366, green: 0.8090842366, blue: 0.8090842366, alpha: 1)
        } else {
            sender.isSelected = true
            sender.setImage(UIImage.init(systemName: "star.fill"), for: .selected)
            sender.tintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }
        
        delegate?.reactToFeedAction(ratings: sender.tag)
    }
    @IBAction func editCommentBtnTapped(_ sender: UIButton) {
        if BoolValue.isFromEditPost{
            sharePostVw.isHidden = false
            textView.text = message
            btnMode.setTitle(privacy, for: .normal)
        }else{
            delegate?.editCommentOnFeedAction(type: 0)
        }
    }
    
    @IBAction func deleteCommentBtnTapped(_ sender: UIButton) {
        if BoolValue.isFromEditPost{
            delegate?.detetePost()
        }else{
            delegate?.editCommentOnFeedAction(type: 1)
        }
    }
    
}
extension CustomPopUpView {
    func getMyGroup(){
        self.loadingIndicator.isAnimating = true

        let parameters: [String: Any] = [
            "action" : "getGroups",
            "user" : UserSessionManager.shared.getUserId() ?? ""
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                self.loadingIndicator.isAnimating = false

                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }

                do{
                    let objRes: GroupsModel = try JSONDecoder().decode(GroupsModel.self, from: dataResponse)

                    if self.arrGroupList.count>0{
                        self.arrGroupList.removeAll()
                    }
                    if self.arrPageList.count>0{
                        self.arrPageList.removeAll()
                    }

                    for each in objRes.groups ?? []{
                        
                        self.arrGroupList.append(each)
                        self.lblPage.text = each.group_title
                        self.groupId = each.group_id!

                    }
                    if self.arrGroupList.count>0{
                        self.tblPage.reloadData()
                        self.viewPage.isHidden = false
                    }else{
                        self.viewPage.isHidden = true
                    }

//
                } catch let error{
                    print(error)
                }
            }
    }
    func getMyPages(){

        let parameters: [String: Any] = [
            "action" : "getPages",
            "user" : UserSessionManager.shared.getUserId() ?? ""
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                self.loadingIndicator.isAnimating = false

                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }

                do{
                  //  let objRes: Pages_Model = try JSONDecoder().decode(Pages_Model.self, from: dataResponse)
                    let objRes: Pages_Model = try JSONDecoder().decode(Pages_Model.self, from: dataResponse)

                    if self.arrPageList.count>0{
                        self.arrPageList.removeAll()
                    }
                    
                    if self.arrGroupList.count>0{
                        self.arrGroupList.removeAll()
                    }
                    for each in objRes.pages ?? []{
                        self.arrPageList.append(each)
                        self.lblPage.text = each.page_title
                        self.pageId = each.page_id!


                    }
                    if self.arrPageList.count>0{
                        self.viewPage.isHidden = false
                        self.tblPage.reloadData()
                    }else{
                        self.viewPage.isHidden = true
                    }

                } catch let error{
                    print(error)
                }
            }
        print("error")
    }
}
extension CustomPopUpView :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrPageList.count>0 {
            return arrPageList.count
        }else{
            return arrGroupList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblPage.dequeueReusableCell(withIdentifier: "PageTVCell", for: indexPath) as! PageTVCell
        if arrPageList.count>0 {
        let strPageName = self.arrPageList[indexPath.row]//page_name
        cell.lblPage.text = strPageName.page_title
        }else{
            let strGroupName = self.arrGroupList[indexPath.row]//page_name
            cell.lblPage.text = strGroupName.group_title

        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if arrPageList.count>0 {
            let strPageName = self.arrPageList[indexPath.row]//page_name
            lblPage.text = strPageName.page_title
            pageId = strPageName.page_id!
            groupId = 0
            tblPage.isHidden = true
        }else if arrGroupList.count>0{
            let strGroupeName = self.arrGroupList[indexPath.row]//page_name
            lblPage.text = strGroupeName.group_title
            groupId = strGroupeName.group_id!
            pageId = 0
            tblPage.isHidden = true
        }else{
            groupId = 0
            pageId = 0
            tblPage.isHidden = true
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

