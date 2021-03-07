//
//  ChatViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 24/01/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class ChatViewController: UIViewController {

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTF: UITextField!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    var conversationId = ""
    var userNameString = ""
    var userProfilePicture = ""
    var offset = 0
    var messageArr = [ConversationMessage]()
    var chatUserId = ""
    let loadingIndicator: ProgressView = {
        let progress = ProgressView(colors: [#colorLiteral(red: 0.6446513191, green: 0.02597923801, blue: 0.1453336775, alpha: 1)], lineWidth: 3)
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userName.text = self.userNameString
        self.userProfileImage.imageFromServerURL(urlString: userProfilePicture) { (image) in }
        getConversation()
        setUpLoadingVw()
    }
    
    func setUpLoadingVw() {
        overrideUserInterfaceStyle = .light
        self.view.addSubview(loadingIndicator)
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            loadingIndicator.widthAnchor.constraint(equalToConstant: 35),
            loadingIndicator.heightAnchor.constraint(equalTo: self.loadingIndicator.widthAnchor)
        ])
    }
    
    func getConversation() {
        
        let parameters: [String: Any] = [
            "action" : "getConversationMessage",
            "user" : UserSessionManager.shared.getUserId() ?? "",
            "offset" : self.offset,
            "conversation_id" : self.conversationId
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
                    let objRes: MessageModel = try JSONDecoder().decode(MessageModel.self, from: dataResponse)
                    self.messageArr = objRes.conversationMessage ?? []
                    self.tableView.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }
    
    func sendMessage() {
        
        self.tableView.isHidden = true
        self.loadingIndicator.isAnimating = true
        
        let parameters: [String: Any] = [
            "action" : "chatProcess",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "chat_user_id" : self.chatUserId,
            "conversation_id" : self.conversationId,
            "message" : self.messageTF.text ?? ""
        ]
        let urlString = "https://teachyou.in/androidApi.php"
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response.debugDescription)
                self.messageArr = []
                self.messageTF.text = ""
                self.messageTF.resignFirstResponder()
                self.getConversation()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.tableView.isHidden = false
                    self.loadingIndicator.isAnimating = false
                }
                
        }
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendBtnTapped(_ sender: UIButton) {
        sendMessage()
    }
    
}


extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.messageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if "\(self.messageArr[indexPath.row].user_id ?? 0)" == UserSessionManager.shared.getUserId() ?? "" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Sender", for: indexPath) as! SenderCell
            cell.labelMessage.text = self.messageArr[indexPath.row].message ?? ""
            let iDate = Utilities.stringToDate(date: self.messageArr[indexPath.row].time ?? "", format: DateFormatterConstant.kyyyy_MM_dd_HH_mm_ss)
            let timesAgo : String = iDate.getElapsedInterval()
            cell.labelTime.text = timesAgo
            DispatchQueue.main.async {
                cell.bgView.roundThreeCorners(corners: [.bottomLeft,.topLeft,.bottomRight], radius: 10, clipsbounds: true)
                cell.layoutIfNeeded()
                cell.layoutSubviews()
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Reciever", for: indexPath) as! ChatCell
            cell.labelMessage.text = self.messageArr[indexPath.row].message ?? ""
            let iDate = Utilities.stringToDate(date: self.messageArr[indexPath.row].time ?? "", format: DateFormatterConstant.kyyyy_MM_dd_HH_mm_ss)
            let timesAgo : String = iDate.getElapsedInterval()
            cell.labelTime.text = timesAgo
            
            DispatchQueue.main.async {
                cell.bgView.roundThreeCorners(corners: [.bottomRight,.bottomLeft,.topRight], radius: 10, clipsbounds: true)
                cell.layoutIfNeeded()
                cell.layoutSubviews()
            }
            return cell
        }
    }
    
}
