//
//  LoginVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 01/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {

    // MARK: -  @IBOutlets
    @IBOutlet var loginBgVw: UIView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonForgotPassword: UIButton!
    @IBOutlet weak var buttonSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        self.loginBgVw.roundCornerWithShadow(shadowColor: .clear, radius: 20, borderWidth: 1, borderColor: .black, shadowOpacity: 0 , shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
    }
    
    
    
    // MARK: -  @IBAction
    
    @IBAction func forgotPassword(_ sender: UIButton) {
        
    }
    
    fileprivate func loginAction() {
        let parameters: [String: Any] = [
            "action" : "checkAuth",
            "email" : emailTF.text ?? "",
            "password" : passwordTF.text ?? "",
        ]
        let urlString = "https://teachyou.in/androidApi.php"
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters).responseJSON {
            response in
            
            if let result = response.value as? [String:Any] {
                
                if let status = result["status"] as? Int {
                    if status == 1 {
                        let user = result["user"] as! [String: Any]
                        let userId = "\(String(describing: user["id"] ?? ""))"
                        let username = "\(String(describing: user["name"] ?? ""))"
                        UserSessionManager.shared.setIsLogin(value: true)
                        UserSessionManager.shared.setName(value: username)
                        UserSessionManager.shared.setUserId(value: userId)
                        AppDelegate.getAppDelegate().navigateToVC()
                    }
                }
                
            }
            
        }
    }
    
    @IBAction func login(_ sender: Any) {
        
        if emailTF.text == "" || emailTF.text == " " {
            Utilities.showInformationAlert(title: AppConstants.kAppName, message: "Please enter email")
        } else if passwordTF.text == "" || passwordTF.text == " " {
            Utilities.showInformationAlert(title: AppConstants.kAppName, message: "Please enter password")
        } else {
            loginAction()
        }
    }
    
    @IBAction func signup(_ sender: Any) {
    }
    

}
