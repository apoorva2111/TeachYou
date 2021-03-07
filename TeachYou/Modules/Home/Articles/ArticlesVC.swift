//
//  ArticlesVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 01/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import ViewPager_Swift
import Alamofire

class ArticlesVC: UIViewController {
    
    @IBOutlet weak var backBtn              : UIButton!
    @IBOutlet weak var vcTitleLabel         : UILabel!
    @IBOutlet weak var pager: UIView!

    var tabs = [
        ViewPagerTab(title: "Article", image: nil),
        ViewPagerTab(title: "My Articles", image: nil),
        ViewPagerTab(title: "Add new Article", image: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        configPager()
        
    }
    
    func initialSetup() {
        self.vcTitleLabel.text = "EDUCATIONAL ARTICLES"
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
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}


extension ArticlesVC: ViewPagerControllerDataSource,ViewPagerControllerDelegate{
    func numberOfPages() -> Int {
        return tabs.count
    }
    
    func viewControllerAtPosition(position: Int) -> UIViewController {
        
        switch position {
        case 0:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kStudyVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! StudyVC
            return vc
        case 1:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kMyArticlesVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! MyArticlesVC
            return vc
        default:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kAddNewArticleVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! AddNewArticleVC
            return vc
        }
        
    }
    
    func tabsForPages() -> [ViewPagerTab] {
        return tabs
        
    }
    
    
}
