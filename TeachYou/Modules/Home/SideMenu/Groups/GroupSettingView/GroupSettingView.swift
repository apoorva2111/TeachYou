//
//  GroupSettingView.swift
//  TeachYou
//
//  Created by Sandeep on 12/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class GroupSettingView: UIView {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var adminsButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: GroupDetailViewProtocol?
    
    var selectedTab = "Settings"
    var groupDetail : Groups?
    
    // MARK:- Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func setupView(data: Groups) {
        self.groupDetail = data
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
        
        self.tableView.register(UINib(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier: "SettingCell")
        self.tableView.register(UINib(nibName: "AdminCell", bundle: nil), forCellReuseIdentifier: "AdminCell")
        self.tableView.register(UINib(nibName: "DeleteCell", bundle: nil), forCellReuseIdentifier: "DeleteCell")
    }
    
    @IBAction func backBtntapped(_ sender: UIButton) {
        self.delegate?.hideView(isDetails: false)
    }
    
    @IBAction func settingsBtntapped(_ sender: UIButton) {
        selectedTab = "Settings"
        tableView.reloadData()
    }
    
    @IBAction func adminsBtntapped(_ sender: UIButton) {
        selectedTab = "Admin"
        tableView.reloadData()
    }
    
    @IBAction func deleteBtntapped(_ sender: UIButton) {
        selectedTab = "Delete"
        tableView.reloadData()
    }

    func setupSettingTable(table: UITableView, indexPath: IndexPath) -> UITableViewCell{
        let cell = table.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingCell
        if let data = groupDetail {
            cell.setData(data: data)
        }
        return cell
    }
    
    func setupAdminTable(table: UITableView, indexPath: IndexPath) -> UITableViewCell{
        let cell = table.dequeueReusableCell(withIdentifier: "AdminCell", for: indexPath) as! AdminCell
        cell.setData()
        return cell
    }
    
    func setupDeleteTable(table: UITableView, indexPath: IndexPath) -> UITableViewCell{
        let cell = table.dequeueReusableCell(withIdentifier: "DeleteCell", for: indexPath) as! DeleteCell
        
        return cell
    }
}

extension GroupSettingView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch selectedTab {
        case "Settings":
            return setupSettingTable(table: tableView, indexPath: indexPath)
        case "Admin":
            return setupAdminTable(table: tableView, indexPath: indexPath)
        case "Delete":
            return setupDeleteTable(table: tableView, indexPath: indexPath)
        default:
            return UITableViewCell()
        }
        
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch selectedTab {
        case "Settings":
            return 465
        case "Admin":
            return 80
        case "Delete":
            return 165
        default:
            return UITableView.automaticDimension
        }
    }
    
}
