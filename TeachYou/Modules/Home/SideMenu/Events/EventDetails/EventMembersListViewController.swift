//
//  EventMembersListViewController.swift
//  TeachYou
//
//  Created by Aarvy Technologies on 05/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class EventMembersListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var members = [MembersModel](){
        didSet{
            print(members.count)
//            self.tableView.register(UINib(nibName: "EventMemberTableViewCell", bundle: .main), forCellReuseIdentifier: "EventMemberTableViewCell")
//            self.tableView.delegate = self
//            self.tableView.dataSource = self
//            self.tableView.reloadData()
        }
    }
    var memberType:MemberType = .kGoing{
        didSet{
            print(memberType.rawValue)
//            headingLabel.text = memberType.rawValue
        }
    }
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headingLabel.text = memberType.rawValue
        self.tableView.register(UINib(nibName: "EventMemberTableViewCell", bundle: .main), forCellReuseIdentifier: "EventMemberTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventMemberTableViewCell") as? EventMemberTableViewCell else{return UITableViewCell()}
        cell.memberName.text = members[indexPath.row].user_name
        cell.memberImage.sd_setImage(with: URL(string: members[indexPath.row].user_picture ?? ""), completed: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
}

