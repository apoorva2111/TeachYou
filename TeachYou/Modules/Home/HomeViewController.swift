//
//  HomeViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 10/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK: ENUM
    //============================
    enum SelectedVC {
        case feed
        case articles
        case profile
        case videos
        case posts
        case events
        case topics
        case latestTrends
        case mostlyViewed
        case inspirationalStories
        case wordOfTheDay
        case friends
        case pages
        case chat
        case quizAndGames
    }
    
    //MARK:- Properties
    //====================
    var selectedVC                  : SelectedVC = .feed
    var feedVC                      : FeedVC!
    var articlesVC                  : ArticlesVC!
    var profileVC                   : ProfileViewController!
    var videosVC                    : SearchViewController!
    var postsVC                     : NotificationsViewController!
    var eventsVC                    : EventsVC!
    var topicsVC                    : TopicsVC!
    var latestTrendsVC              : LatestTrendsVC!
    var mostlyViewedVC              : MostlyViewedVC!
//    var inspirationalStoriesVC      : InspirationalStoriesVC!
    var wordOfTheDayVC              : WordOfTheDayVC!
    var friendsVC                   : FriendsVC!
    var pagesVC                     : PagesVC!
    var chatVC                      : ChatsVC!
    var quizAndGamesVC              : QuizAndGamesVC!
    let screenWidth     =   UIScreen.main.bounds.width
    var sideMenuShow = false
    let arrayMenuOptions = ["Home", "Articles", "Events", "Topics", "Today's Spotlight", "Word of the Day", "Friends", "Pages", "Groups", "Chat", "Quiz & Games"]
    
    @IBOutlet weak var mainScrollView       : UIScrollView!
    @IBOutlet weak var highlightedView      : UIView!
    @IBOutlet weak var myBackgroundView     : UIView!
    @IBOutlet weak var menuBtn            : UIButton!
    @IBOutlet weak var articlesBtn           : UIButton!
    @IBOutlet weak var profileBtn          : UIButton!
    @IBOutlet weak var videosBtn            : UIButton!
    @IBOutlet weak var postsBtn           : UIButton!
    @IBOutlet weak var topView              : UIView!
    @IBOutlet weak var backBtn              : UIButton!
    @IBOutlet weak var vcTitleLabel         : UILabel!
    @IBOutlet weak var sideMenuView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.setupSubViews()
    }
    
    func initialSetup(){
        self.mainScrollView.delegate = self
        self.configureScrollView()
        // self.instantiateViewController()
        self.instantiateSubViews()
        //  CommonFunctions.dropShadow(view: self.topView)
        self.mainScrollView.isScrollEnabled = false
    }
    
    func setupButtons() {
        
        self.menuBtn.setTitle("", for: .normal)
        self.articlesBtn.setTitle("", for: .normal)
        self.videosBtn.setTitle("", for: .normal)
        self.profileBtn.setTitle("", for: .normal)
        self.postsBtn.setTitle("", for: .normal)
        
        self.menuBtn.setImage(#imageLiteral(resourceName: "menu"), for: .normal)
        self.articlesBtn.setImage(#imageLiteral(resourceName: "tagt"), for: .normal)
        self.videosBtn.setImage(#imageLiteral(resourceName: "searcht"), for: .normal)
        self.profileBtn.setImage(#imageLiteral(resourceName: "usert"), for: .normal)
        self.postsBtn.setImage(#imageLiteral(resourceName: "notificationt"), for: .normal)
        
    }
    
    private func setUpstatusView(){
        topView.layer.shadowColor = #colorLiteral(red: 0.5764705882, green: 0.5764705882, blue: 0.5764705882, alpha: 0.16)
        topView.layer.shadowOffset = CGSize(width: 0, height: 5)
        topView.layer.masksToBounds = false
        topView.layer.shadowOpacity = 1
        topView.layer.shadowRadius = 10
        self.view.layoutIfNeeded()
    }
    
    
    private func configureScrollView(){
        self.mainScrollView.contentSize = CGSize(width: 5 * screenWidth, height: 1)
        self.mainScrollView.isPagingEnabled = true
    }
    
    
    private func instantiateSubViews(){
        
        self.feedVC = FeedVC.instantiate(fromAppStoryboard: .Main)
        self.addChild(feedVC)
        self.mainScrollView.addSubview(feedVC.view)
        
        self.articlesVC = ArticlesVC.instantiate(fromAppStoryboard: .Main)
        self.addChild(articlesVC)
        self.mainScrollView.addSubview(articlesVC.view)
        
        self.profileVC = ProfileViewController.instantiate(fromAppStoryboard: .Profile)
        self.addChild(profileVC)
        self.mainScrollView.addSubview(profileVC.view)
        
        self.videosVC = SearchViewController.instantiate(fromAppStoryboard: .Main)
        self.addChild(videosVC)
        self.mainScrollView.addSubview(videosVC.view)
        
        self.postsVC = NotificationsViewController.instantiate(fromAppStoryboard: .Main)
        self.addChild(postsVC)
        self.mainScrollView.addSubview(postsVC.view)
        
        self.eventsVC = EventsVC.instantiate(fromAppStoryboard: .Main)
        self.addChild(eventsVC)
        self.mainScrollView.addSubview(eventsVC.view)
        
        self.latestTrendsVC = LatestTrendsVC.instantiate(fromAppStoryboard: .Main)
        self.addChild(latestTrendsVC)
        self.mainScrollView.addSubview(latestTrendsVC.view)
        
        self.mostlyViewedVC = MostlyViewedVC.instantiate(fromAppStoryboard: .Main)
        self.addChild(mostlyViewedVC)
        self.mainScrollView.addSubview(mostlyViewedVC.view)
        
//        self.inspirationalStoriesVC = InspirationalStoriesVC.instantiate(fromAppStoryboard: .Main)
//        self.addChild(inspirationalStoriesVC)
//        self.mainScrollView.addSubview(inspirationalStoriesVC.view)
        
        self.wordOfTheDayVC = WordOfTheDayVC.instantiate(fromAppStoryboard: .Main)
        self.addChild(wordOfTheDayVC)
        self.mainScrollView.addSubview(wordOfTheDayVC.view)
        
        self.friendsVC = FriendsVC.instantiate(fromAppStoryboard: .Main)
        self.addChild(friendsVC)
        self.mainScrollView.addSubview(friendsVC.view)
        
        self.pagesVC = PagesVC.instantiate(fromAppStoryboard: .Main)
        self.addChild(pagesVC)
        self.mainScrollView.addSubview(pagesVC.view)
        
        self.chatVC = ChatsVC.instantiate(fromAppStoryboard: .Main)
        self.addChild(chatVC)
        self.mainScrollView.addSubview(chatVC.view)
        
        self.quizAndGamesVC = QuizAndGamesVC.instantiate(fromAppStoryboard: .Main)
        self.addChild(quizAndGamesVC)
        self.mainScrollView.addSubview(quizAndGamesVC.view)
        
        self.topicsVC = TopicsVC.instantiate(fromAppStoryboard: .Main)
        self.addChild(topicsVC)
        self.mainScrollView.addSubview(topicsVC.view)
        
    }
    
    private func setupSubViews(){
        let scrollViewHeight = self.mainScrollView.frame.height + 50
        let scrollViewWidth = self.view.frame.width
        //frame of tutorial scroll view
        self.mainScrollView.contentSize.width = 14 * scrollViewWidth
        self.setUpstatusView()
        
        //frame of Current Booking page 1
        self.feedVC.view.frame = CGRect(x: 0,
                                        y: 0,
                                        width: scrollViewWidth,
                                        height: scrollViewHeight)
        
        //frame of Booking History page 2
        self.topicsVC.view.frame = CGRect(x: scrollViewWidth,
                                          y: 0,
                                          width: scrollViewWidth,
                                          height: scrollViewHeight)
        
        self.profileVC.view.frame = CGRect(x: 2*scrollViewWidth,
                                           y: 0,
                                           width: scrollViewWidth,
                                           height: scrollViewHeight)
        
        self.videosVC.view.frame = CGRect(x: 3*scrollViewWidth,
                                          y: 0,
                                          width: scrollViewWidth,
                                          height: scrollViewHeight)
        
        self.postsVC.view.frame = CGRect(x: 4*scrollViewWidth,
                                         y: 0,
                                         width: scrollViewWidth,
                                         height: scrollViewHeight)
        
        self.articlesVC.view.frame = CGRect(x: 5*scrollViewWidth,
                                            y: 0,
                                            width: scrollViewWidth,
                                            height: scrollViewHeight)
        
        self.eventsVC.view.frame = CGRect(x: 6*scrollViewWidth,
                                          y: 0,
                                          width: scrollViewWidth,
                                          height: scrollViewHeight)
        
        self.latestTrendsVC.view.frame = CGRect(x: 7*scrollViewWidth,
                                                y: 0,
                                                width: scrollViewWidth,
                                                height: scrollViewHeight)
        
        self.mostlyViewedVC.view.frame = CGRect(x: 8*scrollViewWidth,
                                                y: 0,
                                                width: scrollViewWidth,
                                                height: scrollViewHeight)
        
//        self.inspirationalStoriesVC.view.frame = CGRect(x: 9*scrollViewWidth,
//                                                        y: 0,
//                                                        width: scrollViewWidth,
//                                                        height: scrollViewHeight)
//
        self.wordOfTheDayVC.view.frame = CGRect(x: 9*scrollViewWidth,
                                                y: 0,
                                                width: scrollViewWidth,
                                                height: scrollViewHeight)
        
        self.friendsVC.view.frame = CGRect(x: 10*scrollViewWidth,
                                           y: 0,
                                           width: scrollViewWidth,
                                           height: scrollViewHeight)
        
        self.pagesVC.view.frame = CGRect(x: 11*scrollViewWidth,
                                         y: 0,
                                         width: scrollViewWidth,
                                         height: scrollViewHeight)
        
        self.chatVC.view.frame = CGRect(x: 12*scrollViewWidth,
                                        y: 0,
                                        width: scrollViewWidth,
                                        height: scrollViewHeight)
        
        self.quizAndGamesVC.view.frame = CGRect(x: 13*scrollViewWidth,
                                                y: 0,
                                                width: scrollViewWidth,
                                                height: scrollViewHeight)
        
    }
    
    @IBAction func feedButtonTapped(_ sender: UIButton) {
        if sideMenuShow {
            sideMenuShow = !sideMenuShow
            self.sideMenuView.isHidden = false
        } else {
            sideMenuShow = !sideMenuShow
            self.sideMenuView.isHidden = true
        }
        
    }
    
    @IBAction func articlesButtonTapped(_ sender: UIButton) {
        self.selectedVC = .events
        self.mainScrollView.setContentOffset(CGPoint(x: screenWidth, y: 0), animated: false)
        self.view.layoutIfNeeded()
    }
    
    @IBAction func profileButtonTapped(_ sender: UIButton) {
        self.selectedVC = .profile
        self.mainScrollView.setContentOffset(CGPoint(x: screenWidth * 2, y: 0), animated: false)
        self.view.layoutIfNeeded()
    }
    
    @IBAction func videosButtonTapped(_ sender: UIButton) {
        self.selectedVC = .videos
        self.mainScrollView.setContentOffset(CGPoint(x: screenWidth * 3, y: 0), animated: false)
        self.view.layoutIfNeeded()
    }
    
    @IBAction func postsButtonTapped(_ sender: UIButton) {
        self.selectedVC = .posts
        self.mainScrollView.setContentOffset(CGPoint(x: screenWidth * 4, y: 0), animated: false)
        self.view.layoutIfNeeded()
    }
    
}


extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellMenu")!
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        
        let lblTitle : UILabel = cell.contentView.viewWithTag(101) as! UILabel
        let imgIcon : UIImageView = cell.contentView.viewWithTag(100) as! UIImageView
        
        imgIcon.contentMode = .scaleAspectFit
        
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
            imgIcon.image = #imageLiteral(resourceName: "wordoftheday")
//        case 6:
//            lblTitle.text = arrayMenuOptions[6]
//            imgIcon.image = #imageLiteral(resourceName: "inspirational")
        case 8:
            lblTitle.text = arrayMenuOptions[8]
            imgIcon.image = #imageLiteral(resourceName: "groupicon")
        case 6:
            lblTitle.text = arrayMenuOptions[6]
            imgIcon.image = #imageLiteral(resourceName: "friend")
        case 7:
            lblTitle.text = arrayMenuOptions[7]
            imgIcon.image = #imageLiteral(resourceName: "page")
        case 9:
            lblTitle.text = arrayMenuOptions[9]
            imgIcon.image = #imageLiteral(resourceName: "chat")
        case 10:
            lblTitle.text = arrayMenuOptions[10]
            imgIcon.image = #imageLiteral(resourceName: "game")
        default :
            lblTitle.text = arrayMenuOptions[11]
            imgIcon.image = #imageLiteral(resourceName: "home")
        }
        
        lblTitle.textColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.tag = indexPath.row
        
        let scrollViewWidth = self.view.frame.width
        
        switch(indexPath.row) {
        case 0:
            sideMenuShow = !sideMenuShow
            self.sideMenuView.isHidden = true
            self.selectedVC = .feed
            self.mainScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
            self.view.layoutIfNeeded()
        case 1:
            sideMenuShow = !sideMenuShow
            self.sideMenuView.isHidden = true
            self.selectedVC = .articles
            self.mainScrollView.setContentOffset(CGPoint(x: screenWidth*5, y: 0), animated: false)
            self.view.layoutIfNeeded()
        case 2:
            sideMenuShow = !sideMenuShow
            self.sideMenuView.isHidden = true
            self.selectedVC = .events
            self.mainScrollView.setContentOffset(CGPoint(x: 6*scrollViewWidth, y: 0), animated: false)
            self.view.layoutIfNeeded()
        case 3:
            sideMenuShow = !sideMenuShow
            self.sideMenuView.isHidden = true
            self.selectedVC = .topics
            self.mainScrollView.setContentOffset(CGPoint(x: scrollViewWidth, y: 0), animated: false)
            self.view.layoutIfNeeded()
        case 4:
            sideMenuShow = !sideMenuShow
            self.sideMenuView.isHidden = true
            self.selectedVC = .latestTrends
            self.mainScrollView.setContentOffset(CGPoint(x: 7*scrollViewWidth, y: 0), animated: false)
            self.view.layoutIfNeeded()
        case 8:
            sideMenuShow = !sideMenuShow
            self.sideMenuView.isHidden = true
            self.selectedVC = .mostlyViewed
            self.mainScrollView.setContentOffset(CGPoint(x: 8*scrollViewWidth, y: 0), animated: false)
            self.view.layoutIfNeeded()
//        case 6:
//            sideMenuShow = !sideMenuShow
//            self.sideMenuView.isHidden = true
//            self.selectedVC = .inspirationalStories
//            self.mainScrollView.setContentOffset(CGPoint(x: 9*scrollViewWidth, y: 0), animated: false)
//            self.view.layoutIfNeeded()
        case 5:
            sideMenuShow = !sideMenuShow
            self.sideMenuView.isHidden = true
            self.selectedVC = .wordOfTheDay
            self.mainScrollView.setContentOffset(CGPoint(x: 9*scrollViewWidth, y: 0), animated: false)
            self.view.layoutIfNeeded()
        case 6:
            sideMenuShow = !sideMenuShow
            self.sideMenuView.isHidden = true
            self.selectedVC = .friends
            self.mainScrollView.setContentOffset(CGPoint(x: 10*scrollViewWidth, y: 0), animated: false)
            self.view.layoutIfNeeded()
        case 7:
            sideMenuShow = !sideMenuShow
            self.sideMenuView.isHidden = true
            self.selectedVC = .pages
            self.mainScrollView.setContentOffset(CGPoint(x: 11*scrollViewWidth, y: 0), animated: false)
            self.view.layoutIfNeeded()
        case 9:
            sideMenuShow = !sideMenuShow
            self.sideMenuView.isHidden = true
            self.selectedVC = .chat
            self.mainScrollView.setContentOffset(CGPoint(x: 12*scrollViewWidth, y: 0), animated: false)
            self.view.layoutIfNeeded()
        case 10:
            sideMenuShow = !sideMenuShow
            self.sideMenuView.isHidden = true
            self.selectedVC = .quizAndGames
            self.mainScrollView.setContentOffset(CGPoint(x: 13*scrollViewWidth, y: 0), animated: false)
            self.view.layoutIfNeeded()
        default :
            sideMenuShow = !sideMenuShow
            self.sideMenuView.isHidden = true
            self.selectedVC = .feed
            self.mainScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
            self.view.layoutIfNeeded()
        }
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
