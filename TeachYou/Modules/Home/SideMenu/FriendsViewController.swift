//
//  FriendsViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 13/01/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD

class FriendsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cellCount = 5
    var isStudy = false
    var isGoing = false
    var isInterested = false
    var myEvents = false
    var createEvent = false
    var friendsModel = [FriendsDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        getFriends()
    }
    
    //{"action":"all_friend1","user":"1"}
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
                    self.tableView.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }
    
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath) as! FriendsTableViewCell
        
        cell.userName.text = (self.friendsModel[indexPath.row].user_firstname ?? "") + " " + (self.friendsModel[indexPath.row].user_lastname ?? "")
        cell.userImgVw.imageFromServerURL(urlString: self.friendsModel[indexPath.row].user_picture ?? "") { (image) in
            //            cell.imgView.image = cell.imgView.image?.crop(to: cell.imgView.frame.size)
        }
        cell.bgView.roundCornerWithShadow(shadowColor: .gray, radius: 5, borderWidth: 0, borderColor: .clear, shadowOpacity: 1, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension FriendsViewController: FriendsCellDelegate {
    
    func addFriendBtnAction(index: Int) {
        print("friend: \(index)")
    }
    
}

