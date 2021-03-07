//
//  LatestTrendsVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 10/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class LatestTrendsVC: UIViewController, TransferImage {
    func sendImageToPreviousView(image: UIImage) {
        
    }
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    var cellHeight:CGFloat = 165.0
    var trendsModel = [LatestTrendsData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.rowHeight = UITableView.automaticDimension
//        self.tableView.estimatedRowHeight = 165
        getLatestTrends()
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: cellHeight, right: 0)
       
    }
    
    
    func getLatestTrends() {
        let parameters: [String: Any] = [
            "action" : "fetchTrendingNews",
            "action_name" : "trending_news"
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
                    let objRes: LatestTrendsModel = try JSONDecoder().decode(LatestTrendsModel.self, from: dataResponse)
                    self.trendsModel = objRes.data ?? []
//                    self.tableView.contentSize = CGSize(width: self.tableView.frame.size.width, height: CGFloat(self.trendsModel.count)*165.0)
                    self.tableView.reloadData()
                } catch let error{
                    print(error)
                }
        }
    }
    

    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}


extension LatestTrendsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LatestTrendCell", for: indexPath) as! LatestTrendCell
//        cell.setCellData(data: trendsModel[indexPath.row])
        let data = trendsModel[indexPath.row]
        cell.delegate = self
        cell.sIndex = indexPath.row
        cell.lblTitle.text = data.heading ?? ""
        cell.lblDescription.text = data.description ?? ""
        let urlStr = AppConstants.BASE_TRENDING_UPLOAD_URL + "/" + (data.image ?? "")
        print(urlStr)
        cell.imageUrlString = urlStr
        cell.imgVw.imageFromServerURL(urlString: urlStr) { (image) in }
        cell.trendId = data.what_id ?? 0
        cell.trendTitle = data.heading ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
}


extension LatestTrendsVC: LatestTrendCellDelegate {
   
    func viewMoreAction(id: Int, title: String, index: Int) {
        let vc = Utilities.viewConrollerObject(identifier: ViewControllerConstants.kLatestTrendDetailsVC, storyboard: StoryBoardConstants.kMainStoryBoard) as! LatestTrendDetailsVC
        vc.trendId = id
        vc.trendTitle = title
        vc.trendDetails = trendsModel[index]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func expandImgAction(urlStr: String) {
        let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kImagePreviewViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! ImagePreviewViewController
        vc.imgStr = urlStr
        vc.transferDatadelegate = self
        present(vc, animated: true, completion: nil)
    }
  
}
