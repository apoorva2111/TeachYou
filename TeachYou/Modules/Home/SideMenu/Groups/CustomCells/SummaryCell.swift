//
//  SummaryCell.swift
//  TeachYou
//
//  Created by Sandeep on 09/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class SummaryCell: UITableViewCell {

    @IBOutlet weak var lblSummaryHeading: UILabel!
    @IBOutlet weak var lblSummary: UILabel!
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
