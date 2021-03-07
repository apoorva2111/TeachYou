//
//  EventDetailsViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 22/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire


class EventDetailsViewController: UIViewController {
    
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnBAck: UIButton!
    @IBOutlet weak var navTitle: UILabel!
    @IBOutlet weak var interestBtn: UIButton!
    @IBOutlet weak var goingBtn: UIButton!
    
    var eventId = 0
    var eventModel : Events?
    var memberModel : [MembersModel]?
    var goingMembersCount = 0
    var interestedMembersCount = 0
    var invitedMembersCount = 0
    var eventName = ""
    var isGoing:Bool = false
    var isInterested:Bool = false
    var gesture = UITapGestureRecognizer()
    var dullView: UIView? = {
       let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navTitle.text = eventName
        eventDetailsAPI()
        eventGoingAPI(isForCount: true)
        eventInvitedMembersAPI(isForCount:true)
        eventInterestedMembersAPI(isForCount:true)
    }
    
    func eventDetailsAPI() {
        
        let parameters: [String: Any] = [
            "action" : "getEventById",
            "event_id" : eventId
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
                    let objRes: Events = try JSONDecoder().decode(Events.self, from: dataResponse)
                    self.eventModel = objRes
                    self.tableView.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }
    
    
    
    
    
    func eventGoingInterestedAPI(eventAction:String, isGoing:Bool?, isInterested:Bool?){
        let parameters: [String: Any] = [
            "action" : "eventActions",
            "event_id" : eventId,
            "user" : UserSessionManager.shared.getUserId() ?? "",
            "event_action":eventAction
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
                    let objRes: EventGointInterestedModel = try JSONDecoder().decode(EventGointInterestedModel.self, from: dataResponse)
                    if objRes.status ?? false{
                        self.eventDetailsAPI()
                        if let going = isGoing{
                            if going{
                                self.isGoing = true
                            }else{
                                self.isGoing = false
                            }
                        }else{
                            if isInterested!{
                                self.isInterested = true
                            }else{
                                self.isInterested = false
                            }
                        }
                    }
                    self.tableView.reloadData()
                } catch let error{
                    print(error)
                    self.tableView.reloadData()
                }
        }
    }
    
    func eventInvitedMembersAPI(isForCount:Bool) {
        
        let parameters: [String: Any] = [
            "action" : "getInvitedMembers",
            "event_id" : eventId
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
                    let objRes: MemberCountModel = try JSONDecoder().decode(MemberCountModel.self, from: dataResponse)
                    if isForCount{
                        self.invitedMembersCount = objRes.members?.count ?? 0
                    }else{
                        if objRes.members?.count ?? 0 > 0{
                            self.showMembers(members: objRes.members ?? [MembersModel](), type: .kInvited)
                        }
                    }
                   
                    self.tableView.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }
    
    func eventGoingAPI(isForCount:Bool) {
        
        let parameters: [String: Any] = [
            "action" : "getGoingMembers",
            "event_id" : eventId
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
                    let objRes: MemberCountModel = try JSONDecoder().decode(MemberCountModel.self, from: dataResponse)
                    if !isForCount{
                        if objRes.members?.count ?? 0 > 0{
                            self.showMembers(members: objRes.members ?? [MembersModel](), type: .kGoing)
                        }
                    }else{
                        self.goingMembersCount = objRes.members?.count ?? 0
                    }
                    self.tableView.reloadData()
                } catch let error{
                    print(error)
                }
            }
    }
    
