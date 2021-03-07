//
//  ChatPeopleTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 24/01/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class ChatPeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var userImgVw: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgView.roundCornerWithShadow(shadowColor: .lightGray, radius: 5, borderWidth: 0, borderColor: .clear, shadowOpacity: 1, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCellData(data: All_data) {
        self.lblUserName.text = (data.user_firstname ?? "") + " " + (data.user_lastname ?? "")
        self.userImgVw.imageFromServerURL(urlString: data.user_picture ?? "") { (image) in }
    }
    
}
