//
//  BaseViewController.swift

import UIKit

protocol SendDataDelegate : class {
    func sendDataToController(data:Any)
}

class BaseViewC: UIViewController {
    
    weak var delegate : SendDataDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // to update status bar color
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
    }
    
    func showNavigationBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.isNavigationBarHidden = false
        changeBackButtonImage()
    }
    func hideNavigationBar(){
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    func customBar(title:String, image:String){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.isNavigationBarHidden = false
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = title
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        let btnRight: UIButton = UIButton()
        btnRight.setImage(UIImage(named: image), for: .normal)
        btnRight.addTarget(self, action: #selector(searchUser), for: .touchUpInside)
        btnRight.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let rightBtn = UIBarButtonItem(customView: btnRight)
        self.navigationItem.rightBarButtonItem = rightBtn
    }
    
    func customMeetingBar(title:String, image:String){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.isNavigationBarHidden = false
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = title
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        let btnRight: UIButton = UIButton()
        btnRight.setImage(UIImage(named: image), for: .normal)
        btnRight.addTarget(self, action: #selector(filterMeetings), for: .touchUpInside)
        btnRight.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let rightBtn = UIBarButtonItem(customView: btnRight)
        self.navigationItem.rightBarButtonItem = rightBtn
    }
    
    func addDeleteButton(){
        let btnRight: UIButton = UIButton()
        btnRight.setTitle(" \(Validation.kDeletePlaceholder)", for: .normal)
        btnRight.addTarget(self, action: #selector(DeletePost), for: .touchUpInside)
        btnRight.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btnRight.setTitleColor(.gray, for: .normal)
        btnRight.frame = CGRect(x: 0, y: 0, width: 33/2, height: 27/2)
        let rightBtn = UIBarButtonItem(customView: btnRight)
        self.navigationItem.rightBarButtonItem = rightBtn
    }
    
    func changeBackButtonImage(){
        let btnLeftMenu: UIButton = UIButton()
        btnLeftMenu.setImage(UIImage(named: "back"), for: .normal)
        btnLeftMenu.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        btnLeftMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func setnavigationBarTitle(title:String){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.isNavigationBarHidden = false
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = title
        self.navigationItem.titleView = label
    }
    
    func setnavBarTitle(title:String){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.isNavigationBarHidden = false
        let btnLeft: UIButton = UIButton()
        btnLeft.setTitle(" \(title)", for: .normal)
        btnLeft.setTitleColor(.black, for: .normal)
        btnLeft.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
        btnLeft.frame = CGRect(x: 0, y: 0, width: 130, height: 30)
        let LeftBtn = UIBarButtonItem(customView: btnLeft)
        self.navigationItem.leftBarButtonItem = LeftBtn
    }
    
    func sendDataToController(data:Any){
        delegate?.sendDataToController(data: data)
    }
    
    func customPostCreationBar(spacing: CGFloat) {
        self.navigationController?.isNavigationBarHidden = false
        let btnLeft: UIButton = UIButton()
        btnLeft.setTitle(" \(Validation.kCreatePostPlaceholder)", for: .normal)
        btnLeft.setTitleColor(.black, for: .normal)
        btnLeft.setImage(UIImage(named: "back"), for: .normal)
        btnLeft.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing);
        btnLeft.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0);
        btnLeft.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        btnLeft.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        let LeftBtn = UIBarButtonItem(customView: btnLeft)
        self.navigationItem.leftBarButtonItem = LeftBtn
        let btnRight: UIButton = UIButton()
        btnRight.setTitle(" \(Validation.kPostPlaceholder)", for: .normal)
        btnRight.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btnRight.addTarget(self, action: #selector(CreatePost), for: .touchUpInside)
        btnRight.setTitleColor(.gray, for: .normal)
        btnRight.frame = CGRect(x: 0, y: 0, width: 33/2, height: 30)
        let rightBtn = UIBarButtonItem(customView: btnRight)
        self.navigationItem.rightBarButtonItem = rightBtn
    }
    
   func addCustomNavigationBar(leftTitle :String, leftImage:String?, rightTitle:String, rightImage: String? = nil, rightSpacing:CGFloat? = 0, centerTitle:String, leftSpacing:CGFloat, leftButtonWidth:CGFloat){
           self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
           self.navigationController?.navigationBar.shadowImage = UIImage()
           self.navigationController?.navigationBar.isTranslucent = true
           self.navigationController?.view.backgroundColor = .clear
           self.navigationController?.isNavigationBarHidden = false
           let btnLeft: UIButton = UIButton()
           btnLeft.setTitle(" \(leftTitle)", for: .normal)
           btnLeft.setTitleColor(.black, for: .normal)
           if let leftimg = leftImage {
               btnLeft.setImage(UIImage(named: leftimg), for: .normal)
               btnLeft.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: leftSpacing);
               btnLeft.titleEdgeInsets = UIEdgeInsets(top: 0, left: leftSpacing, bottom: 0, right: 0);
           }
           btnLeft.addTarget(self, action: #selector(LeftButtonTapped), for: .touchUpInside)
           btnLeft.frame = CGRect(x: 0, y: 0, width: leftButtonWidth, height: 30)
           let LeftBtn = UIBarButtonItem(customView: btnLeft)
           self.navigationItem.leftBarButtonItem = LeftBtn
           let btnRight: UIButton = UIButton()
           btnRight.setTitle(" \(rightTitle)", for: .normal)
//           btnRight.titleLabel?.font = UIFont.systemFont(ofSize: 15)
           btnRight.addTarget(self, action: #selector(RightButtonTapped), for: .touchUpInside)
           btnRight.setTitleColor(.black, for: .normal)
           if let rightimg = rightImage {
               btnRight.setImage(UIImage(named: rightimg), for: .normal)
               btnRight.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: leftSpacing);
               btnRight.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: rightSpacing ?? 0);
           }
           btnRight.addTarget(self, action: #selector(RightButtonTapped), for: .touchUpInside)
           btnRight.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
           let rightBtn = UIBarButtonItem(customView: btnRight)
           self.navigationItem.rightBarButtonItem = rightBtn
           let label = UILabel()
           label.textColor = UIColor.black
           label.text = centerTitle
           self.navigationItem.titleView = label
       }
   
    func customChatNavBar(userImg :String?, leftImage:String?, leftTitle: String?, centerTitle:String, leftSpacing:CGFloat, leftButtonWidth:CGFloat){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                  self.navigationController?.navigationBar.shadowImage = UIImage()
                  self.navigationController?.navigationBar.isTranslucent = true
                  self.navigationController?.view.backgroundColor = .clear
                  self.navigationController?.isNavigationBarHidden = false
        
        // back btn
        let btnLeft: UIButton = UIButton()
        if let leftimg = leftImage {
            btnLeft.setImage(UIImage(named: leftimg), for: .normal)
        }
        btnLeft.addTarget(self, action: #selector(LeftButtonTapped), for: .touchUpInside)
        btnLeft.frame = CGRect(x: 0, y: 0, width: leftButtonWidth, height: 30)
        // user img
        let userImgLeft: UIButton = UIButton()
        if userImg != nil {
            userImgLeft.imageView?.imageFromServerURL(urlString: userImg ?? "") { (image) in
                userImgLeft.setImage(image, for: .normal)
            }
//            userImgLeft.setImage(UIImage(named: userImg ?? ""), for: .normal)
            userImgLeft.addTarget(self, action: #selector(UserImageTapped), for: .touchUpInside)
            userImgLeft.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            userImgLeft.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
            userImgLeft.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
            userImgLeft.layer.cornerRadius = 15.0
            userImgLeft.layer.masksToBounds = true
        }
        
        //user name
        let btnUsername: UIButton = UIButton()
        btnUsername.setTitle(leftTitle ?? "", for: .normal)
        btnUsername.setTitleColor(.black, for: .normal)
        btnUsername.frame = CGRect(x: 0, y: 0, width: leftButtonWidth, height: 30)
        
        let LeftBtn = UIBarButtonItem(customView: btnLeft)
        let userImage = UIBarButtonItem(customView: userImgLeft)
        let username = UIBarButtonItem(customView: btnUsername)
        self.navigationItem.leftBarButtonItems = [LeftBtn, userImage, username]
        
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = centerTitle
        self.navigationItem.titleView = label
    }
    
    
    func titleWithBackWithShadowNavBar(title: String) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.isNavigationBarHidden = false
        let btnLeft: UIButton = UIButton()
        btnLeft.setTitle(" \(title)", for: .normal)
        btnLeft.setTitleColor(.black, for: .normal)
        btnLeft.setImage(UIImage(named: "back"), for: .normal)
        btnLeft.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 40);
        btnLeft.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0);
        btnLeft.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        btnLeft.frame = CGRect(x: 0, y: 0, width: 140, height: 27/2)
        let LeftBtn = UIBarButtonItem(customView: btnLeft)
        self.navigationItem.leftBarButtonItem = LeftBtn
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.init(named: "Shadow")?.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.21
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
    }
    
    @objc func dismissKeyboardOnTouch() {
        view.endEditing(true)
    }
    
    @objc func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func CreatePost() {
        
    }
    @objc func DeletePost() {
        
    }
    
    @objc func LeftButtonTapped(){
        
    }
    
    @objc func RightButtonTapped(){
        
    }
    @objc func MidButtonTapped(){
        
    }
    
    @objc func UserImageTapped() {
        
    }
    
    @objc func searchUser() {
        // Search Users
        
    }
    
    @objc func filterMeetings() {
        
    }
    
    func customSearchNavBar(del : UISearchBarDelegate) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .white
        
        let btnLeftMenu: UIButton = UIButton()
        btnLeftMenu.setImage(UIImage(named: "back"), for: .normal)
        btnLeftMenu.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        btnLeftMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        self.navigationItem.leftBarButtonItem = barButton
        
        let searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        searchBar.sizeToFit()
        searchBar.delegate = del
        searchBar.placeholder = Validation.kSearchUserPlaceholder
        //searchBar.searchTextField.tintColor = .black
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = .black
            textfield.backgroundColor = .white
            textfield.roundCornerWithShadow(shadowColor: .clear, radius: 4, borderWidth: 1, borderColor: UIColor.init(named: "BorderColor") ?? .black, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0)
        }
        self.navigationItem.titleView = searchBar
        self.navigationItem.rightBarButtonItem = nil
    }
    
    func customSearchNavBarForJournals(del : UISearchBarDelegate) {
           showNavigationBar()
           self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
           self.navigationController?.navigationBar.shadowImage = UIImage()
           self.navigationController?.navigationBar.isTranslucent = true
           self.navigationController?.view.backgroundColor = .white
           self.navigationController?.navigationBar.tintColor = .white
           
           let btnLeftMenu: UIButton = UIButton()
           btnLeftMenu.setImage(UIImage(named: "back"), for: .normal)
           btnLeftMenu.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
           btnLeftMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
           let barButton = UIBarButtonItem(customView: btnLeftMenu)
           self.navigationItem.leftBarButtonItem = barButton
           
        let searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 130, height: 40))
           //searchBar.sizeToFit()
           searchBar.delegate = del
           searchBar.placeholder = Validation.kSearchPlaceholder
           //searchBar.searchTextField.tintColor = .black
           if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
               textfield.textColor = .black
               textfield.backgroundColor = .white
               textfield.roundCornerWithShadow(shadowColor: .clear, radius: 4, borderWidth: 1, borderColor: UIColor.init(named: "BorderColor") ?? .black, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0)
           }
        let vieww = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 130, height: 40))
        vieww.sizeToFit()
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 130, height: 40))
        btn.addTarget(self, action: #selector(MidButtonTapped), for: .touchUpInside)
        vieww.addSubview(searchBar)
        //vieww.backgroundColor = .blue
        vieww.addSubview(btn)
           self.navigationItem.titleView = vieww
           let btnRightMenu: UIButton = UIButton()
           btnRightMenu.setImage(UIImage(named: "AddJournal"), for: .normal)
           btnRightMenu.addTarget(self, action: #selector(RightButtonTapped), for: .touchUpInside)
           btnRightMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
           let rightbarButton = UIBarButtonItem(customView: btnRightMenu)
           self.navigationItem.rightBarButtonItem = rightbarButton
       }
       
    
    func popToViewController(storyboard:String,identifier:String) {
        let viewController = Utilities.getStoryBoard(name: storyboard).instantiateViewController(withIdentifier: identifier)
        if let vc = self.navigationController?.viewControllers{
            for c in vc{
                if(viewController.restorationIdentifier == c.restorationIdentifier){
                    self.navigationController?.popToViewController(c, animated: true)
                }
            }
        }
    }
    
    
    func addSlideMenuButton(){
        let btnShowMenu = UIButton(type: UIButton.ButtonType.system)
        btnShowMenu.setImage(#imageLiteral(resourceName: "menu"), for: .normal)
        btnShowMenu.tintColor = .white
        btnShowMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnShowMenu.addTarget(self, action: #selector(BaseViewController.onSlideMenuButtonPressed(_:)), for: UIControl.Event.touchUpInside)
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        self.navigationItem.leftBarButtonItem = customBarItem
    }
    
}

protocol SearchUserDelegate {
    func searchUser()
}