    func eventInterestedMembersAPI(isForCount:Bool) {
        
        let parameters: [String: Any] = [
            "action" : "getInterestedMembers",
            "event_id" : eventId
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
                    let objRes: MemberCountModel = try JSONDecoder().decode(MemberCountModel.self, from: dataResponse)
                    if isForCount{
                        self.interestedMembersCount = objRes.members?.count ?? 0
                    }else{
                        if objRes.members?.count ?? 0 > 0{
                            self.showMembers(members: objRes.members ?? [MembersModel](), type: .kInterested)
                        }
                    }
                    self.tableView.reloadData()
                } catch let error{
                    print(error)
                }
        }
        
    }
    
    func showMembers(members:[MembersModel], type:MemberType){
        if let _ = dullView{
            gesture.addTarget(self, action: #selector(dullBackViewTapped(_:)))
            dullView?.addGestureRecognizer(gesture)
            self.view.addSubview(dullView!)
            dullView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            dullView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            dullView?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            dullView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            dullView?.layoutIfNeeded()
            let eventMemberListView = EventMembersListViewController()
            eventMemberListView.memberType = type
            eventMemberListView.members = members
            let memberView = eventMemberListView.view
            dullView?.addSubview(memberView!)
            memberView?.translatesAutoresizingMaskIntoConstraints = false
            memberView?.centerXAnchor.constraint(equalTo: dullView!.centerXAnchor).isActive = true
            memberView?.centerYAnchor.constraint(equalTo: dullView!.centerYAnchor).isActive = true
            memberView?.widthAnchor.constraint(equalToConstant: self.view.frame.width*0.7).isActive = true
            let viewHeight = members.count > 8 ? (8 * 65) : members.count * 65
            memberView?.heightAnchor.constraint(equalToConstant: 60.0 + CGFloat(viewHeight)).isActive = true
            memberView?.layoutIfNeeded()
        }
    }
    
    @objc
    func dullBackViewTapped(_ gestureRecognizer: UITapGestureRecognizer){
        self.dullView?.removeFromSuperview()
        
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension EventDetailsViewController: UITableViewDelegate, UITableViewDataSource, EventDetailsTopTableViewCellDelegate, EventDetailsCountTableViewCellDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "topCell", for: indexPath) as! EventDetailsTopTableViewCell
          
            let url = AppConstants.BASE_UPDATE_URL + (self.eventModel?.event_cover ?? "")
            cell.delegate = self
            cell.eventCoverImgVw.imageFromServerURL(urlString: url) { (image) in }
            cell.lblEventTitle.text = self.eventModel?.event_title ?? ""
            if isInterested{
                cell.btnInterested.setImage(UIImage(systemName: "checkmark"), for: .normal)
                cell.btnInterested.setTitle("Interested", for: .normal)
            }else{
                cell.btnInterested.setImage(UIImage(systemName: "person.fill"), for: .normal)
                cell.btnInterested.setTitle("Interest", for: .normal)
            }
            if isGoing{
                cell.btnGoing.setImage(UIImage(systemName: "checkmark"), for: .normal)
                cell.btnGoing.setTitle("Going", for: .normal)
            }else{
                cell.btnGoing.setImage(UIImage(systemName: "star"), for: .normal)
                cell.btnGoing.setTitle("Going", for: .normal)
            }
            return cell
        
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! EventDetailsLocationTableViewCell
            cell.lblVenue.text = self.eventModel?.event_location ?? ""
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as! EventDetailsTimeTableViewCell
            cell.lblTime.text = "From: " + (self.eventModel?.event_start_date ?? "")
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as! EventDetailsTimeTableViewCell
            cell.lblTime.text = "To: " + (self.eventModel?.event_end_date ?? "")
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "createdCell", for: indexPath) as! EventDetailsCreatedTableViewCell
//            cell.lblCreatedValue.text = UserSessionManager.shared.getName() ?? ""
            cell.bgVw.roundCornerWithShadow(shadowColor: .gray, radius: 5, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "countCell", for: indexPath) as! EventDetailsCountTableViewCell
            cell.delegate = self
            cell.lblGoingValue.text = "\(self.goingMembersCount)"
            cell.lblInterestedValue.text = "\(self.interestedMembersCount)"
            cell.lblInvitedValue.text = "\(self.invitedMembersCount)"
            cell.bgVw.roundCornerWithShadow(shadowColor: .gray, radius: 5, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "summaryCell", for: indexPath) as! EventDetailsSummaryTableViewCell
            cell.lblSummary.text = self.eventModel?.event_description ?? ""
            cell.bgVw.roundCornerWithShadow(shadowColor: .gray, radius: 5, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "eventStatusCell", for: indexPath) as! EventDetailsStatusTableViewCell
            let url = AppConstants.BASE_UPDATE_URL + (self.eventModel?.event_cover ?? "")
            cell.userProfileImg.imageFromServerURL(urlString: url) { (image) in }
            cell.statusTV.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 1, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: "eventPostWithImage", for: indexPath) as! EventDetailsPostTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 220
        case 1:
            return 60
        case 2:
            return 60
        case 3:
            return 60
        case 4:
            return 115
        case 5:
            return 115
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kImagePreviewViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! ImagePreviewViewController
            vc.imgStr = AppConstants.BASE_UPDATE_URL + (self.eventModel?.event_cover ?? "")
            present(vc, animated: true, completion: nil)
        }
    }
    
    func eventGoingTapped(sender: UIButton) {
        if isGoing{
            self.eventGoingInterestedAPI(eventAction: "event-go", isGoing: false, isInterested: nil)
        }else{
            self.eventGoingInterestedAPI(eventAction: "event-ungo", isGoing: true, isInterested: nil)
        }
    }
    
    func eventInterestedTapped(sender: UIButton) {
        if isInterested{
            self.eventGoingInterestedAPI(eventAction: "event-interest", isGoing: nil, isInterested: false)
        }else{
            self.eventGoingInterestedAPI(eventAction: "event-uninterest", isGoing: nil, isInterested: true)
        }
    }
    
    func goingMembersTapped(_ sender: UIButton) {
        self.eventGoingAPI(isForCount: false)
    }
    
    func invitedTapped(_ sender: UIButton) {
        self.eventInvitedMembersAPI(isForCount: false)
    }
    
    func interestedMembersTapped(_ sender: UIButton) {
        self.eventInterestedMembersAPI(isForCount: false)
    }
    
    
}

