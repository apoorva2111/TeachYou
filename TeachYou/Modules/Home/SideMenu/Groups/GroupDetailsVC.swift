//
//  GroupDetailsVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 29/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class GroupDetailsVC: UIViewController {

    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var postsModel = [Posts]()
    var groupId = 0
    var groupName = ""
    var groupDetailsModel : Groups?
    var groupCategory = ""
    var groupDescription = ""
    var privacy = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = groupName
    }
    
    @IBAction func backBtntapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
//        print("Group Hide")
//        self.delegate?.hideSubView()
    }
    
}


extension GroupDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsModel.count + 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupTopCell", for: indexPath) as! EventDetailsTopTableViewCell
            cell.eventCoverImgVw.imageFromServerURL(urlString: self.groupDetailsModel?.group_picture ?? "") { (image) in }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupLocationCell", for: indexPath) as! EventDetailsLocationTableViewCell
            cell.lblVenue.text = "\(self.groupDetailsModel?.group_members ?? 0) Members"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupLocationCell", for: indexPath) as! EventDetailsLocationTableViewCell
            cell.lblVenue.text = self.groupDetailsModel?.group_privacy ?? ""
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupLocationCell", for: indexPath) as! EventDetailsLocationTableViewCell
            cell.lblVenue.text = "Admins: \(self.groupDetailsModel?.group_admin ?? 0)"
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupLocationCell", for: indexPath) as! EventDetailsLocationTableViewCell
            cell.lblVenue.text = "Created By: \(self.groupDetailsModel?.group_date ?? "")"
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupLocationCell", for: indexPath) as! EventDetailsLocationTableViewCell
            cell.lblVenue.text = "Created On: \(self.groupDetailsModel?.group_date ?? "")"
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupSummaryCell", for: indexPath) as! EventDetailsSummaryTableViewCell
            cell.lblSummary.text = self.groupDetailsModel?.group_description ?? ""
            cell.bgVw.roundCornerWithShadow(shadowColor: .gray, radius: 5, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupStatusCell", for: indexPath) as! EventDetailsStatusTableViewCell
            let url = AppConstants.BASE_UPDATE_URL + (self.groupDetailsModel?.group_picture ?? "")
            if url == "" {
                cell.userProfileImg.image = #imageLiteral(resourceName: "userPlaceholder")
            } else {
                cell.userProfileImg.imageFromServerURL(urlString: url) { (image) in  }
            }
            cell.statusTV.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 1, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupPostWithImage", for: indexPath) as! EventDetailsPostTableViewCell
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 200
        case 1:
            return 40
        case 2:
            return 40
        case 3:
            return 40
        case 4:
            return 40
        case 5:
            return 40
        case 6:
            return UITableView.automaticDimension
        case 7:
            return 80
        case 8:
            return UITableView.automaticDimension
        default:
            return 0
        }
    }
    
    
}
