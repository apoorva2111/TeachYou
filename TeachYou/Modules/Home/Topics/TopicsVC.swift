//
//  TopicsVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 01/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit
import Alamofire

class TopicsVC: UIViewController, TopicCellDelegate, TransferImage {
    
    var tapGesture = UITapGestureRecognizer()
    var tap2Gesture = UITapGestureRecognizer()
    var reactions = [Reaction](){
        didSet{
            self.reactionTableView.reloadData()
            let reactionTableHeight = CGFloat(reactions.count)*50 + 37
            if reactionTableHeight > UIScreen.main.bounds.height*0.7{
                self.reactionTableViewHeightConstrain.constant = UIScreen.main.bounds.height*0.7
                self.reactionTableView.isScrollEnabled = true
            }else{
                self.reactionTableViewHeightConstrain.constant = reactionTableHeight
                self.reactionTableView.isScrollEnabled = false
            }
            self.reactionView.layoutIfNeeded()
        }
    }
    
    var comments = [Comment]()
    
    lazy var ratingBackView: UIView = {
       let dullView = UIView()
        dullView.frame = .zero
        dullView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        dullView.isUserInteractionEnabled = true
        dullView.translatesAutoresizingMaskIntoConstraints = false
        return dullView
    }()
    
    lazy var star1Button: UIButton = {
        let starButton = UIButton()
        starButton.setImage(UIImage(systemName: "star"), for: .normal)
        starButton.frame = .zero
        starButton.tintColor = .lightGray
        starButton.addTarget(self, action: #selector(reactStar1Tapped(_:)), for: .touchUpInside)
        return starButton
    }()
    
    lazy var star2Button: UIButton = {
        let starButton = UIButton()
        starButton.setImage(UIImage(systemName: "star"), for: .normal)
        starButton.frame = .zero
        starButton.tintColor = .lightGray
        starButton.addTarget(self, action: #selector(reactStar2Tapped(_:)), for: .touchUpInside)
        return starButton
    }()
    
    lazy var star3Button: UIButton = {
        let starButton = UIButton()
        starButton.setImage(UIImage(systemName: "star"), for: .normal)
        starButton.frame = .zero
        starButton.tintColor = .lightGray
        starButton.addTarget(self, action: #selector(reactStar3Tapped(_:)), for: .touchUpInside)
        return starButton
    }()
    
    lazy var ratingStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10.0
        return stackView
    }()
    
    lazy var ratingView: UIView = {
        let rateview = UIView()
        rateview.translatesAutoresizingMaskIntoConstraints = false
        rateview.frame = .zero
        rateview.layoutIfNeeded()
        rateview.backgroundColor = .white
        return rateview
    }()
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var reactionTableView: UITableView!
    @IBOutlet weak var reactionView: UIView!
    @IBOutlet weak var reactionTableViewHeightConstrain: NSLayoutConstraint!
    
    var action = "fetchDebate"
    var topicsModel = [Debates]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reactionView.isHidden = true
        self.reactionView.isUserInteractionEnabled = true
        tableView.delegate = self
        tableView.dataSource = self
        reactionTableView.delegate = self
        reactionTableView.dataSource = self
        getTopics()
        tap2Gesture.addTarget(self, action: #selector(hideReactionsView))
        self.reactionView.addGestureRecognizer(tap2Gesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
//        getTopics()
    }
    
    func getTopics() {
        let parameters = "action=fetchDebate"
        let postData =  parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: AppConstants.BASE_URL)!,timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("PHPSESSID=a3e25dbbf838ef3155b7e2439f37dae4", forHTTPHeaderField: "Cookie")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            do
            {
                let objRes: TopicModel = try JSONDecoder().decode(TopicModel.self, from: data)
                self.topicsModel = [Debates]()
                for var each in objRes.debates ?? [] {
                    let isLiked = each.reactions?.contains(where: { (reaction) -> Bool in
                        let userId = UserSessionManager.shared.getUserId() ?? ""
                        return reaction.user_id == Int(userId)
                    })
                    each.i_react = isLiked
                    self.topicsModel.append(each)
                    print(isLiked?.description as Any)
                }
                
                DispatchQueue.main.async {
                     self.tableView.reloadData()
                }
            } catch let error{
                print(error)
            }
        }

        task.resume()

    }

    
    func reactAction(index:Int, sender:UIButton) {
        if var reactions = self.topicsModel[index].reactions, reactions.count > 0{
            reactions = reactions.filter { (reaction) -> Bool in
                let userId = UserSessionManager.shared.getUserId() ?? ""
                return reaction.user_id == Int(userId)
                
            }
            if reactions.count > 0{
                self.topicsModel[self.ratingView.tag].i_react == false ? (self.topicsModel[self.ratingView.tag ].i_react = true) : (self.topicsModel[self.ratingView.tag].i_react = false)
                self.reactUnreactDebate(quoteId: "\(self.topicsModel[self.ratingView.tag].q_id ?? 0)", rate: 1, btnReact: sender)
                return
            }
        }
        self.ratingView.tag = index
        self.tapGesture.addTarget(self, action: #selector(ratingBackViewTapped(_:)))
        self.ratingBackView.addGestureRecognizer(self.tapGesture)
        self.view.addSubview(ratingBackView)
        ratingBackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        ratingBackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        ratingBackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        ratingBackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        self.ratingBackView.addSubview(self.ratingView)
        ratingView.centerXAnchor.constraint(equalTo: self.ratingBackView.centerXAnchor, constant: 0).isActive = true
        ratingView.centerYAnchor.constraint(equalTo: self.ratingBackView.centerYAnchor, constant: 0).isActive = true
        ratingView.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        ratingView.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        ratingView.addSubview(ratingStackView)
        ratingStackView.topAnchor.constraint(equalTo: ratingView.topAnchor, constant: 15).isActive = true
        ratingStackView.bottomAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: -15).isActive = true
        ratingStackView.trailingAnchor.constraint(equalTo: ratingView.trailingAnchor, constant: -20).isActive = true
        ratingStackView.leadingAnchor.constraint(equalTo: ratingView.leadingAnchor, constant: 20).isActive = true
        ratingStackView.addArrangedSubview(self.star1Button)
        ratingStackView.addArrangedSubview(self.star2Button)
        ratingStackView.addArrangedSubview(self.star3Button)
        
    }
    
    @objc
    func ratingBackViewTapped(_ gesture: UITapGestureRecognizer){
        self.removeRatingView()
    }
    
    func removeRatingView(){
        self.ratingBackView.removeFromSuperview()
        self.ratingView.removeFromSuperview()
    }
    
    @objc
    func reactStar1Tapped(_ sender: UIButton){
        self.topicsModel[self.ratingView.tag].i_react == false ? (self.topicsModel[self.ratingView.tag ].i_react = true) : (self.topicsModel[self.ratingView.tag].i_react = false)
        self.reactUnreactDebate(quoteId: "\(self.topicsModel[self.ratingView.tag].q_id ?? 0)", rate: 1, btnReact: sender)
        self.removeRatingView()
    }
    
    @objc
    func reactStar2Tapped(_ sender: UIButton){
        self.topicsModel[self.ratingView.tag].i_react == false ? (self.topicsModel[self.ratingView.tag].i_react = true) : (self.topicsModel[self.ratingView.tag].i_react = false)
        self.reactUnreactDebate(quoteId: "\(self.topicsModel[self.ratingView.tag].q_id ?? 0)", rate: 2, btnReact: sender)
        self.removeRatingView()
    }
    
    @objc
    func reactStar3Tapped(_ sender: UIButton){
        self.topicsModel[self.ratingView.tag].i_react == false ? (self.topicsModel[self.ratingView.tag ].i_react = true) : (self.topicsModel[self.ratingView.tag].i_react = false)
        self.reactUnreactDebate(quoteId: "\(self.topicsModel[self.ratingView.tag].q_id ?? 0)", rate: 3, btnReact: sender)
        self.removeRatingView()
    }
    
    
    
    func reportAction(index: Int) {
        
    }
    
    func shareAction(index: Int) {
        
    }
    
    func commentAction(index: Int) {
        
    }
    func commentCountTapped(index: Int) {
        guard let cell = self.tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? TopicCell else{return}
        
        if self.topicsModel[index].comments?.count ?? 0 > 0{
            cell.commentTableView.isHidden == false ? (cell.commentTableView.isHidden = true) : (cell.commentTableView.isHidden = false)
            self.tableView.reloadData()
//            self.tableView.beginUpdates()
//            self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
//            self.tableView.endUpdates()
        }
    }
    
    func reactCountTapped(index: Int) {
        if let reactions = self.topicsModel[index].reactions, reactions.count > 0{
            self.reactions = reactions
            self.reactionView.isHidden = false
        }
    }
    
    @objc
    func hideReactionsView(){
        self.reactionView.isHidden = true
    }
    
    func sendCommentAction(index: Int) {
        guard let cell = self.tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? TopicCell else{return}
        let comment = cell.commentBox.text ?? ""
        cell.commentBox.text = ""
        
//        cell.commentBox.placeholder = "Say something..."
        if comment.trimmingCharacters(in: .whitespaces) != ""{
            let quoteId = self.topicsModel[index].q_id ?? 0
            self.postDebateComment(comment: comment, quoteId: quoteId)
        }
        
    }
    
    func postDebateComment(comment: String, quoteId: Int) {
        let parameters: [String: Any] = [
            "action" : "postDebateComment",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "comment": comment,
            "q_id": "\(quoteId)"
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                    self.getTopics()
                } catch let error{
                    print(error)
                }
            }
    }
   
