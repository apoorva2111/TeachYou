//
//  PagesVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 10/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

//class PagesVC: UIViewController {
//
//    enum SelectedPagesVC {
//        case pages
//        case appreciatePages
//        case myPages
//        case createPage
//    }
//
//    @IBOutlet weak var mainScrollView       : UIScrollView!
//    @IBOutlet weak var highlightedView      : UIView!
//    @IBOutlet weak var myBackgroundView     : UIView!
//    @IBOutlet weak var studyEventButton            : UIButton!
//    @IBOutlet weak var goingEventButton            : UIButton!
//    @IBOutlet weak var interestedEventButton            : UIButton!
//    @IBOutlet weak var myEventsButton           : UIButton!
//    @IBOutlet weak var topView              : UIView!
//    @IBOutlet weak var backBtn              : UIButton!
//    @IBOutlet weak var vcTitleLabel         : UILabel!
//
//
//    var selectedVC                : SelectedPagesVC = .pages
//    var studyEventsVC             : PagesViewController!
//    var goingEventsVC             : AppreciatePagesViewController!
//    var interestedEventsVC        : MyPagesViewController!
//    var myEventsVC                : CreatePageViewController!
//    let titleArr = ["Pages", "Appreciate Pages", "My Pages", "Create Page"]
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        initialSetup()
//    }
//
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        self.setupSubViews()
//    }
//
//    func initialSetup() {
//        self.vcTitleLabel.text = "PAGES"
//        self.studyEventButton.setTitle("Pages", for: .normal)
//        self.goingEventButton.setTitle("Appreciate Pages", for: .normal)
//        self.interestedEventButton.setTitle("My Pages", for: .normal)
//        self.myEventsButton.setTitle("Create Page", for: .normal)
//
//        //        self.setupHighlightedButton(studyButton)
//        //        self.setupUnHighlightedButton(myArticlesButton)
//        //        self.setupUnHighlightedButton(addNewArticleButton)
//        self.mainScrollView.delegate = self
//        self.configureScrollView()
//        // self.instantiateViewController()
//        self.instantiateSubViews()
//        //  CommonFunctions.dropShadow(view: self.topView)
//        self.mainScrollView.isScrollEnabled = false
//    }
//
//    private func setUpstatusView(){
//        topView.layer.shadowColor = #colorLiteral(red: 0.5764705882, green: 0.5764705882, blue: 0.5764705882, alpha: 0.16)
//        topView.layer.shadowOffset = CGSize(width: 0, height: 5)
//        topView.layer.masksToBounds = false
//        topView.layer.shadowOpacity = 1
//        topView.layer.shadowRadius = 10
//        self.view.layoutIfNeeded()
//    }
//
//}

//extension PagesVC {
//
//    private func configureScrollView(){
//        self.mainScrollView.contentSize = CGSize(width: 5 * AppConstants.SCREEN_WIDTH, height: 1)
//        self.mainScrollView.isPagingEnabled = true
//    }
//
//    private func instantiateSubViews(){
//
//        self.studyEventsVC = PagesViewController.instantiate(fromAppStoryboard: .Main)
//        self.addChild(studyEventsVC)
//        self.mainScrollView.addSubview(studyEventsVC.view)
//
//        self.goingEventsVC = AppreciatePagesViewController.instantiate(fromAppStoryboard: .Main)
//        self.addChild(goingEventsVC)
//        self.mainScrollView.addSubview(goingEventsVC.view)
//
//        self.interestedEventsVC = MyPagesViewController.instantiate(fromAppStoryboard: .Main)
//        self.addChild(interestedEventsVC)
//        self.mainScrollView.addSubview(interestedEventsVC.view)
//
//        self.myEventsVC = CreatePageViewController.instantiate(fromAppStoryboard: .Main)
//        self.addChild(myEventsVC)
//        self.mainScrollView.addSubview(myEventsVC.view)
//
//    }
//
//    private func setupSubViews(){
//
//        //frame of tutorial scroll view
//        let scrollViewHeight = self.mainScrollView.frame.height
//        let scrollViewWidth = self.view.frame.width
//        self.mainScrollView.contentSize.width = 5 * scrollViewWidth
//        self.setUpstatusView()
//
//        //frame of Current Booking page 1
//        self.studyEventsVC.view.frame = CGRect(x: 0,
//                                               y: 0,
//                                               width: scrollViewWidth,
//                                               height: scrollViewHeight)
//
//        //frame of Booking History page 2
//        self.goingEventsVC.view.frame = CGRect(x: scrollViewWidth,
//                                               y: 0,
//                                               width: scrollViewWidth,
//                                               height: scrollViewHeight)
//
//        self.interestedEventsVC.view.frame = CGRect(x: 2*scrollViewWidth,
//                                                    y: 0,
//                                                    width: scrollViewWidth,
//                                                    height: scrollViewHeight)
//
//        self.myEventsVC.view.frame = CGRect(x: 3*scrollViewWidth,
//                                            y: 0,
//                                            width: scrollViewWidth,
//                                            height: scrollViewHeight)
//
//    }
//
//}

