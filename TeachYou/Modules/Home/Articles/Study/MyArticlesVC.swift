//
//  MyArticlesVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 15/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class MyArticlesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var articlesModel = [Posts]()
    var filter = "articles"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMyArticles()
    }
    
    func getMyArticles() {
        let parameters: [String: Any] = [
            "action" : "getMyArticles",
            "user" : UserSessionManager.shared.getUserId() ?? ""
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
                    let objRes: FeedModel = try JSONDecoder().decode(FeedModel.self, from: dataResponse)
                    for each in objRes.posts ?? [] {
                        self.articlesModel.append(each)
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let error{
                    print(error)
                }
        }
    }
    
}

extension MyArticlesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articlesModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        cell.imgView.imageFromServerURL(urlString: self.articlesModel[indexPath.row].og_image ?? "") { (image) in
            cell.imgView.image = cell.imgView.image?.crop(to: cell.imgView.frame.size)
        }
        cell.lblTitle.text = self.articlesModel[indexPath.row].og_title
        cell.lblTag.text = self.articlesModel[indexPath.row].post_author_name
        cell.bgView.roundCornerWithShadow(shadowColor: .lightGray, radius: 10, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Utilities.viewConrollerObject(identifier: "ArticleDetailsVC", storyboard: StoryBoardConstants.kMainStoryBoard) as! ArticleDetailsVC
//        vc.articleDetails = self.articlesModel[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
