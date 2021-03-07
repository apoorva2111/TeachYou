//
//  SentRequestsViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 13/01/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD

class SentRequestsViewController: UIViewController {

   @IBOutlet weak var tableView: UITableView!
    
    var cellCount = 5
    var isStudy = false
    var isGoing = false
    var isInterested = false
    var myEvents = false
    var createEvent = false
    var sentRequestModel = [SentRequestDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getFriends()
    }
    
    //{"action":"all_friend1","user":"1"}
    func getFriends() {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "friend_requests_sent",
            "user" : UserSessionManager.shared.getUserId() ?? "",
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
                    self.sentRequestModel.removeAll()
                    let objRes: SentRequestModel = try JSONDecoder().decode(SentRequestModel.self, from: dataResponse)
                    for each in objRes.all_data ?? [] {
                        self.sentRequestModel.append(each)
                    }
                    self.tableView.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }

}

extension SentRequestsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sentRequestModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath) as! FriendsTableViewCell
        
        cell.userName.text = (self.sentRequestModel[indexPath.row].user_firstname ?? "") + " " + (self.sentRequestModel[indexPath.row].user_lastname ?? "")
        cell.userImgVw.imageFromServerURL(urlString: self.sentRequestModel[indexPath.row].user_picture ?? "") { (image) in
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

extension SentRequestsViewController: FriendsCellDelegate {
    
    func addFriendBtnAction(index: Int) {
        print("cancel this sent request: \(index)")
    }
    
}

