//
//  SignUpVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 01/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class SignUpVC: UIViewController {

    // MARK: -  @IBOutlets
    @IBOutlet var loginBgVw: UIView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var buttonBackToLogin: UIButton!
    @IBOutlet weak var buttonAcceptTNC: UIButton!
    
    
    //MARK:- Variables
    var termsAndConditionsAccepted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: -  @IBAction
    
    @IBAction func acceptTNC(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.termsAndConditionsAccepted = sender.isSelected
        print(sender.isSelected)
    }
    
    @IBAction func backToLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    fileprivate func signUpAction() {
        let parameters: [String: Any] = [
            "action" : "registerUser",
            "email" : emailTF.text ?? "",
            "password" : passwordTF.text ?? "",
            "first_name" : firstNameTF.text ?? "",
            "last_name" : lastNameTF.text ?? ""
        ]
        let urlString = "https://teachyou.in/androidApi.php"
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters).responseJSON {
            response in
            
            if let result = response.value as? [String:Any] {
                
                if let status = result["status"] as? Int {
                    if status == 1 {
                        AppDelegate.getAppDelegate().navigateToVC()
                    }
                }
                
            }
        }
    }
    
    @IBAction func signup(_ sender: Any) {
        
        if firstNameTF.text == "" || firstNameTF.text == " " {
            Utilities.showInformationAlert(title: AppConstants.kAppName, message: "Please enter first name")
        } else if lastNameTF.text == "" || lastNameTF.text == " " {
            Utilities.showInformationAlert(title: AppConstants.kAppName, message: "Please enter last name")
        } else if emailTF.text == "" || emailTF.text == " " {
            Utilities.showInformationAlert(title: AppConstants.kAppName, message: "Please enter email")
        } else if passwordTF.text == "" || passwordTF.text == " " {
            Utilities.showInformationAlert(title: AppConstants.kAppName, message: "Please enter password")
        } else if self.termsAndConditionsAccepted == false {
            Utilities.showInformationAlert(title: AppConstants.kAppName, message: "Please accept the terms and conditions")
        } else {
            signUpAction()
        }
    }
}
