//
//  FriendsVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 10/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire
import CarbonKit

//class FriendsVC: UIViewController {
//
//    enum SelectedFriendsVC {
//        case people
//        case friends
//        case friendRequests
//        case sentRequests
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
//    @IBOutlet weak var collectionView: UICollectionView!
//
//    var selectedVC                : SelectedFriendsVC = .people
//    var studyEventsVC             : PeopleViewController!
//    var goingEventsVC             : FriendsViewController!
//    var interestedEventsVC        : FriendRequestsViewController!
//    var myEventsVC                : SentRequestsViewController!
//    let titleArr = ["People", "Friends", "Friend Requests", "Sent Requests"]
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        initialSetup()
//        collectionView.register(UINib(nibName: "EventVcPagerCell", bundle: nil), forCellWithReuseIdentifier: "EventVcPagerCell")
//    }
//
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        self.setupSubViews()
//    }
//
//    func initialSetup() {
//        self.vcTitleLabel.text = "FRIENDS"
//        self.studyEventButton.setTitle("People", for: .normal)
//        self.goingEventButton.setTitle("Friends", for: .normal)
//        self.interestedEventButton.setTitle("Friend Requests", for: .normal)
//        self.myEventsButton.setTitle("Sent Requests", for: .normal)
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
//
//}


//extension FriendsVC {
//
//    private func configureScrollView(){
//        self.mainScrollView.contentSize = CGSize(width: 5 * AppConstants.SCREEN_WIDTH, height: 1)
//        self.mainScrollView.isPagingEnabled = true
//    }
//
//    private func instantiateSubViews(){
//
//        self.studyEventsVC = PeopleViewController.instantiate(fromAppStoryboard: .Main)
//        self.addChild(studyEventsVC)
//        self.mainScrollView.addSubview(studyEventsVC.view)
//
//        self.goingEventsVC = FriendsViewController.instantiate(fromAppStoryboard: .Main)
//        self.addChild(goingEventsVC)
//        self.mainScrollView.addSubview(goingEventsVC.view)
//
//        self.interestedEventsVC = FriendRequestsViewController.instantiate(fromAppStoryboard: .Main)
//        self.addChild(interestedEventsVC)
//        self.mainScrollView.addSubview(interestedEventsVC.view)
//
//        self.myEventsVC = SentRequestsViewController.instantiate(fromAppStoryboard: .Main)
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

//extension FriendsVC {
//
//    @IBAction func studyEventButtonTapped(_ sender: UIButton) {
//        self.selectedVC = .people
//        self.mainScrollView.setContentOffset(CGPoint.zero, animated: true)
//        self.view.layoutIfNeeded()
//    }
//
//    @IBAction func goingEventsButtonTapped(_ sender: UIButton) {
//        self.selectedVC = .friends
//        self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH, y: 0), animated: true)
//        self.view.layoutIfNeeded()
//    }
//
//    @IBAction func interestedEventsButtonTapped(_ sender: UIButton) {
//        self.selectedVC = .friendRequests
//        self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH * 2, y: 0), animated: true)
//        self.view.layoutIfNeeded()
//    }
//
//    @IBAction func myEventsButtonTapped(_ sender: UIButton) {
//        self.selectedVC = .sentRequests
//        self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH, y: 0), animated: true)
//        self.view.layoutIfNeeded()
//    }
//
//    @IBAction func bckBtnTap(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
//        }
//}

//extension FriendsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
//            self.selectedVC = .people
//            self.mainScrollView.setContentOffset(CGPoint.zero, animated: true)
//            self.view.layoutIfNeeded()
//
//        case 1:
//            self.selectedVC = .friends
//            self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH, y: 0), animated: true)
//            self.view.layoutIfNeeded()
//
//        case 2:
//            self.selectedVC = .friendRequests
//            self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH * 2, y: 0), animated: true)
//            self.view.layoutIfNeeded()
//
//        default:
//            self.selectedVC = .sentRequests
//            self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH * 3, y: 0), animated: true)
//            self.view.layoutIfNeeded()
//
//        }
//    }
//
//}

//extension FriendsVC : UIScrollViewDelegate{
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


class FriendsVC: UIViewController {
    
    @IBOutlet weak var backBtn              : UIButton!
    @IBOutlet weak var vcTitleLabel         : UILabel!
    @IBOutlet weak var pager: UIView!

    var tabs = [
        ViewPagerTab(title: "People", image: nil),
        ViewPagerTab(title: "Friends", image: nil),
        ViewPagerTab(title: "Friend Requests", image: nil),
        ViewPagerTab(title: "Sent Requests", image: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
//        configPager()
        setupView()
        
    }
    
    func initialSetup() {
        self.vcTitleLabel.text = "Friends"
    }
    
    func setupView(){
        let titleArrays: [String] = tabs.map { $0.title }
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: titleArrays, delegate: self)
//        let screenWidth = Int(self.view.frame.width)
//        for (index, _) in tabs.enumerated() {
//            carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(CGFloat(screenWidth/tabs.count), forSegmentAt: index)
//        }
//        carbonTabSwipeNavigation.setTabExtraWidth(5)
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
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}


extension FriendsVC: ViewPagerControllerDataSource,ViewPagerControllerDelegate{
    func numberOfPages() -> Int {
        return tabs.count
    }
    
    func viewControllerAtPosition(position: Int) -> UIViewController {
        
        switch position {
        case 0:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kPeopleViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! PeopleViewController
            return vc
        case 1:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kFriendsViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! FriendsViewController
            return vc
        case 2:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kFriendRequestsViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! FriendRequestsViewController
            return vc
        default:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kSentRequestsViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! SentRequestsViewController
            return vc
        }
        
    }
    
    func tabsForPages() -> [ViewPagerTab] {
        return tabs
        
    }
    
    
}

extension FriendsVC: CarbonTabSwipeNavigationDelegate {
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        let subSection = tabs[Int(index)]
        switch subSection.title {
        case "People":
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kPeopleViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! PeopleViewController
            return vc
        case "Friends":
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kFriendsViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! FriendsViewController
            return vc
        case "Friend Requests":
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kFriendRequestsViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! FriendRequestsViewController
            return vc
        case "Sent Requests":
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kSentRequestsViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! SentRequestsViewController
            return vc
        default:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kSentRequestsViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! SentRequestsViewController
            return vc
        }
    }
    
    
}
