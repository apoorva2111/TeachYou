//
//  TapicsReactionTableViewCell.swift
//  TeachYou
//
//  Created by Aarvy Technologies on 10/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class TapicsReactionTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel:UILabel!
    @IBOutlet weak var star1ImageView:UIImageView!
    @IBOutlet weak var star2ImageView:UIImageView!
    @IBOutlet weak var star3ImageView:UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        userImageView.layer.cornerRadius = userImageView.frame.height*0.5
        userImageView.clipsToBounds = true
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
