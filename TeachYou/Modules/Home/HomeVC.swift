//
//  ViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 30/11/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import ViewPager_Swift
import SideMenu

class HomeVC: UIViewController {
    
    //MARK:- @IBOutlets
    @IBOutlet weak var pager: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var containerCollection: [UIView]!
    @IBOutlet weak var articlesContainerView: UIView!
    @IBOutlet weak var eventsContainerView: UIView!
    @IBOutlet weak var latestTrendsContanerView: UIView!
    @IBOutlet weak var mostlyViewedContainerView: UIView!
    @IBOutlet weak var inspirationalStoriesContainerView: UIView!
    @IBOutlet weak var wordOfTheDayContainerView: UIView!
    @IBOutlet weak var friendsContainerView: UIView!
    @IBOutlet weak var pagesContanerView: UIView!
    @IBOutlet weak var chatsContainerView: UIView!
    @IBOutlet weak var quizAndGamesContainerView: UIView!
    
    
    var menuTableDelegate: MenuTableDelegate?
    var tabs = [
        ViewPagerTab(title: "A", image: UIImage()),
        ViewPagerTab(title: "B", image: #imageLiteral(resourceName: "tag")),
        ViewPagerTab(title: "C", image: #imageLiteral(resourceName: "user")),
        ViewPagerTab(title: "D", image: #imageLiteral(resourceName: "search (1)")),
        ViewPagerTab(title: "E", image: #imageLiteral(resourceName: "notification"))
    ]
    var menu : SideMenuNavigationController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configPager()
        let btn: UIButton = UIButton(frame: CGRect(x: 20, y: 45, width: 50, height: 50))
        btn.setImage(#imageLiteral(resourceName: "menu"), for: .normal)
        btn.addTarget(self, action: #selector(addSlideMenuButton), for: .touchUpInside)
        btn.tag = 1
        self.view.addSubview(btn)
        menu = SideMenuNavigationController(rootViewController: MenuTableVC())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
    }
    
    @objc func addSlideMenuButton(){
        present(menu!, animated: true) {
            self.menuTableDelegate = self
        }
    }
    
    func configPager(){
        let pagerview = ViewPagerOptions(viewPagerWithFrame:CGRect(x: 0, y: 0, width: self.view.frame.width, height: pager.frame.height))
        pagerview.tabType = ViewPagerTabType.image
        pagerview.isEachTabEvenlyDistributed = true
        pagerview.isTabHighlightAvailable = true
        pagerview.isTabIndicatorAvailable = true
        pagerview.tabViewBackgroundDefaultColor = #colorLiteral(red: 0.4588235294, green: 0, blue: 0.1215686275, alpha: 1)
        pagerview.tabViewTextDefaultColor = UIColor.white
        
        let viewPager = ViewPagerController()
        viewPager.options = pagerview
        viewPager.dataSource = self
        
        self.addChild(viewPager)
        self.pager.addSubview(viewPager.view)
        viewPager.didMove(toParent: self)
        viewPager.delegate = self
    }
    
}

extension HomeVC: ViewPagerControllerDataSource, ViewPagerControllerDelegate {
   
    func numberOfPages() -> Int {
        return 5
    }
    
    func viewControllerAtPosition(position: Int) -> UIViewController {
        
        switch position {
        case 0:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kFeedVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! FeedVC
            return vc
        case 1:
            let vc = Utilities.viewConrollerObject(identifier:  ViewControllerConstants.kEventsVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! EventsVC
            return vc
        case 2:
            let vc = Utilities.viewConrollerObject(identifier: ViewControllerConstants.kProfileVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! ProfileVC
            return vc
        case 3:
            let vc = Utilities.viewConrollerObject(identifier: ViewControllerConstants.kSearchViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! SearchViewController
            return vc
        default:
            let vc = Utilities.viewConrollerObject(identifier: ViewControllerConstants.kPostsVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! PostsVC
            return vc
        }
        
    }
    
    func tabsForPages() -> [ViewPagerTab] {
        return tabs
        
    }
    
    
}


extension HomeVC : MenuTableDelegate {
    
    func menuTableCellTapped(index: Int) {
        switch index {
        case 0:
            for each in containerCollection {
                each.isHidden = true
            }
        case 1:
            for each in containerCollection {
                if each == articlesContainerView {
                    each.isHidden = false
                } else {
                    each.isHidden = true
                }
            }
        case 2:
            for each in containerCollection {
                if each == eventsContainerView {
                    each.isHidden = false
                } else {
                    each.isHidden = true
                }
            }
        case 3:
            for each in containerCollection {
                each.isHidden = true
            }
        case 4:
            for each in containerCollection {
                if each == latestTrendsContanerView {
                    each.isHidden = false
                } else {
                    each.isHidden = true
                }
            }
        case 5:
            for each in containerCollection {
                if each == mostlyViewedContainerView {
                    each.isHidden = false
                } else {
                    each.isHidden = true
                }
            }
        case 6:
            for each in containerCollection {
                if each == inspirationalStoriesContainerView {
                    each.isHidden = false
                } else {
                    each.isHidden = true
                }
            }
        case 7:
            for each in containerCollection {
                if each == wordOfTheDayContainerView {
                    each.isHidden = false
                } else {
                    each.isHidden = true
                }
            }
        case 8:
            for each in containerCollection {
                if each == friendsContainerView {
                    each.isHidden = false
                } else {
                    each.isHidden = true
                }
            }
        case 9:
            for each in containerCollection {
                if each == pagesContanerView {
                    each.isHidden = false
                } else {
                    each.isHidden = true
                }
            }
        case 10:
            for each in containerCollection {
                if each == chatsContainerView {
                    each.isHidden = false
                } else {
                    each.isHidden = true
                }
            }
        default:
            for each in containerCollection {
                if each == quizAndGamesContainerView {
                    each.isHidden = false
                } else {
                    each.isHidden = true
                }
            }
        }
    }
}
