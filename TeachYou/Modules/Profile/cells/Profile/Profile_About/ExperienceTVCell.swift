//
//  ExperienceTVCell.swift
//  TeachYou
//
//  Created by Apoorva Gangrade on 03/03/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class ExperienceTVCell: UITableViewCell {
    
    @IBOutlet weak var lblSchool_companyName: UILabel!
    @IBOutlet weak var lblPosition: UILabel!
    @IBOutlet weak var lblTotalTimeDate: UILabel!
    @IBOutlet weak var viewEdit: UIView!
    @IBOutlet weak var btnEditOutlet: RCustomButton!
    @IBOutlet weak var btnDeleteOutlet: RCustomButton!
    @IBOutlet weak var viewDelete: UIView!
  
    @IBAction func btnEditAction(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            viewEdit.isHidden = true
            viewDelete.isHidden = true

        }else{
            sender.isSelected = true
            viewEdit.isHidden = false
            viewDelete.isHidden = false
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewEdit.isHidden = true
        viewDelete.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
