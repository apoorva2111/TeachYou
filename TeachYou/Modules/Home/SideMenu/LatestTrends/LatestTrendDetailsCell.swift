//
//  LatestTrendDetailsCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 30/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

protocol LatestTrendDetailsCelllDelegate {
    func reportAction()
    func shareAction()
    func reactAction()
    func commentAction()
    func sendCommentAction()
    func expandImgAction(urlStr: String)
}


class LatestTrendDetailsCell: UITableViewCell {

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
    
    
    var delegate: LatestTrendDetailsCelllDelegate?
    var imgUrl = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.roundCornerWithShadow(shadowColor: UIColor.clear, radius: 10, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity: 0.3, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: false)
        imgVw.roundCornerWithShadow(shadowColor: UIColor.black, radius: imgVw.frame.width/2, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity: 1, shadowRadius: 4, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: true)
        if(imageView != nil){
            imgVw.roundCornerWithShadow(shadowColor: UIColor.clear, radius: 10, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity: 1, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: true)
        }
        
        commentProfileImgVw.roundCornerWithShadow(shadowColor: UIColor.black, radius: commentProfileImgVw.frame.width/2, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity: 1, shadowRadius: 4, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: true)
        
        commentBox.roundCornerWithShadow(shadowColor: UIColor.clear, radius: 5, borderWidth: 0.5, borderColor: UIColor.gray, shadowOpacity: 0.3, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: true)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func reactBtnTapped(_ sender: UIButton) {
        delegate?.reactAction()
    }
    
    @IBAction func shareBtnTapped(_ sender: UIButton) {
        delegate?.shareAction()
    }
    
    @IBAction func commentBtnTapped(_ sender: UIButton) {
        self.commentVw.isHidden = false
        delegate?.commentAction()
    }
    
    @IBAction func sendCommentBtntTapped(_ sender: UIButton) {
        delegate?.sendCommentAction()
    }
    
    @IBAction func expandImgBtnTapped(_ sender: UIButton) {
        delegate?.expandImgAction(urlStr: self.imgUrl)
    }
    

}
