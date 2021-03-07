//
//  ChatFriendTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 24/01/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class ChatFriendTableViewCell: UITableViewCell {

    @IBOutlet weak var userImgVw: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblChatText: UILabel!
    @IBOutlet weak var lblTimeStamp: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgView.roundCornerWithShadow(shadowColor: .lightGray, radius: 5, borderWidth: 0, borderColor: .clear, shadowOpacity: 1, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellData(data: Conversations?) {
        self.lblUserName.text = data?.name ?? ""
        self.lblChatText.text = data?.message ?? ""
        let iDate = Utilities.stringToDate(date: data?.time ?? "", format: DateFormatterConstant.kyyyy_MM_dd_HH_mm_ss)
        let timesAgo : String = iDate.getElapsedInterval()
        self.lblTimeStamp.text = timesAgo
        self.userImgVw.imageFromServerURL(urlString: data?.picture ?? "") { (image) in }
    }

}
