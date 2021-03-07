//
//  EditProfilePrivacyViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 23/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

class EditProfilePrivacyViewController: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension EditProfilePrivacyViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileSwitchTableViewCell", for: indexPath) as! EditProfileSwitchTableViewCell
            cell.lblCellTitle.text = "Chat Enabled"
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileSwitchTableViewCell", for: indexPath) as! EditProfileSwitchTableViewCell
            cell.lblCellTitle.text = "Email you with our newsletter"
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileDropTableViewCell", for: indexPath) as! EditProfileDropTableViewCell
            cell.lblCellTitle.text = "Who can post on our wall"
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileDropTableViewCell", for: indexPath) as! EditProfileDropTableViewCell
            cell.lblCellTitle.text = "Who can see your birthdate"
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileDropTableViewCell", for: indexPath) as! EditProfileDropTableViewCell
            cell.lblCellTitle.text = "Who can see your relationship"
            return cell
            
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileDropTableViewCell", for: indexPath) as! EditProfileDropTableViewCell
            cell.lblCellTitle.text = "Who can see your basic info"
            return cell
            
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileDropTableViewCell", for: indexPath) as! EditProfileDropTableViewCell
            cell.lblCellTitle.text = "Who can see your work info"
            return cell
            
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileDropTableViewCell", for: indexPath) as! EditProfileDropTableViewCell
            cell.lblCellTitle.text = "Who can see your location info"
            return cell
            
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileDropTableViewCell", for: indexPath) as! EditProfileDropTableViewCell
            cell.lblCellTitle.text = "Who can see your education info"
            return cell
            
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileDropTableViewCell", for: indexPath) as! EditProfileDropTableViewCell
            cell.lblCellTitle.text = "Who can see your other info"
            return cell
            
        case 10:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileDropTableViewCell", for: indexPath) as! EditProfileDropTableViewCell
            cell.lblCellTitle.text = "Who can see your friends"
            return cell
            
        case 11:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileDropTableViewCell", for: indexPath) as! EditProfileDropTableViewCell
            cell.lblCellTitle.text = "Who can see your photos"
            return cell
            
        case 12:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileDropTableViewCell", for: indexPath) as! EditProfileDropTableViewCell
            cell.lblCellTitle.text = "Who can see your appreciate pages"
            return cell
            
        case 13:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileDropTableViewCell", for: indexPath) as! EditProfileDropTableViewCell
            cell.lblCellTitle.text = "Who can see your created events"
            return cell
            
        case 14:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileSubmitTableViewCell", for: indexPath) as! EditProfileSubmitTableViewCell
        
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
