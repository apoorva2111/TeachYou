//
//  NotificationsViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 01/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class NotificationsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var notificationArr = [NotificationsData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNotifications()
    }
    
    func getNotifications() {
        let parameters: [String: Any] = [
            "action" : "getNotifications",
            "user" : UserSessionManager.shared.getUserId() ?? ""
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
                    let objRes: NotificationModel = try JSONDecoder().decode(NotificationModel.self, from: dataResponse)
                    for each in objRes.notifications ?? [] {
                        self.notificationArr.append(each)
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let error {
                    print(error)
                }
        }
    }
    
}

extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        cell.setCellData(data: self.notificationArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
