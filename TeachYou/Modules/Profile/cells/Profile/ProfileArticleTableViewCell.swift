//
//  ProfileArticleTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 23/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

class ProfileArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTag: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblViewCount: UILabel!
    @IBOutlet weak var BGView: UIView!
    @IBOutlet weak var lblAppreciate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
