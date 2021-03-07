//
//  EventDetailsPostTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 22/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

class EventDetailsPostTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewProfile: UIImageView!
    @IBOutlet weak var imageViewPost: UIImageView!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelFeeling: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelNoPosts: UILabel!
    @IBOutlet weak var lblAdded: UILabel!
    @IBOutlet weak var btnReact: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnReport: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var bottomBtnVw: UIView!
    @IBOutlet weak var commentVw: UIView!
    @IBOutlet weak var commentProfileImgVw: UIImageView!
    @IBOutlet weak var commentBox: UITextView!
    @IBOutlet weak var btnSendComment: UIButton!
    @IBOutlet weak var btnExpandImg: UIButton!
    @IBOutlet weak var viewBG: UIView!
  
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
