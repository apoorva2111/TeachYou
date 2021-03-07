//
//  CommentCollectionViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 05/01/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class CommentCollectionViewCell: UICollectionViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var commentProfileImgVw: UIImageView!
     @IBOutlet weak var commentBox: UITextField!
     @IBOutlet weak var btnSendComment: UIButton!
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var lblProfileNAme: UILabel!
    @IBOutlet weak var lblTimeAgo: UILabel!
    @IBOutlet weak var btnEditComment: UIButton!
    
    
    var delegate: PostCommentCellDelegate?
    var collection : UICollectionView?
    var tblCell : FeedCell?
    var tblProfileDiscussionCell : ProfileDiscussionTableViewCell?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        commentProfileImgVw.roundCornerWithShadow(shadowColor: UIColor.black, radius: commentProfileImgVw.frame.width/2, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity: 1, shadowRadius: 4, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: true)
        commentBox.delegate = self
        commentBox.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)

        let image = UserSessionManager.shared.getImage() ?? ""
            let url = "https://teachyou.in/content/uploads/" + image
        self.commentProfileImgVw.sd_setImage(with: URL(string: url), placeholderImage:  #imageLiteral(resourceName: "userPlaceholder"))
        commentBox.text = ""
        
    }
    
    @IBAction func sendCommentBtntTapped(_ sender: UIButton) {
        delegate?.sendCommentAction(index: tag)
       }
   
  
    @objc func textFieldDidChange(textField: UITextField){
        tblCell?.commentStr = textField.text!
        tblProfileDiscussionCell?.commentStr = textField.text!
    }


}
