//
//  GroupStatusCell.swift
//  TeachYou
//
//  Created by Sandeep on 10/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class GroupStatusCell: UITableViewCell {

    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var statusTV: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
