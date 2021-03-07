//
//  ChatFriendsViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 24/01/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class ChatFriendsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var offset = 0
    var friends = [Conversations]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRecentChats()
    }
    
    func getRecentChats() {
        let parameters: [String: Any] = [
            "action" : "getConversations",
            "user" : UserSessionManager.shared.getUserId() ?? "",
            "offset" : self.offset
        ]
        let urlString = "https://teachyou.in/androidApi.php"
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes: ConversationModel = try JSONDecoder().decode(ConversationModel.self, from: dataResponse)
                    self.friends = objRes.conversations ?? []
                    self.tableView.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }


}


extension ChatFriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatFriendTableViewCell", for: indexPath) as! ChatFriendTableViewCell
        cell.setCellData(data: self.friends[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = Utilities.viewConrollerObject(identifier: ViewControllerConstants.kChatViewController, storyboard: StoryBoardConstants.kMainStoryBoard) as! ChatViewController
        nextVC.conversationId = "\(self.friends[indexPath.row].conversation_id ?? 0)"
        nextVC.userNameString = self.friends[indexPath.row].name ?? ""
        nextVC.userProfilePicture = self.friends[indexPath.row].picture ?? ""
        nextVC.chatUserId = "\(self.friends[indexPath.row].user_id ?? 0)"
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
