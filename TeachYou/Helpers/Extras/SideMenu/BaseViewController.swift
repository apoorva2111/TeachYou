//
//  BaseViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Ashish on 21/09/15.
//  Copyright (c) 2015 Kode. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class BaseViewController: UIViewController, SlideMenuDelegate {
    
    var selectedSection: Int32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initialSetUpForNotifications() {
        
        //        let obj = storyboard?.instantiateViewController(withIdentifier: "NotificationsViewController") as! NotificationsViewController
        //        obj.getNotifications()
        
    }
    
    func slideMenuItemSelectedAtIndex(_ index: Int32, _ section: Int32) {
        let topViewController : UIViewController = self.navigationController!.topViewController!
        print("View Controller is : \(topViewController) \n", terminator: "")
        self.selectedSection = section
        
        switch(index) {
        case 0:
            self.openViewControllerBasedOnIdentifier("HomeVC")
        case 1:
            self.openViewControllerBasedOnIdentifier("HomeVC")
        case 2:
            self.openViewControllerBasedOnIdentifier("HomeVC")
        case 3:
            self.openViewControllerBasedOnIdentifier("HomeVC")
        case 4:
            self.openViewControllerBasedOnIdentifier("HomeVC")
        case 5:
            self.openViewControllerBasedOnIdentifier("HomeVC")
        case 6:
            self.openViewControllerBasedOnIdentifier("HomeVC")
        case 7:
            self.openViewControllerBasedOnIdentifier("HomeVC")
        case 8:
            self.openViewControllerBasedOnIdentifier("HomeVC")
        case 9:
            self.openViewControllerBasedOnIdentifier("HomeVC")
        case 10:
            self.openViewControllerBasedOnIdentifier("HomeVC")
        case 11:
            self.openViewControllerBasedOnIdentifier("HomeVC")
        default :
            self.openViewControllerBasedOnIdentifier("HomeVC")
        }
    }
    
    func openViewControllerBasedOnIdentifier(_ strIdentifier:String){
        let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: strIdentifier)
        let topViewController : UIViewController = self.navigationController!.topViewController!
        if (topViewController.restorationIdentifier! == destViewController.restorationIdentifier!){
            print("Same VC")
        } else {
            self.navigationController!.pushViewController(destViewController, animated: true)
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
    
    func setnavigationBarTitle(title: String) {
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.view.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.4784313725, blue: 0.6705882353, alpha: 1)
        self.navigationController?.isNavigationBarHidden = false
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = title
        self.navigationItem.titleView = label
    }

    func defaultMenuImage() -> UIImage {
        var defaultMenuImage = UIImage()
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 22), false, 0.0)
        
        UIColor.black.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 3, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 10, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 17, width: 30, height: 1)).fill()
        
        UIColor.white.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 4, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 11,  width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 18, width: 30, height: 1)).fill()
        
        defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
       
        return defaultMenuImage;
    }
    
    @objc func onSlideMenuButtonPressed(_ sender : UIButton){
        if (sender.tag == 10)
        {
            // To Hide Menu If it already there
            self.slideMenuItemSelectedAtIndex(-1, self.selectedSection);
            
            sender.tag = 0;
            
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
                }, completion: { (finished) -> Void in
                    viewMenuBack.removeFromSuperview()
            })
            
            return
        }
        
        sender.isEnabled = false
        sender.tag = 10
        
        let menuVC : MenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuVC.btnMenu = sender
        menuVC.delegate = self
        self.view.addSubview(menuVC.view)
        self.addChild(menuVC)
        menuVC.view.layoutIfNeeded()
        
        
        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            sender.isEnabled = true
            }, completion:nil)
    }
    
}
