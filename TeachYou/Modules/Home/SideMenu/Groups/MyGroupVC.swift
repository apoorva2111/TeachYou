//
//  MyGroupVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 28/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class MyGroupVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var delegate: GroupDetailProtocol?
    var myGroupsModel = [Groups]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMyGroups()
    }
    
    func getMyGroups() {
        let parameters: [String: Any] = [
            "action"    : "getGroups",
            "user"      :  UserSessionManager.shared.getUserId() ?? "",
            "filter"    : "manage"
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                self.myGroupsModel.removeAll()
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes: GroupsModel = try JSONDecoder().decode(GroupsModel.self, from: dataResponse)
                    for each in objRes.groups ?? [] {
                        self.myGroupsModel.append(each)
                    }
                    self.collectionView.reloadData()
                } catch let error{
                    print(error)
                }
        }
        
    }
    

}

extension MyGroupVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myGroupsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCollectionViewCell", for: indexPath) as! GroupCollectionViewCell
        cell.setCellData(data: self.myGroupsModel[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView.frame.width - 20) / 2, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.showGroupDetails(group: myGroupsModel[indexPath.item], isFromMyGroup: true)
    }
    
}
