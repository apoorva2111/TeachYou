//
//  StarAppreciatesTVCell.swift
//  TeachYou
//
//  Created by Apoorva Gangrade on 07/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class StarAppreciatesTVCell: UITableViewCell {

    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var imgStarOne: UIImageView!
    @IBOutlet weak var imgStarTwo: UIImageView!
    @IBOutlet weak var imgStarThree: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgProfile.roundCornerWithShadow(shadowColor: UIColor.black, radius: imgProfile.frame.width/2, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity: 1, shadowRadius: 4, shadowOffsetWidth: 1, shadowOffsetHeight: 1, clipsbounds: true)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
