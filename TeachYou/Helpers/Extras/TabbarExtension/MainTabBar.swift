//
//  MainTabBarController.swift
//

import UIKit

protocol TabbarDelegate:class {
    func tabBarButtonTapped()
}
class MainTabBar: UITabBar {
    
    private var firstBtn = UIButton()
    private var secondBtn = UIButton()
    private var thirdBtn = UIButton()
    private var fourthBtn = UIButton()
    private var fifthBtn = UIButton()
    
    private var bgView = UIView()

    weak var tabdelegate : TabbarDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        setupMiddleButton()
        if #available(iOS 13.0, *) {
            let appearance = self.standardAppearance
            appearance.shadowImage = nil
            appearance.shadowColor = nil
            appearance.backgroundColor = #colorLiteral(red: 0.4588235294, green: 0, blue: 0.1215686275, alpha: 1)
            
            self.standardAppearance = appearance
        } else {
            self.shadowImage = UIImage()
           // self.backgroundImage = UIImage()
            
        }

        self.tintColor = #colorLiteral(red: 0.4588235294, green: 0, blue: 0.1215686275, alpha: 1)
        self.unselectedItemTintColor = .clear
        self.isTranslucent = false
//        self.layer.shadowColor = UIColor.init(red: 0, green:0, blue: 0, alpha: 0.4).cgColor
//        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
//        self.layer.shadowRadius = 5
//        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
       
    }
    
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        if self.isHidden {
//            return super.hitTest(point, with: event)
//        }
//
//        let from = point
//        let to = middleButton.center
//
//        return sqrt((from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)) <= 39 ? middleButton : super.hitTest(point, with: event)
//    }
    
    func setupMiddleButton() {
        
        firstBtn.frame.size = CGSize(width: 50, height: 50)
        secondBtn.frame.size = CGSize(width: 50, height: 50)
        thirdBtn.frame.size = CGSize(width: 50, height: 50)
        fourthBtn.frame.size = CGSize(width: 50, height: 50)
        fifthBtn.frame.size = CGSize(width: 50, height: 50)
        
        let eachWidth = UIScreen.main.bounds.width / 5
        firstBtn.center = CGPoint(x: eachWidth/2, y: 0)
        secondBtn.center = CGPoint(x: eachWidth, y: 0)
        thirdBtn.center = CGPoint(x: (eachWidth * 2), y: 0)
        fourthBtn.center = CGPoint(x: (eachWidth * 3), y: 0)
        fifthBtn.center = CGPoint(x: (eachWidth * 4), y: 0)
        
        firstBtn.setBackgroundImage(UIImage(named: "homet"), for: .normal)
        secondBtn.setBackgroundImage(UIImage(named: "tagt"), for: .normal)
        thirdBtn.setBackgroundImage(UIImage(named: "usert"), for: .normal)
        fourthBtn.setBackgroundImage(UIImage(named: "searcht"), for: .normal)
        fifthBtn.setBackgroundImage(UIImage(named: "notificationt"), for: .normal)
        
        firstBtn.addTarget(self, action: #selector(firstTabBarButtonTapped), for: .touchUpInside)
        secondBtn.addTarget(self, action: #selector(secondTabBarButtonTapped), for: .touchUpInside)
        thirdBtn.addTarget(self, action: #selector(thirdTabBarButtonTapped), for: .touchUpInside)
        fourthBtn.addTarget(self, action: #selector(fourthTabBarButtonTapped), for: .touchUpInside)
        fifthBtn.addTarget(self, action: #selector(fifthTabBarButtonTapped), for: .touchUpInside)

        addSubview(firstBtn)
        bringSubviewToFront(firstBtn)
        addSubview(secondBtn)
        bringSubviewToFront(secondBtn)
        addSubview(thirdBtn)
        bringSubviewToFront(thirdBtn)
        addSubview(fourthBtn)
        bringSubviewToFront(fourthBtn)
        addSubview(fifthBtn)
        bringSubviewToFront(fifthBtn)
    }
    
    @objc func firstTabBarButtonTapped() {
        let vc1 = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kFeedVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! FeedVC
        Utilities.topViewController()?.navigationController?.pushViewController(vc1, animated: true)
    }
    
    @objc func secondTabBarButtonTapped() {
        let vc1 = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kArticlesVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! ArticlesVC
               Utilities.topViewController()?.navigationController?.pushViewController(vc1, animated: true)
    }
    
    @objc func thirdTabBarButtonTapped() {
        let vc1 = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kPostsVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! PostsVC
               Utilities.topViewController()?.navigationController?.pushViewController(vc1, animated: true)
    }
    
    @objc func fourthTabBarButtonTapped() {
        let vc1 = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kProfileVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! ProfileVC
               Utilities.topViewController()?.navigationController?.pushViewController(vc1, animated: true)
    }
    
    @objc func fifthTabBarButtonTapped() {
        let vc1 = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kVideosVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! VideosVC
               Utilities.topViewController()?.navigationController?.pushViewController(vc1, animated: true)
    }
    
}

