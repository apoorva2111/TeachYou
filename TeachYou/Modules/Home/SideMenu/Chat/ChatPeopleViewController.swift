//
//  ChatPeopleViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 24/01/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class ChatPeopleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var offset = 0
    var people = [All_data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPeopleToChat()
    }
    
    func getPeopleToChat() {
        let parameters: [String: Any] = [
            "action" : "moreNewPeople",
            "user" : UserSessionManager.shared.getUserId() ?? "",
            "offset" : self.offset
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
                    let objRes: ChatPeopleModel = try JSONDecoder().decode(ChatPeopleModel.self, from: dataResponse)
                    self.people = objRes.all_data ?? []
                    self.tableView.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }

    
}


extension ChatPeopleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatPeopleTableViewCell", for: indexPath) as! ChatPeopleTableViewCell
        cell.setCellData(data: self.people[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = Utilities.viewConrollerObject(identifier: ViewControllerConstants.kChatViewController, storyboard: StoryBoardConstants.kMainStoryBoard) as! ChatViewController
        nextVC.userNameString = (self.people[indexPath.row].user_firstname ?? "") + " " + (self.people[indexPath.row].user_lastname ?? "")
        nextVC.userProfilePicture = self.people[indexPath.row].user_picture ?? ""
        nextVC.chatUserId = "\(self.people[indexPath.row].user_id ?? 0)"
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
