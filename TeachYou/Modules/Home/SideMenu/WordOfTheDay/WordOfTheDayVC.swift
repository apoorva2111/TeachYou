//
//  WordOfTheDayVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 10/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class WordOfTheDayVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var wordModel = [WordData]()
 
    override func viewDidLoad() {
        super.viewDidLoad()

        getWords()
    }
    
    func getWords() {
        let parameters: [String: Any] = [
            "action" : "wordOfTheDay",
            "action_name" : "word_of_the_day",
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
                    let objRes: WordOfTheDayModel = try JSONDecoder().decode(WordOfTheDayModel.self, from: dataResponse)
                    for each in objRes.data ?? [] {
                        self.wordModel.append(each)
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

extension WordOfTheDayVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.wordModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell", for: indexPath) as! WordCell
        cell.lblWord.text = self.wordModel[indexPath.row].heading ?? ""
        cell.lblMeaning.text = self.wordModel[indexPath.row].day ?? ""
        cell.bgVw.roundCornerWithShadow(shadowColor: .lightGray, radius: 5, borderWidth: 0, borderColor: .clear, shadowOpacity: 1, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}


class WordCell: UITableViewCell {
    
    @IBOutlet weak var lblWord: UILabel!
    @IBOutlet weak var lblMeaning: UILabel!
    @IBOutlet weak var bgVw: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
