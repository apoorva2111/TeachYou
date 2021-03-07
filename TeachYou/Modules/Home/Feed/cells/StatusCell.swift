//
//  StatusCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 06/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

protocol StatusCellDelegate {
    func statusCellTapAction()
}

class StatusCell: UITableViewCell {

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var statusTextView: UITextView!
    @IBOutlet weak var btnTap: UIButton!
    
    var delegate: StatusCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statusTextView.roundCornerWithShadow(shadowColor: .clear, radius: 5, borderWidth: 1, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func cellTapped(_ sender: UIButton) {
        delegate?.statusCellTapAction()
    }
    

}
