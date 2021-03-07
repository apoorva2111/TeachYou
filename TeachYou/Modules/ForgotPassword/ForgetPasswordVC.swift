//
//  ForgetPasswordVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 01/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class ForgetPasswordVC: UIViewController {
    
    // MARK: -  @IBOutlets
    @IBOutlet var loginBgVw: UIView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var buttonBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    // MARK: -  @IBAction
    
    fileprivate func forgetPasswordAction() {
        let parameters: [String: Any] = [
            "action" : "forgetPassword",
            "email" : emailTF.text ?? ""
        ]
        let urlString = "https://teachyou.in/androidApi.php"
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters).responseJSON {
            response in
            
            if let result = response.value as? [String:Any] {
                
                if let status = result["status"] as? Int {
                    if status == 1 {
                        let msg = result["status"] as? String
                        Utilities.showInformationAlert(title: AppConstants.kAppName, message: msg ?? "")
                    }
                }
                
            }
            
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        if emailTF.text == "" || emailTF.text == " " {
            Utilities.showInformationAlert(title: AppConstants.kAppName, message: "Please enter email")
        } else {
            forgetPasswordAction()
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
