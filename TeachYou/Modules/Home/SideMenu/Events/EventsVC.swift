//
//  EventsVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 10/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

//class EventsVC: UIViewController {
//
//    enum SelectedEventVC {
//        case studyEvent
//        case goingEvents
//        case interestedEvents
//        case myEvents
//        case createEvent
//    }
//
//
//    @IBOutlet weak var mainScrollView       : UIScrollView!
//    @IBOutlet weak var highlightedView      : UIView!
//    @IBOutlet weak var myBackgroundView     : UIView!
//    @IBOutlet weak var studyEventButton            : UIButton!
//    @IBOutlet weak var goingEventButton            : UIButton!
//    @IBOutlet weak var interestedEventButton            : UIButton!
//    @IBOutlet weak var myEventsButton           : UIButton!
//    @IBOutlet weak var createEventButton          : UIButton!
//    @IBOutlet weak var topView              : UIView!
//    @IBOutlet weak var backBtn              : UIButton!
//    @IBOutlet weak var vcTitleLabel         : UILabel!
//    @IBOutlet weak var collectionView: UICollectionView!
//
//    var selectedVC                : SelectedEventVC = .studyEvent
//    var studyEventsVC             : StudyEventsVC!
//    var goingEventsVC             : GoingEventsVC!
//    var interestedEventsVC        : InterestedEventsVC!
//    var myEventsVC                : MyEventsVC!
//    var createEventsVC             : CreateEventsVC!
//    let titleArr = ["Study", "Going", "Interested", "My Events", "Create Event"]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        initialSetup()
//        collectionView.register(UINib(nibName: "EventVcPagerCell", bundle: nil), forCellWithReuseIdentifier: "EventVcPagerCell")
//    }
//
//
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        self.setupSubViews()
//    }
//
//
//    func initialSetup() {
//        self.vcTitleLabel.text = "EDUCATIONAL EVENTS"
//        self.studyEventButton.setTitle("Study", for: .normal)
//        self.goingEventButton.setTitle("Going", for: .normal)
//        self.interestedEventButton.setTitle("Interested", for: .normal)
//        self.myEventsButton.setTitle("My Events", for: .normal)
//        self.createEventButton.setTitle("Create event", for: .normal)
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


//extension EventsVC {
//
//    private func configureScrollView(){
//        self.mainScrollView.contentSize = CGSize(width: 5 * AppConstants.SCREEN_WIDTH, height: 1)
//        self.mainScrollView.isPagingEnabled = true
//    }
//
//    private func instantiateSubViews(){
//
//        self.studyEventsVC = StudyEventsVC.instantiate(fromAppStoryboard: .Main)
//        self.addChild(studyEventsVC)
//        self.mainScrollView.addSubview(studyEventsVC.view)
//
//        self.goingEventsVC = GoingEventsVC.instantiate(fromAppStoryboard: .Main)
//        self.addChild(goingEventsVC)
//        self.mainScrollView.addSubview(goingEventsVC.view)
//
//        self.interestedEventsVC = InterestedEventsVC.instantiate(fromAppStoryboard: .Main)
//        self.addChild(interestedEventsVC)
//        self.mainScrollView.addSubview(interestedEventsVC.view)
//
//        self.myEventsVC = MyEventsVC.instantiate(fromAppStoryboard: .Main)
//        self.addChild(myEventsVC)
//        self.mainScrollView.addSubview(myEventsVC.view)
//
//        self.createEventsVC = CreateEventsVC.instantiate(fromAppStoryboard: .Main)
//        self.addChild(createEventsVC)
//        self.mainScrollView.addSubview(createEventsVC.view)
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
//                                         y: 0,
//                                         width: scrollViewWidth,
//                                         height: scrollViewHeight)
//
//        //frame of Booking History page 2
//        self.goingEventsVC.view.frame = CGRect(x: scrollViewWidth,
//                                              y: 0,
//                                              width: scrollViewWidth,
//                                              height: scrollViewHeight)
//
//        self.interestedEventsVC.view.frame = CGRect(x: 2*scrollViewWidth,
//                                                 y: 0,
//                                                 width: scrollViewWidth,
//                                                 height: scrollViewHeight)
//
//        self.myEventsVC.view.frame = CGRect(x: 3*scrollViewWidth,
//                                              y: 0,
//                                              width: scrollViewWidth,
//                                              height: scrollViewHeight)
//
//        self.createEventsVC.view.frame = CGRect(x: 4*scrollViewWidth,
//                                                 y: 0,
//                                                 width: scrollViewWidth,
//                                                 height: scrollViewHeight)
//
//
//    }
//
//}

