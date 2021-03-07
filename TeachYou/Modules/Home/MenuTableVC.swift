//
//  MenuTableVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 05/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

protocol MenuTableDelegate {
    func menuTableCellTapped(index: Int)
}


class MenuTableVC : UITableViewController {
    
    var arrayMenuOptions = ["Home", "Articles", "Events", "Topics", "Latest Trends", "Mostly Viewed", "Inspirational Stories", "Word of the Day", "Friends", "Pages", "Chats", "Quiz & Games"]
    var arrayMenuImageOptions = ["home", "book", "calendar", "tag", "trendingNews", "mostlyView", "inspirational", "wordoftheday", "friend", "page", "chat", "game"]
    
    let darkColor = UIColor(red: 33/255.0,
                            green: 33/255.0,
                            blue: 33/255.0,
                            alpha: 1)
    var menuTabeDelegate: MenuTableDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = darkColor
        let xib = UINib(nibName: "SideMenuTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "SideMenuTableViewCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuOptions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTableViewCell", for: indexPath) as! SideMenuTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.lblTitle?.text = arrayMenuOptions[indexPath.row]
            cell.imgVw.image = #imageLiteral(resourceName: "home")
        case 1:
            cell.lblTitle?.text = arrayMenuOptions[indexPath.row]
            cell.imgVw.image = #imageLiteral(resourceName: "book")
        case 2:
            cell.lblTitle?.text = arrayMenuOptions[indexPath.row]
            cell.imgVw.image = #imageLiteral(resourceName: "calendar")
        case 3:
            cell.lblTitle?.text = arrayMenuOptions[indexPath.row]
            cell.imgVw.image = #imageLiteral(resourceName: "tag")
        case 4:
            cell.lblTitle?.text = arrayMenuOptions[indexPath.row]
            cell.imgVw.image = #imageLiteral(resourceName: "trendingNews")
        case 5:
            cell.lblTitle?.text = arrayMenuOptions[indexPath.row]
            cell.imgVw.image = #imageLiteral(resourceName: "mostlyView")
        case 6:
            cell.lblTitle?.text = arrayMenuOptions[indexPath.row]
            cell.imgVw.image = #imageLiteral(resourceName: "notification")
        case 7:
            cell.lblTitle?.text = arrayMenuOptions[indexPath.row]
            cell.imgVw.image = #imageLiteral(resourceName: "wordoftheday")
        case 8:
            cell.lblTitle?.text = arrayMenuOptions[indexPath.row]
            cell.imgVw.image = #imageLiteral(resourceName: "friend")
        case 9:
            cell.lblTitle?.text = arrayMenuOptions[indexPath.row]
            cell.imgVw.image = #imageLiteral(resourceName: "page")
        case 10:
            cell.lblTitle?.text = arrayMenuOptions[indexPath.row]
            cell.imgVw.image = #imageLiteral(resourceName: "chat")
        default:
            cell.lblTitle?.text = arrayMenuOptions[indexPath.row]
            cell.imgVw.image = #imageLiteral(resourceName: "game")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        menuTabeDelegate?.menuTableCellTapped(index: indexPath.row)
        dismiss(animated: true) {
            self.menuTabeDelegate?.menuTableCellTapped(index: indexPath.row)
        }
    }
    
    
}
