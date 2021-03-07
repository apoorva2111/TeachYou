//
//  AppreciatePagesViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 13/01/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class AppreciatePagesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cellCount = 5
    var isStudy = false
    var isGoing = false
    var isInterested = false
    var myEvents = false
    var createEvent = false
    var pagesModel = [PagesDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getApppeciatePages()
    }
    
    func getApppeciatePages() {
        
        let parameters  : [String: Any] = [
            "action"    : "getPages",
            "user"      : UserSessionManager.shared.getUserId() ?? "",
            "filter"    : "like_page"
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes: PagesModel = try JSONDecoder().decode(PagesModel.self, from: dataResponse)
                    for each in objRes.pages ?? [] {
                        self.pagesModel.append(each)
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let error {
                    print(error)
                }
        }
    }
    
    
}


extension AppreciatePagesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pagesModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PagesTableViewCell", for: indexPath) as! PagesTableViewCell
        
        cell.userName.text = self.pagesModel[indexPath.row].page_title ?? ""
        cell.userImgVw.imageFromServerURL(urlString: self.pagesModel[indexPath.row].page_picture ?? "") { (image) in }
        cell.lblAppreciations.text = "\(self.pagesModel[indexPath.row].page_likes ?? 0) Appreciate"
        cell.bgView.roundCornerWithShadow(shadowColor: .gray, radius: 5, borderWidth: 0, borderColor: .clear, shadowOpacity: 1, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension AppreciatePagesViewController: PagesCellDelegate {
    
    func appreciateBtnAction() {
        print("Interested btn Tapped")
    }
    
}

