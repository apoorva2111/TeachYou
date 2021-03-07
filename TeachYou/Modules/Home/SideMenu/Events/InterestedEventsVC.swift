//
//  InterestedEventsVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 15/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class InterestedEventsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cellCount = 5
    var isStudy = false
    var isGoing = false
    var isInterested = false
    var myEvents = false
    var createEvent = false
    var filter = "interested"
    var eventsModel = [Events]()
    let loadingIndicator: ProgressView = {
        let progress = ProgressView(colors: [#colorLiteral(red: 0.6446513191, green: 0.02597923801, blue: 0.1453336775, alpha: 1)], lineWidth: 3)
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getInterestedEvents()
        setUpLoadingVw()
    }
    
    func setUpLoadingVw() {
        overrideUserInterfaceStyle = .light
        self.view.addSubview(loadingIndicator)
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            loadingIndicator.widthAnchor.constraint(equalToConstant: 35),
            loadingIndicator.heightAnchor.constraint(equalTo: self.loadingIndicator.widthAnchor)
        ])
    }
    
    func getInterestedEvents() {
        
        self.tableView.isHidden = true
        self.loadingIndicator.isAnimating = true
        
        let parameters: [String: Any] = [
            "action"    : "getEvents",
            "user"      : UserSessionManager.shared.getUserId() ?? "",
            "filter"    : filter
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.tableView.isHidden = false
                    self.loadingIndicator.isAnimating = false
                }
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes: EventsModel = try JSONDecoder().decode(EventsModel.self, from: dataResponse)
                    for each in objRes.events ?? [] {
                        self.eventsModel.append(each)
                    }
                    
                    self.tableView.setContentOffset(.zero, animated: true)
                    self.tableView.reloadData()
                    
                } catch let error{
                    print(error)
                }
        }
    }
    
    func eventInterestAction(eid: String, type: String) {
        let parameters: [String: Any] = [
            "action"    : "interestUninterestEvents",
            "method"    : type,
            "user"      : UserSessionManager.shared.getUserId() ?? "",
            "event_id"  : eid
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                
                print(response.debugDescription)
        }
        eventsModel = []
        getInterestedEvents()
    }
    
}

extension InterestedEventsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
        cell.setCellData(data: self.eventsModel[indexPath.row])
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

extension InterestedEventsVC: EventCellDelegate {
    
    func interestedBtnAction(id: String, actionType: String) {
        print("Interested btn Tapped")
        eventInterestAction(eid: id, type: actionType)
    }
    
}
