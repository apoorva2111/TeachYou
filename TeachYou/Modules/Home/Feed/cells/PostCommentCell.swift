//
//  PostCommentCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 03/01/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

protocol PostCommentCellDelegate {
    func sendCommentAction(index: Int)
}

class PostCommentCell: UITableViewCell {

     @IBOutlet weak var commentProfileImgVw: UIImageView!
     @IBOutlet weak var commentBox: UITextView!
     @IBOutlet weak var btnSendComment: UIButton!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblCommentText: UILabel!
    @IBOutlet weak var lblTimeAgo: UILabel!
    
    
    var delegate: PostCommentCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commentProfileImgVw.roundCornerWithShadow(shadowColor: UIColor.black, radius: commentProfileImgVw.frame.width/2, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity: 1, shadowRadius: 4, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: true)
        
        commentBox.roundCornerWithShadow(shadowColor: UIColor.clear, radius: 5, borderWidth: 0.5, borderColor: UIColor.gray, shadowOpacity: 0.3, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func sendCommentBtntTapped(_ sender: UIButton) {
        delegate?.sendCommentAction(index: tag)
    }

}
