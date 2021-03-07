//
//  ChatsVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 10/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import ViewPager_Swift
import Alamofire

class ChatsVC: UIViewController {

    @IBOutlet weak var navBar       : UIView!
    @IBOutlet weak var btnBack      : UIButton!
    @IBOutlet weak var lblTitle     : UILabel!
    @IBOutlet weak var pager        : UIView!
    
    var tabs = [
        ViewPagerTab(title: "Friends", image: nil),
        ViewPagerTab(title: "You may know", image: nil),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
        configPager()
    }
    
    func initialSetup() {
        self.lblTitle.text = "TALK WITH"
    }

    func configPager(){
        let pagerview = ViewPagerOptions(viewPagerWithFrame:CGRect(x: 0, y: 0, width: self.view.frame.width, height: pager.frame.height))
        pagerview.tabType = ViewPagerTabType.basic
        pagerview.isEachTabEvenlyDistributed = true
        pagerview.isTabHighlightAvailable = true
        pagerview.isTabIndicatorAvailable = true
        pagerview.tabViewBackgroundDefaultColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        pagerview.tabViewBackgroundDefaultColor = UIColor.white
        pagerview.tabViewTextDefaultColor = UIColor.black
        
        let viewPager = ViewPagerController()
        viewPager.options = pagerview
        viewPager.dataSource = self
        
        self.addChild(viewPager)
        self.pager.addSubview(viewPager.view)
        viewPager.didMove(toParent: self)
        viewPager.delegate = self
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}


extension ChatsVC: ViewPagerControllerDataSource,ViewPagerControllerDelegate{
    func numberOfPages() -> Int {
        return tabs.count
    }
    
    func viewControllerAtPosition(position: Int) -> UIViewController {
        
        switch position {
        case 0:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kChatFriendsViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! ChatFriendsViewController
            return vc

        default:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kChatPeopleViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! ChatPeopleViewController
            return vc
        }
        
    }
    
    func tabsForPages() -> [ViewPagerTab] {
        return tabs
        
    }
    
    
}

