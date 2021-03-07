//
//  TopicCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 16/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

protocol TopicCellDelegate {
    func reportAction(index:Int)
    func shareAction(index:Int)
    func reactAction(index:Int, sender:UIButton)
    func commentAction(index:Int)
    func sendCommentAction(index:Int)
    func expandImgAction(urlStr: String)
    func reactCountTapped(index:Int)
    func commentCountTapped(index:Int)
}

class TopicCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgVw: UIImageView!
    @IBOutlet weak var btnExpand: UIButton!
    @IBOutlet weak var btnReact: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var bottomBtnVw: UIView!
    @IBOutlet weak var commentVw: UIView!
    @IBOutlet weak var commentProfileImgVw: UIImageView!
    @IBOutlet weak var commentBox: UITextView!
    @IBOutlet weak var btnSendComment: UIButton!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var commentCountButton: UIButton!
    @IBOutlet weak var reactCountButton: UIButton!
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var commentTableViewHeightConstraint:NSLayoutConstraint!
    
    var comments = [Comment](){
        didSet{
            self.commentTableView.reloadData()
            self.layoutIfNeeded()
        }
    }
    
    var delegate: TopicCellDelegate?
    var imgUrl = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commentTableView.isScrollEnabled = false
//        self.commentBox.placeholder = "Say something..."
        self.commentVw.isHidden = true
        
        bgView.roundCornerWithShadow(shadowColor: UIColor.clear, radius: 10, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity: 0.3, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: false)
        imgVw.roundCornerWithShadow(shadowColor: UIColor.black, radius: imgVw.frame.width/2, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity: 1, shadowRadius: 4, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: true)
        if(imageView != nil){
            imgVw.roundCornerWithShadow(shadowColor: UIColor.clear, radius: 10, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity: 1, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: true)
        }
        
        commentProfileImgVw.roundCornerWithShadow(shadowColor: UIColor.black, radius: commentProfileImgVw.frame.width/2, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity: 1, shadowRadius: 4, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: true)
        
        commentBox.roundCornerWithShadow(shadowColor: UIColor.clear, radius: 5, borderWidth: 0.5, borderColor: UIColor.gray, shadowOpacity: 0.3, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: true)
        commentTableView.delegate = self
        commentTableView.dataSource = self
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.commentTableViewHeightConstraint.constant = self.commentTableView.contentSize.height 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func reactBtnTapped(_ sender: UIButton) {
        delegate?.reactAction(index: self.tag, sender:sender)
    }
    
    @IBAction func shareBtnTapped(_ sender: UIButton) {
        delegate?.shareAction(index: self.tag)
    }
    
    @IBAction func commentBtnTapped(_ sender: UIButton) {
        self.commentVw.isHidden = false
        delegate?.commentAction(index: self.tag)
    }
    
    @IBAction func sendCommentBtntTapped(_ sender: UIButton) {
        delegate?.sendCommentAction(index: self.tag)
    }
    
    @IBAction func expandImgBtnTapped(_ sender: UIButton) {
        delegate?.expandImgAction(urlStr: self.imgUrl)
    }
    
    @IBAction func reactCountTapped(_ sender: UIButton){
        self.delegate?.reactCountTapped(index: self.tag)
    }
    
    @IBAction func commentCountTapped(_ sender: UIButton){
        self.delegate?.commentCountTapped(index: self.tag)
    }
    
    
}

extension TopicCell{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.comments.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell") as! CommentTableViewCell
        let comment = comments[indexPath.row]
        cell.userNameLabel.text = "\(comment.user_firstname ?? "") \(comment.user_lastname ?? "")"
        cell.commentLabel.text = comment.comment ?? ""
        cell.userImg.imageFromServerURL(AppConstants.BASE_UPDATE_URL + (comment.user_picture ?? ""))
        return cell
    }
}

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        userImg.layer.cornerRadius = userImg.frame.height*0.5
        userImg.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
}
