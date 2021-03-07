//
//  MostlyViewedVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 10/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import ViewPager_Swift
import CarbonKit
import Alamofire

protocol GroupDetailProtocol {
    func showGroupDetails(group: Groups, isFromMyGroup: Bool)
}


class MostlyViewedVC: UIViewController {
    
    @IBOutlet weak var navBar       : UIView!
    @IBOutlet weak var btnBack      : UIButton!
    @IBOutlet weak var lblTitle     : UILabel!
    @IBOutlet weak var pager        : UIView!
    
    var tabs = [
        ViewPagerTab(title: "Groups", image: nil),
        ViewPagerTab(title: "Joined Groups", image: nil),
        ViewPagerTab(title: "My Groups", image: nil),
        ViewPagerTab(title: "Create Group", image: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupView()
    }
    
    func initialSetup() {
        self.lblTitle.text = "GROUPS"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupView(){
        let titleArrays: [String] = tabs.map { $0.title }
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: titleArrays, delegate: self)
        carbonTabSwipeNavigation.setNormalColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        carbonTabSwipeNavigation.setIndicatorColor(#colorLiteral(red: 0.5843137255, green: 0, blue: 0.1450980392, alpha: 1))
        carbonTabSwipeNavigation.carbonSegmentedControl?.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        carbonTabSwipeNavigation.carbonTabSwipeScrollView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        carbonTabSwipeNavigation.setSelectedColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
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

extension MostlyViewedVC: CarbonTabSwipeNavigationDelegate {
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        let subSection = tabs[Int(index)]
        switch subSection.title {
        case "Groups":
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kGroupsVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! GroupsVC
            vc.delegate = self
            return vc
        case "Joined Groups":
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kJoinedGroupVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! JoinedGroupVC
            vc.delegate = self
            return vc
        case "My Groups":
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kMyGroupVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! MyGroupVC
            vc.delegate = self
            return vc
        case "Create Group":
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kCreateGroupVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! CreateGroupVC
            return vc
        default:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kCreateGroupVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! CreateGroupVC
            return vc
        }
    }
    
    
}

extension MostlyViewedVC: GroupDetailProtocol {
    func showGroupDetails(group: Groups, isFromMyGroup: Bool) {
        let detailView = UINib(nibName: "GroupDetailView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! GroupDetailView
        detailView.frame = self.view.bounds
        detailView.setupGroupDetail(data: group, isFromMyGroup: isFromMyGroup)
        detailView.tag = 1
        
        detailView.delegate = self
        self.view.addSubview(detailView)
    }
    
}

extension MostlyViewedVC: GroupDetailViewProtocol {
    
    func showGroupSettings(group: Groups) {
//        removeSubview(tag: 1)
        
        let detailView = UINib(nibName: "GroupSettingView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! GroupSettingView
        detailView.frame = self.view.bounds
        detailView.setupView(data: group)
        detailView.tag = 2
        detailView.delegate = self
        self.view.addSubview(detailView)
        
    }
    
    func hideView(isDetails: Bool) {
        print("Hide view", isDetails)
        if isDetails {
            removeSubview(tag: 1)
        } else {
            removeSubview(tag: 2)
        }
    }
    
    func removeSubview(tag: Int){
        guard let viewWithTag = self.view.viewWithTag(tag) else {return}
        viewWithTag.removeFromSuperview()
    }
}


extension MostlyViewedVC: ViewPagerControllerDataSource,ViewPagerControllerDelegate{
    func numberOfPages() -> Int {
        return tabs.count
    }
    
    func viewControllerAtPosition(position: Int) -> UIViewController {
        
        switch position {
        case 0:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kJoinedGroupVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! JoinedGroupVC
            return vc
        case 1:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kMyGroupVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! MyGroupVC
            return vc
        default:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kCreateGroupVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! CreateGroupVC
            return vc
        }
        
    }
    
    func tabsForPages() -> [ViewPagerTab] {
        return tabs
        
    }
    
    
}