//extension PagesVC {
//
//    @IBAction func studyEventButtonTapped(_ sender: UIButton) {
//        self.selectedVC = .pages
//        self.mainScrollView.setContentOffset(CGPoint.zero, animated: true)
//        self.view.layoutIfNeeded()
//    }
//
//    @IBAction func goingEventsButtonTapped(_ sender: UIButton) {
//        self.selectedVC = .appreciatePages
//        self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH, y: 0), animated: true)
//        self.view.layoutIfNeeded()
//    }
//
//    @IBAction func interestedEventsButtonTapped(_ sender: UIButton) {
//        self.selectedVC = .myPages
//        self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH * 2, y: 0), animated: true)
//        self.view.layoutIfNeeded()
//    }
//
//    @IBAction func myEventsButtonTapped(_ sender: UIButton) {
//        self.selectedVC = .createPage
//        self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH, y: 0), animated: true)
//        self.view.layoutIfNeeded()
//    }
//
//    @IBAction func bckBtnTap(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
//        }
//}

//extension PagesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return titleArr.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventVcPagerCell", for: indexPath) as! EventVcPagerCell
//        cell.lblTitle.text = titleArr[indexPath.item]
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 130, height: 35)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        switch indexPath.item {
//        case 0:
//            self.selectedVC = .pages
//            self.mainScrollView.setContentOffset(CGPoint.zero, animated: true)
//            self.view.layoutIfNeeded()
//
//        case 1:
//            self.selectedVC = .appreciatePages
//            self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH, y: 0), animated: true)
//            self.view.layoutIfNeeded()
//
//        case 2:
//            self.selectedVC = .myPages
//            self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH * 2, y: 0), animated: true)
//            self.view.layoutIfNeeded()
//
//        default:
//            self.selectedVC = .createPage
//            self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH * 3, y: 0), animated: true)
//            self.view.layoutIfNeeded()
//
//        }
//    }
//
//}

//extension PagesVC : UIScrollViewDelegate{
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//
//        let width = scrollView.frame.width/self.highlightedView.frame.width
//        let scroll = scrollView.contentOffset.x
//
//        UIView.animate(withDuration: 0.5) {
//            self.highlightedView.transform = CGAffineTransform(translationX: scroll/width, y: 0)
//        }
//
//    }
//}


class PagesVC: UIViewController {
    
    @IBOutlet weak var backBtn              : UIButton!
    @IBOutlet weak var vcTitleLabel         : UILabel!
    @IBOutlet weak var pager: UIView!
    
    var tabs = [
        ViewPagerTab(title: "Pages", image: nil),
        ViewPagerTab(title: "Appreciate Pages", image: nil),
        ViewPagerTab(title: "My Pages", image: nil),
        ViewPagerTab(title: "Create Page", image: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        configPager()
        
    }
    
    func initialSetup() {
        self.vcTitleLabel.text = "Pages"
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

extension PagesVC: ViewPagerControllerDataSource,ViewPagerControllerDelegate{
    func numberOfPages() -> Int {
        return tabs.count
    }
    
    func viewControllerAtPosition(position: Int) -> UIViewController {
        
        switch position {
        case 0:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kPagesViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! PagesViewController
            return vc
       
        case 1:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kAppreciatePagesViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! AppreciatePagesViewController
            return vc
      
        case 2:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kMyPagesViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! MyPagesViewController
            return vc
            
        default:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kCreatePageViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! CreatePageViewController
            return vc
        }
        
    }
    
    func tabsForPages() -> [ViewPagerTab] {
        return tabs
        
    }
    
    
}
