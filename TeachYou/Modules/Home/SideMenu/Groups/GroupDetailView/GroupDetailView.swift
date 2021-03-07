//
//  GroupDetailView.swift
//  TeachYou
//
//  Created by Sandeep on 08/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

protocol GroupDetailViewProtocol {
    func hideView(isDetails: Bool)
    func showGroupSettings(group: Groups)
}

class GroupDetailView: UIView {

    // MARK:- Outlets
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var imagePicker : ImagePicker?
    var pickedImage : UIImage?
    var images = [UIImage]()
    var docData = [Data]()
    var mimeType = [String]()
    var addStoryTapped = false
    
    var groupDetail : Groups?
    var postsModel = [Posts]()
    
    var isGroupAdmin = false
    
    var delegate: GroupDetailViewProtocol?
    
    // MARK:- Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func setupGroupDetail(data: Groups, isFromMyGroup: Bool) {
        self.getPosts(group: data)
        if isFromMyGroup {
            self.getGroupAdmin(group: data)
        }
        self.groupName.text = data.group_title
        self.groupDetail = data
        setupTableView()
    }
    
    func getPosts(group: Groups) {
        
        let parameters: [String: Any] = [
            "action" : "getPosts",
            "post_type" : "posts_group",
            "user" :"\(group.group_id ?? 0)"
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        self.postsModel.removeAll()
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes: FeedModel = try JSONDecoder().decode(FeedModel.self, from: dataResponse)
                    for each in objRes.posts ?? [] {
                        self.postsModel.append(each)
                    }
                    self.tableView.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }
    
    func getGroupAdmin(group: Groups) {
        let parameters: [String: Any] = [
            "action"    : "getGroupAdmins",
            "group_id"  :  "\(group.group_id ?? 0)"
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
                    let objRes: GroupAdminModel = try JSONDecoder().decode(GroupAdminModel.self, from: dataResponse)
                    for each in objRes.admins ?? [] {
                        if each.userId == Int(UserSessionManager.shared.getUserId() ?? "") {
                            self.isGroupAdmin = true
                        }
                    }
                    
                } catch let error{
                    print(error)
                }
                self.tableView.reloadData()
        }
        
    }
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
        self.tableView.register(UINib(nibName: "BannerCell", bundle: nil), forCellReuseIdentifier: "BannerCell")
        self.tableView.register(UINib(nibName: "LocationCell", bundle: nil), forCellReuseIdentifier: "LocationCell")
        self.tableView.register(UINib(nibName: "SummaryCell", bundle: nil), forCellReuseIdentifier: "SummaryCell")
        self.tableView.register(UINib(nibName: "GroupStatusCell", bundle: nil), forCellReuseIdentifier: "GroupStatusCell")
        self.tableView.register(UINib(nibName: "FeedCell", bundle: nil), forCellReuseIdentifier: "postWithImage")
    }
    
    @IBAction func backBtntapped(_ sender: UIButton) {
        self.delegate?.hideView(isDetails: true)
    }

    func getFormattedDate(dateStr: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = formatter.date(from: dateStr)
        formatter.dateFormat = "yyyy-MM-dd"
        let dateToShow = formatter.string(from: date!)
        return dateToShow
        
     }
}

extension GroupDetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return postsModel.count + 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let groupData = groupDetail else {return UITableViewCell()}
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as! BannerCell
            cell.eventCoverImgVw.imageFromServerURL(urlString: groupData.group_picture ?? "") { (image) in }
            cell.setButton(buttonTitle: "Joined")
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell
            cell.lblVenue.text = "\(groupData.group_members ?? 0) Members"
            cell.mapImgVw.image = UIImage(named: "members")
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell
            cell.lblVenue.text = groupData.group_privacy
            cell.mapImgVw.image = UIImage(named: "globe")
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell
            cell.lblVenue.text = "Admins: \(groupData.group_admin ?? 0)"
            cell.mapImgVw.image = UIImage(named: "Admins")
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell
            cell.lblVenue.text = "Settings"
            cell.mapImgVw.image = UIImage(named: "settings")
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell
            cell.lblVenue.text = "Created By: \(groupData.group_date ?? "")"
            cell.mapImgVw.image = UIImage(named: "user")
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell
//            cell.lblVenue.text = "Created On: \(groupData.group_date ?? "")"
            cell.lblVenue.text = "Created On: \(getFormattedDate(dateStr: groupData.group_date ?? ""))"
            cell.mapImgVw.image = UIImage(named: "calendarG")
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryCell", for: indexPath) as! SummaryCell
            cell.lblSummary.text = groupData.group_description ?? ""
            cell.bgVw.roundCornerWithShadow(shadowColor: .gray, radius: 5, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupStatusCell", for: indexPath) as! GroupStatusCell
            cell.userProfileImg.imageFromServerURL(urlString: groupData.group_picture ?? "") { (image) in }
            cell.statusTV.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 1, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
            return cell
        
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "postWithImage", for: indexPath) as! FeedCell
            cell.setMyPostdata(post: self.postsModel[indexPath.row - 9], originArr: [:])
            cell.delegate = self
            cell.layoutIfNeeded()
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 200
        case 1,2,3,5,6:
            return 40
        case 4:
            if isGroupAdmin {
                return 40
            }else{
                return 0
            }
        case 7,9:
            return UITableView.automaticDimension
        case 8:
            return 80
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 4:
            print("Setting pressed")
            if let data = self.groupDetail {
                self.delegate?.showGroupSettings(group: data)
            }
        default:
            break
        }
    }
    
    
}



extension GroupDetailView: FeedCellDelegate {
    func editCommentAction(id: Int, postId: String, comment: String) {
        
    }
    
    func editPostAction(userId: String, postId: String, message: String, privacy: String) {
        
    }
    
    func starListAction(pid: String) {
        
    }
    
    func reportAction(postId: String) {
        print("Report Tapped")
    }
    
    func shareAction(pid: String) {
       
    }
    
    func reactAction(pid: String, type: String) {
        print("Like Tapped")
    }
    
    func commentAction() {
        print("Comment Tapped")
    }
    
    func sendCommentAction(messageStr: String, id: String) {
        print("Comment Tapped: \(messageStr), \(id)")
    }
    
    func editCommentAction(id: Int, postId: String) {
        
    }
    
    func expandImgAction(urlStr: String) {
//        let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kImagePreviewViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! ImagePreviewViewController
//        vc.imgStr = urlStr
//        vc.transferDatadelegate = self
//        present(vc, animated: true, completion: nil)
        
    }
    
    
}

extension GroupDetailView: ImagePickerDelegate {
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
        
        if addStoryTapped {
            CustomPopUpView.instance.cameraimgVw.image = pickedImage
        } else {
            
        }
        
    }
    
    func imagePicked(image: UIImage) {
    }
}

extension GroupDetailView: TransferImage {
    
    func sendImageToPreviousView(image: UIImage) {
//        Utilities.showProgressIndicator()
    }
    
}
