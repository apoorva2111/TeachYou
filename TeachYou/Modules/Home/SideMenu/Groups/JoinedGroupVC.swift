
//
//  JoinedGroupVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 28/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class JoinedGroupVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var delegate: GroupDetailProtocol?
    var joinedGroups = [Groups]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getJoinedGroups()
    }
    
    func getJoinedGroups() {
        let parameters: [String: Any] = [
            "action"    : "getGroups",
            "user"      :  UserSessionManager.shared.getUserId() ?? "",
            "filter"    : ""
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                self.joinedGroups.removeAll()
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes: GroupsModel = try JSONDecoder().decode(GroupsModel.self, from: dataResponse)
                    for each in objRes.groups ?? [] {
                        self.joinedGroups.append(each)
                    }
                    self.collectionView.reloadData()
                } catch let error{
                    print(error)
                }
        }
        
    }
    
//    func getJoinedGroups() {
//        let parameters = "action=getGroups"
//        let postData =  parameters.data(using: .utf8)
//
//        var request = URLRequest(url: URL(string: AppConstants.BASE_URL)!,timeoutInterval: Double.infinity)
//        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        request.addValue("PHPSESSID=a3e25dbbf838ef3155b7e2439f37dae4", forHTTPHeaderField: "Cookie")
//
//        request.httpMethod = "POST"
//        request.httpBody = postData
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                print(String(describing: error))
//                return
//            }
//            print(String(data: data, encoding: .utf8)!)
//            do
//            {
//                let objRes: GroupsModel = try JSONDecoder().decode(GroupsModel.self, from: data)
//                for each in objRes.groups ?? [] {
//                    self.groupsModel.append(each)
//                }
//
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                }
//            } catch let error{
//                print(error)
//            }
//        }
//
//        task.resume()
//
//    }
    

}


extension JoinedGroupVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return joinedGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCollectionViewCell", for: indexPath) as! GroupCollectionViewCell
        cell.setCellData(data: self.joinedGroups[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView.frame.width - 20) / 2, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.showGroupDetails(group: joinedGroups[indexPath.item], isFromMyGroup: false)
    }
    
}
