//
//  ProfileLanguagesTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 23/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

class ProfileLanguagesTableViewCell: UITableViewCell {

    @IBOutlet weak var languageVw: UIView!
    @IBOutlet weak var languageTV: UITextView!
    @IBOutlet weak var btnSubmit: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        languageVw.roundCornerWithShadow(shadowColor: .gray, radius: 10, borderWidth: 0, borderColor: .gray, shadowOpacity: 02, shadowRadius: 02, shadowOffsetWidth: 02, shadowOffsetHeight: 02)
        
        languageTV.roundCornerWithShadow(shadowColor: .gray, radius: 0, borderWidth: 1, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0)
        
        btnSubmit.roundCornerWithShadow(shadowColor: .clear, radius: 15, borderWidth: 1, borderColor: #colorLiteral(red: 0.6885303486, green: 0.09540378441, blue: 0.08321580042, alpha: 0.8470588235) , shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
