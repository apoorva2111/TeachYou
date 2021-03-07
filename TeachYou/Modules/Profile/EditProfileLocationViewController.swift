//
//  EditProfileLocationViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 23/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

class EditProfileLocationViewController: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var locationVw: UIView!
    @IBOutlet weak var currentCityTF: UITextField!
    @IBOutlet weak var homeTownCityTF: UITextField!
    @IBOutlet weak var socialInformationVw: UIView!
    @IBOutlet weak var btnLocationSubmit: UIButton!
    @IBOutlet weak var twitterTF: UITextField!
    @IBOutlet weak var youtubeTF: UITextField!
    @IBOutlet weak var facebookTF: UITextField!
    @IBOutlet weak var linkedInTF: UITextField!
    @IBOutlet weak var instagramTF: UITextField!
    @IBOutlet weak var btnSocialSubmit: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func submitLocationBtnTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func submitSocialBtnTapped(_ sender: UIButton) {
        
    }
    
    
}
