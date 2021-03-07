//
//  EventDetailsTimeTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 22/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

class EventDetailsTimeTableViewCell: UITableViewCell {

    @IBOutlet weak var timeImgVw: UIImageView!
    @IBOutlet weak var lblTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
