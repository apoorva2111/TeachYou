//
//  GroupsVC.swift
//  TeachYou
//
//  Created by Sandeep on 21/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD

class GroupsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var groupsModel = [Groups]()
    
    var delegate: GroupDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getGroups()
    }
    
    func getGroups() {
        let parameters: [String: Any] = [
            "action"    : "getGroups",
            "user"      :  UserSessionManager.shared.getUserId() ?? ""
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                self.groupsModel.removeAll()
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes: GroupsModel = try JSONDecoder().decode(GroupsModel.self, from: dataResponse)
                    for each in objRes.groups ?? [] {
                        self.groupsModel.append(each)
                    }
                    self.collectionView.reloadData()
                } catch let error{
                    print(error)
                }
        }
        
    }
    
    func joinGroup(groupId: Int){
        KRProgressHUD.show()
        let paramaters: [String:Any] = ["action":"joinUnjoinGroup","user":UserSessionManager.shared.getUserId() ?? "","method":"join","group_id":"\(groupId)"]
        
        let url = AppConstants.BASE_URL
        
        AF.request(url, method: .post, parameters: paramaters).responseJSON { (response) in
            KRProgressHUD.dismiss()
            if let response = response.value as? NSDictionary {
                print("Response is: \(response)")
                if let status = response.value(forKey: "status") as? Bool, status {
                    print("Req success")
                    Utilities.showInformationAlert(title: AppConstants.kAppName, message: "Group Joined Successfully")
                }else{
                    print("Req failed")
                    Utilities.showInformationAlert(title: AppConstants.kAppName, message: "Request Failed!!")
                }
            }
            
        }
    }
    
}


extension GroupsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupsCollectionCell", for: indexPath) as! GroupsCollectionCell
        cell.setCellData(data: self.groupsModel[indexPath.item])
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView.frame.width - 20) / 2, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.showGroupDetails(group: groupsModel[indexPath.item], isFromMyGroup: false)
        
    }
    
}

extension GroupsVC: GroupsCollectionCellProtocol {
    func joinGroup(index: Int) {
        if let groupId = self.groupsModel[index].group_id {
            self.joinGroup(groupId: groupId)
        }
    }
    
    
}