//extension EventsVC {
//
//    @IBAction func studyEventButtonTapped(_ sender: UIButton) {
//        self.selectedVC = .studyEvent
//        self.mainScrollView.setContentOffset(CGPoint.zero, animated: true)
//        self.view.layoutIfNeeded()
//    }
//
//    @IBAction func goingEventsButtonTapped(_ sender: UIButton) {
//        self.selectedVC = .goingEvents
//        self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH, y: 0), animated: true)
//        self.view.layoutIfNeeded()
//    }
//
//    @IBAction func interestedEventsButtonTapped(_ sender: UIButton) {
//        self.selectedVC = .interestedEvents
//        self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH * 2, y: 0), animated: true)
//        self.view.layoutIfNeeded()
//    }
//
//    @IBAction func myEventsButtonTapped(_ sender: UIButton) {
//        self.selectedVC = .myEvents
//        self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH, y: 0), animated: true)
//        self.view.layoutIfNeeded()
//    }
//
//    @IBAction func createEventButtonTapped(_ sender: UIButton) {
//        self.selectedVC = .createEvent
//        self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH * 2, y: 0), animated: true)
//        self.view.layoutIfNeeded()
//    }
//
////    @IBAction func bckBtnTap(_ sender: UIButton) {
////        self.pop()
////    }
//}

//extension EventsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
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
//            self.selectedVC = .studyEvent
//            self.mainScrollView.setContentOffset(CGPoint.zero, animated: true)
//            self.view.layoutIfNeeded()
//
//        case 1:
//            self.selectedVC = .goingEvents
//            self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH, y: 0), animated: true)
//            self.view.layoutIfNeeded()
//
//        case 2:
//            self.selectedVC = .interestedEvents
//            self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH * 2, y: 0), animated: true)
//            self.view.layoutIfNeeded()
//
//        case 3:
//            self.selectedVC = .myEvents
//            self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH * 3, y: 0), animated: true)
//            self.view.layoutIfNeeded()
//
//        default:
//            self.selectedVC = .createEvent
//            self.mainScrollView.setContentOffset(CGPoint(x: AppConstants.SCREEN_WIDTH * 4, y: 0), animated: true)
//            self.view.layoutIfNeeded()
//        }
//    }
//
//}

//extension EventsVC : UIScrollViewDelegate{
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

class EventsVC : UIViewController {
    
    @IBOutlet weak var backBtn              : UIButton!
    @IBOutlet weak var vcTitleLabel         : UILabel!
    @IBOutlet weak var pager: UIView!
    
    var tabs = [
        ViewPagerTab(title: "Events", image: nil),
        ViewPagerTab(title: "Going", image: nil),
        ViewPagerTab(title: "Interested", image: nil),
        ViewPagerTab(title: "My Events", image: nil),
        ViewPagerTab(title: "Create Event", image: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        configPager()
        
    }
    
    func initialSetup() {
        self.vcTitleLabel.text = "Education Events"
    }
    
    func configPager(){
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        let pagerview = ViewPagerOptions(viewPagerWithFrame:CGRect(x: 0, y: 0, width: self.view.frame.width, height: pager.frame.height))
        pagerview.tabType = ViewPagerTabType.basic
        pagerview.isEachTabEvenlyDistributed = false
        pagerview.isTabHighlightAvailable = true
        pagerview.isTabIndicatorAvailable = true
        pagerview.tabViewPaddingLeft = 20
        pagerview.tabViewPaddingRight = 20
        pagerview.fitAllTabsInView = false
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


extension EventsVC: ViewPagerControllerDataSource,ViewPagerControllerDelegate{
    func numberOfPages() -> Int {
        return tabs.count
    }
    
    func viewControllerAtPosition(position: Int) -> UIViewController {
        
        switch position {
        case 0:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kStudyEventsVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! StudyEventsVC
            return vc
       
        case 1:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kGoingEventsVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! GoingEventsVC
            return vc
      
        case 2:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kInterestedEventsVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! InterestedEventsVC
            return vc
            
        case 3:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kMyEventsVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! MyEventsVC
            return vc
            
        default:
            let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kCreateEventsVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! CreateEventsVC
            return vc
        }
        
    }
    
    func tabsForPages() -> [ViewPagerTab] {
        return tabs
        
    }
    
    
}
