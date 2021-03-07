//
//  ServicesCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 06/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

class ServicesCell: UITableViewCell {

    @IBOutlet weak var shadowBg: UIView!
    @IBOutlet weak var bgVw: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowBg.roundCornerWithShadow(shadowColor: .gray, radius: 10, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
        bgVw.roundCornerWithShadow(shadowColor: .gray, radius: 10, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2, clipsbounds: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
