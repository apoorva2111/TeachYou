//
//  EditProfileViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 23/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var btnEditProfileImg: UIButton!
    @IBOutlet weak var firstnameTF: UITextField!
    @IBOutlet weak var lastnameTF: UITextField!
    @IBOutlet weak var mobileNumberTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var relationshipStatusTF: UITextField!
    @IBOutlet weak var birthdateTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func submitTapped(_ sender: UIButton) {
        
    }
    
    
}

extension EditProfileViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileTopTableViewCell", for: indexPath) as! EditProfileTopTableViewCell
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileLocationTableViewCell", for: indexPath) as! EditProfileLocationTableViewCell
            cell.lblLocationHeader.text = "Location Settings"
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileSecurityTableViewCell", for: indexPath) as! EditProfileSecurityTableViewCell
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileLocationTableViewCell", for: indexPath) as! EditProfileLocationTableViewCell
            cell.lblLocationHeader.text = "Privacy"
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileNotificationsTableViewCell", for: indexPath) as! EditProfileNotificationsTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileLocationTableViewCell", for: indexPath) as! EditProfileLocationTableViewCell
            cell.lblLocationHeader.text = "Delete Account"
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
           return 560
        } else if indexPath.row == 2 {
            return 300
        } else if indexPath.row == 4 {
            return 200
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let vc = Utilities.viewConrollerObject(identifier: "EditProfileLocationViewController", storyboard: StoryBoardConstants.kProfileStoryBoard) as! EditProfileLocationViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 3 {
            let vc = Utilities.viewConrollerObject(identifier: "EditProfilePrivacyViewController", storyboard: StoryBoardConstants.kProfileStoryBoard) as! EditProfilePrivacyViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
