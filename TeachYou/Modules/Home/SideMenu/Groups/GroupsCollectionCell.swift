//
//  GroupsCollectionCell.swift
//  TeachYou
//
//  Created by Sandeep on 21/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

protocol GroupsCollectionCellProtocol {
    func joinGroup(index: Int)
}


class GroupsCollectionCell: UICollectionViewCell {
    @IBOutlet weak var lblGroupTitle: UILabel!
    @IBOutlet weak var groupCoverImg: UIImageView!
    @IBOutlet weak var lblMemberCount: UILabel!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var bgView: UIView!
    
    var delegate: GroupsCollectionCellProtocol?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bgView.roundCornerWithShadow(shadowColor: .lightGray, radius: 5, borderWidth: 0, borderColor: .clear, shadowOpacity: 1, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
    }
    
    func setCellData(data: Groups) {
        self.lblGroupTitle.text = data.group_title
        self.lblMemberCount.text = "\(data.group_members ?? 0) Members"
        self.groupCoverImg.imageFromServerURL(urlString: data.group_picture ?? "") { (image) in }
    }
    
    @IBAction func interestedBtnTapped(_ sender: UIButton) {
        delegate?.joinGroup(index: self.tag)
    }
}
