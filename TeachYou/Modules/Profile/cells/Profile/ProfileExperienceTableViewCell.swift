//
//  ProfileExperienceTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 23/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

class ProfileExperienceTableViewCell: UITableViewCell {

    @IBOutlet weak var experienceVw: UIView!
    @IBOutlet weak var experienceBaseVw: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        experienceVw.roundCornerWithShadow(shadowColor: .gray, radius: 10, borderWidth: 0, borderColor: .gray, shadowOpacity: 02, shadowRadius: 02, shadowOffsetWidth: 02, shadowOffsetHeight: 02)
      
        experienceBaseVw.roundCornerWithShadow(shadowColor: .gray, radius: 0, borderWidth: 1, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
