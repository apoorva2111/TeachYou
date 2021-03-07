//
//  EventDetailsCreatedTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 22/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

class EventDetailsCreatedTableViewCell: UITableViewCell {

    @IBOutlet weak var createdImgVw: UIImageView!
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var lblCreatedValue: UILabel!
    @IBOutlet weak var bgVw: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
