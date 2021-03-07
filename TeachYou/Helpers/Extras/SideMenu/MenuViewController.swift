//
//  MenuViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Ashish on 21/09/15.
//  Copyright (c) 2015 Kode. All rights reserved.
//

import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32, _ section : Int32)
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /**
    *  Array to display menu options
    */
    @IBOutlet var tblMenuOptions : UITableView!
    
    /**
    *  Transparent button to hide menu
    */
    @IBOutlet var btnCloseMenuOverlay : UIButton!
    
    /**
    *  Array containing menu options
    */
    let arrayMenuOptions = ["Home", "Articles", "Events", "Topics",
                         "Latest Trends", "Mostly Viewed", "Inspirational Stories",
                         "Word of the Day",
                         "Friends",
                         "Pages", "Chat", "Quiz & Games"]
    
    var sectionHeaders = ["","", "", "","","",""]
    /**
    *  Menu button which was tapped to display the menu
    */
    var btnMenu : UIButton!
    /**
    *  Delegate of the MenuVC
    */
    var delegate : SlideMenuDelegate?
    var selectedSection: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblMenuOptions.tableFooterView = UIView()
        self.tblMenuOptions.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 150, right: 0)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func onCloseMenuClick(_ button:UIButton!){
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index, Int32(self.selectedSection))
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                self.view.removeFromSuperview()
                self.removeFromParent()
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellMenu")!
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        
        let lblTitle : UILabel = cell.contentView.viewWithTag(101) as! UILabel
        let imgIcon : UIImageView = cell.contentView.viewWithTag(100) as! UIImageView
        
        
        imgIcon.contentMode = .center
        
        switch(indexPath.row) {
            case 0:
                lblTitle.text = arrayMenuOptions[0]
                imgIcon.image = #imageLiteral(resourceName: "home")
            case 1:
                lblTitle.text = arrayMenuOptions[1]
                imgIcon.image = #imageLiteral(resourceName: "book")
            case 2:
                lblTitle.text = arrayMenuOptions[2]
                imgIcon.image = #imageLiteral(resourceName: "calendar")
            case 3:
                lblTitle.text = arrayMenuOptions[3]
                imgIcon.image = #imageLiteral(resourceName: "tag")
            case 4:
                lblTitle.text = arrayMenuOptions[4]
                imgIcon.image = #imageLiteral(resourceName: "trendingNews")
            case 5:
                lblTitle.text = arrayMenuOptions[5]
                imgIcon.image = #imageLiteral(resourceName: "mostlyView")
            case 6:
                lblTitle.text = arrayMenuOptions[6]
                imgIcon.image = #imageLiteral(resourceName: "inspirational")
            case 7:
                lblTitle.text = arrayMenuOptions[7]
                imgIcon.image = #imageLiteral(resourceName: "wordoftheday")
            case 8:
                lblTitle.text = arrayMenuOptions[8]
                imgIcon.image = #imageLiteral(resourceName: "friend")
            case 9:
                lblTitle.text = arrayMenuOptions[9]
                imgIcon.image = #imageLiteral(resourceName: "page")
            case 10:
                lblTitle.text = arrayMenuOptions[10]
                imgIcon.image = #imageLiteral(resourceName: "chat")
            case 11:
                lblTitle.text = arrayMenuOptions[11]
                imgIcon.image = #imageLiteral(resourceName: "game")
            default :
                lblTitle.text = arrayMenuOptions[12]
                imgIcon.image = #imageLiteral(resourceName: "home")
        }
        
        lblTitle.textColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.tag = indexPath.row
        selectedSection = indexPath.section
        self.onCloseMenuClick(btn)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuOptions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let v = UIView(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 1))
        v.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8470588235)
        return v
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
