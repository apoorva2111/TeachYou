//
//  ImagePostCell.swift
//  TeachYou
//
//  Created by Sandeep on 10/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class ImagePostCell: UITableViewCell {
    
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

    func setData(data: Groups){
        
    }
    
}
