//
//  MyEventsVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 15/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class MyEventsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cellCount = 5
    var isStudy = false
    var isGoing = false
    var isInterested = false
    var myEvents = false
    var createEvent = false
    var filter = "all"
    var eventsModel = [Events]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMyEvents()
        
    }
    
    func getMyEvents() {
        let parameters: [String: Any] = [
            "action" : "getEvents",
            "user" : UserSessionManager.shared.getUserId() ?? "",
            "filter": "all"
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
                    let objRes: EventsModel = try JSONDecoder().decode(EventsModel.self, from: dataResponse)
                    for each in objRes.events ?? [] {
                        self.eventsModel.append(each)
                    }
                    self.tableView.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }
    
    func eventInterestAction(eid: String, type: String) {
        let parameters: [String: Any] = [
            "action" : "interestUninterestEvents",
            "method" : type,
            "user"   : UserSessionManager.shared.getUserId() ?? "",
            "event_id" : eid
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                
                print(response.debugDescription)
                self.tableView.reloadData()
        }
    }
    
}

extension MyEventsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
        cell.setCellData(data: self.eventsModel[indexPath.row])
        cell.btnInterest.isHidden = true
        cell.bgView.roundCornerWithShadow(shadowColor: .gray, radius: 10, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Utilities.viewConrollerObject(identifier: "EventDetailsViewController", storyboard: StoryBoardConstants.kMainStoryBoard) as! EventDetailsViewController
        vc.eventId = self.eventsModel[indexPath.row].event_id ?? 0
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension MyEventsVC: EventCellDelegate {
    
    func interestedBtnAction(id: String, actionType: String) {
        print("Interested btn Tapped")
        eventInterestAction(eid: id, type: actionType)
    }
    
}
