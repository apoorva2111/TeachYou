//
//  PeopleViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 13/01/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD

class PeopleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var cellCount = 5
    var isStudy = false
    var isGoing = false
    var isInterested = false
    var myEvents = false
    var createEvent = false
    var peopleModel = [PeopleDataModel]()
    var offset = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPeople(offset: offset, isReqSent: false)
    }
  
    //{"action":"moreNewPeople","user":"1","offset":"0"}
    func getPeople(offset: Int, isReqSent: Bool) {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "moreNewPeople",
            "user" : UserSessionManager.shared.getUserId() ?? "",
            "offset" : "\(offset)"
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
                do
                {
                    if isReqSent {
                        self.peopleModel.removeAll()
                    }
                    let objRes: PeopleModel = try JSONDecoder().decode(PeopleModel.self, from: dataResponse)
                    for each in objRes.all_data ?? [] {
                        self.peopleModel.append(each)
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch let error{
                    print("Error is:",error)
                }
        }
    }
    
    func sendFriendRequest(friendId: Int){
        KRProgressHUD.show()
        let paramaters: [String:Any] = ["action":"eventActions","user":UserSessionManager.shared.getUserId() ?? "","event_id":"\(friendId)","event_action":"friend-add"]
        
        let url = AppConstants.BASE_URL
        
        AF.request(url, method: .post, parameters: paramaters).responseJSON { (response) in
            KRProgressHUD.dismiss()
            if let response = response.value as? NSDictionary {
                print("Response is: \(response)")
                if let status = response.value(forKey: "status") as? Bool, status {
                    print("Req success")
                    self.offset = 0
                    self.getPeople(offset: self.offset, isReqSent: true)
                }else{
                    print("Req failed")
                    Utilities.showInformationAlert(title: AppConstants.kAppName, message: "Request Failed!!")
                }
            }
            
        }
    }
    
    
}


extension PeopleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.peopleModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath) as! FriendsTableViewCell
        
        cell.userName.text = (self.peopleModel[indexPath.row].user_firstname ?? "") + " " + (self.peopleModel[indexPath.row].user_lastname ?? "")
        cell.userImgVw.imageFromServerURL(urlString: self.peopleModel[indexPath.row].user_picture ?? "") { (image) in
        //            cell.imgView.image = cell.imgView.image?.crop(to: cell.imgView.frame.size)
                }
        cell.bgView.roundCornerWithShadow(shadowColor: .gray, radius: 5, borderWidth: 0, borderColor: .clear, shadowOpacity: 1, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1)
        cell.tag = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.peopleModel.count - 1 == indexPath.row + 3 {
            offset += 1
            getPeople(offset: offset, isReqSent: false)
        }
    }
}

extension PeopleViewController: FriendsCellDelegate {
    func addFriendBtnAction(index: Int) {
        print("Add this friend: \(index)", self.peopleModel[index].user_id)
        if let userId = self.peopleModel[index].user_id {
            sendFriendRequest(friendId: userId)
        }
    }
    
}

