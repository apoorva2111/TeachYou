//
//  AdminCell.swift
//  TeachYou
//
//  Created by Sandeep on 14/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class AdminCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var adminImg: UIImageView!
    @IBOutlet weak var adminName: UILabel!
    @IBOutlet weak var removeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(removeAdmin(_:)))
        removeView.addGestureRecognizer(tapGest)
        
        cellView.roundCornerWithShadow(shadowColor: .gray, radius: 5, borderWidth: 0, borderColor: .clear, shadowOpacity: 1, shadowRadius: 1, shadowOffsetWidth: 1, shadowOffsetHeight: 1)
    }
    
    func setData() {
        adminName.text = UserSessionManager.shared.getName() ?? ""
        adminImg.imageFromServerURL(urlString: UserSessionManager.shared.getAvatar() ?? "") { (image) in
        }
    }
    
    @objc func removeAdmin(_ sender: UITapGestureRecognizer? = nil) {
        print("Admin removed")
    }
}
