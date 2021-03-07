//
//  NotificationTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 01/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var notificationMsg: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgView.roundCornerWithShadow(shadowColor: .lightGray, radius: 5, borderWidth: 0, borderColor: .clear, shadowOpacity: 1, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setCellData(data: NotificationsData) {
        self.userName.text = (data.user_firstname ?? "") + " " + (data.user_lastname ?? "")
        self.notificationMsg.text = data.message
        self.userImg.imageFromServerURL(urlString: data.user_picture ?? "") { (image) in
        }
    }
}
