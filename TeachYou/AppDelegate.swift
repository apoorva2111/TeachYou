//
//  AppDelegate.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 30/11/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?
    var navigationController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if UserSessionManager.shared.getIsLogin() ?? false {
            navigateToVC()
        } else {
            navigateToLoginVC()
        }
        IQKeyboardManager.shared.enable = true

        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
           // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
           // Saves changes in the application's managed object context before the application terminates.
           }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        application.applicationIconBadgeNumber = 0
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    // MARK: - Appdelegate Object
    
    class func getAppDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

}

extension AppDelegate {
    
    func navigateToVC()
    {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        var vc : UIViewController?

        vc = Utilities.viewConrollerObject(identifier: ViewControllerConstants.kHomeVC , storyboard: StoryBoardConstants.kMainStoryBoard) as! HomeViewController

        navigationController = UINavigationController(rootViewController: vc!)
        navigationController.navigationBar.isHidden = true
        navigationController.interactivePopGestureRecognizer?.isEnabled = true
        #if compiler(>=5.1)
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            window?.overrideUserInterfaceStyle = .light
        }
        #endif
        self.window?.isHidden = false
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
    
    
    func navigateToLoginVC()
    {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        var vc : UIViewController?
        
        vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kLoginViewController , storyboard: StoryBoardConstants.kLoginViewController) as! LoginVC
    
        navigationController = UINavigationController(rootViewController: vc!)
        navigationController.navigationBar.isHidden = true
        navigationController.interactivePopGestureRecognizer?.isEnabled = true
        #if compiler(>=5.1)
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            window?.overrideUserInterfaceStyle = .light
        }
        #endif
        self.window?.isHidden = false
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
    
}
