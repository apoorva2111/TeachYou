//
//  FriendsTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 13/01/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

protocol FriendsCellDelegate {
    func addFriendBtnAction(index: Int)
}


class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImgVw: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var btnAddFriend: UIButton!
    @IBOutlet weak var bgView: UIView!
    
    var delegate: FriendsCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func interestedBtnTapped(_ sender: UIButton) {
        delegate?.addFriendBtnAction(index: self.tag)
    }
}