    func sendImageToPreviousView(image: UIImage) {
        
    }
    
    func expandImgAction(urlStr: String) {
        let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kImagePreviewViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! ImagePreviewViewController
        vc.imgStr = urlStr
        vc.transferDatadelegate = self
        present(vc, animated: true, completion: nil)
    }
    
    func reactUnreactDebate(quoteId: String, rate: Int, btnReact:UIButton) {
        let parameters: [String: Any] = [
            "action" : "reactUnreactDebate",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "quote_id": quoteId,
            "rate": "\(rate)",
            "react_type":"react"
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                print(response)
                
                
                
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                do
                {
                    let objRes = try JSONSerialization.jsonObject(with: dataResponse) as? [String: AnyObject]
                    print(objRes?["status"] ?? "")
                    
                    if rate == 1{
                        btnReact.setImage(UIImage(systemName: "star.fill"), for: .normal)
                    }else{
                        btnReact.setImage(UIImage(systemName: "star"), for: .normal)
                    }
                    self.getTopics()
                    self.tableView.reloadData()
                    
                } catch let error{
                    print(error)
                }
            }
    }
    
    
}

extension TopicsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.reactionTableView{
            return reactions.count
        }else{
            return topicsModel.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.reactionTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TapicsReactionTableViewCell") as! TapicsReactionTableViewCell
            let reaction = self.reactions[indexPath.row]
            cell.userNameLabel.text = "\(reaction.user_firstname ?? "") \(reaction.user_lastname ?? "")"
            cell.star1ImageView.isHidden = false
            let rate = reaction.rate ?? 1
            if rate == 2{
                cell.star2ImageView.isHidden = false
                cell.star3ImageView.isHidden = true
            }else if rate == 3 {
                cell.star2ImageView.isHidden = false
                cell.star3ImageView.isHidden = false
            }else{
                cell.star2ImageView.isHidden = true
                cell.star3ImageView.isHidden = true
            }
            cell.userImageView.imageFromServerURL(AppConstants.BASE_UPDATE_URL + (reaction.user_picture ?? ""))
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicCell
        cell.lblHeading.text = self.topicsModel[indexPath.row].heading
        cell.lblDescription.text = self.topicsModel[indexPath.row].quotes
        cell.commentVw.isHidden = false
        cell.delegate = self
        cell.tag = indexPath.row
        
        if let commentCount = self.topicsModel[indexPath.row].comments_count, commentCount > 0{
            cell.commentCountButton.setTitle(" \(commentCount)", for: .normal)
        }else{
            cell.commentCountButton.setTitle("", for: .normal)
        }
        if let reaction = self.topicsModel[indexPath.row].reactions, reaction.count > 0{
            cell.reactCountButton.setTitle(" \(reaction.count)", for: .normal)
            if self.topicsModel[indexPath.row].i_react ?? false{
                cell.btnReact.setImage(UIImage(systemName: "star.fill"), for: .normal)
            }else{
                cell.btnReact.setImage(UIImage(systemName: "star"), for: .normal)
            }
        }else{
            cell.reactCountButton.setTitle("", for: .normal)
            cell.btnReact.setImage(UIImage(systemName: "star"), for: .normal)
        }
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = AppConstants.BASE_TOPIC_UPLOAD_URL
        urlComponent.path = self.topicsModel[indexPath.row].image ?? ""
        let urlStr = AppConstants.BASE_TOPIC_UPLOAD_URL + "/" + (self.topicsModel[indexPath.row].image ?? "")
        cell.imgUrl = urlStr
        cell.imgVw.imageFromServerURL(urlString: urlStr ) { (image) in
            cell.imgVw.image = cell.imgVw.image?.crop(to: cell.imgVw.frame.size)
        }
        
//        cell.imgVw.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "userPlaceholder"))
        cell.comments = self.topicsModel[indexPath.row].comments ?? [Comment]()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.reactionTableView{
            return 50
        }
        return UITableView.automaticDimension
    }
    
    
}
