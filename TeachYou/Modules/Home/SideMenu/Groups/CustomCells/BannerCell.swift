//
//  BannerCell.swift
//  TeachYou
//
//  Created by Sandeep on 08/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class BannerCell: UITableViewCell {
    
    @IBOutlet weak var eventCoverImgVw: UIImageView!
    @IBOutlet weak var btnGoing: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setButton( buttonTitle:String) {
        self.btnGoing.setTitle(buttonTitle, for: .normal)
    }
    
    @IBAction func goingBtnTapped(_ sender: UIButton) {
        print("goingBtnTapped")
    }
}
