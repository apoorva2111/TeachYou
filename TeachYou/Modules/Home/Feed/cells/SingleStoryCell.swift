//
//  SingleStoryCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 06/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

protocol SingleStoryCellDelegate {
    func singleStoryCellAction()
}

class SingleStoryCell: UICollectionViewCell {

    @IBOutlet weak var useRImg: UIImageView!
    @IBOutlet weak var addImg: UIImageView!
    @IBOutlet weak var storyBtn: UIButton!
    
    var singleStoryCellDelegate : SingleStoryCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


//    @IBAction func storyBtnTapped(_ sender: UIButton) {
//        singleStoryCellDelegate?.singleStoryCellAction()
//    }
    
    
}
