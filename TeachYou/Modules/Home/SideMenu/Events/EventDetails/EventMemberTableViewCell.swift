//
//  EventMemberTableViewCell.swift
//  TeachYou
//
//  Created by Aarvy Technologies on 05/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class EventMemberTableViewCell: UITableViewCell {

    @IBOutlet var memberImage: UIImageView!
    @IBOutlet var memberName: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        memberImage.layer.cornerRadius = memberImage.frame.height*0.5
        memberImage.clipsToBounds = true
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
