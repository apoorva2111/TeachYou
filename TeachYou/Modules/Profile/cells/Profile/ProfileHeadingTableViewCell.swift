//
//  ProfileHeadingTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 23/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

protocol ProfileHeadingCellDelegate {
    func btnSelected(type: SelectedTab)
}

class ProfileHeadingTableViewCell: UITableViewCell {

    @IBOutlet weak var btnDiscussion: UIButton!
    @IBOutlet weak var btnAbout: UIButton!
    @IBOutlet weak var btnArticles: UIButton!
    @IBOutlet weak var btnEvents: UIButton!
    @IBOutlet weak var btnFriends: UIButton!
    @IBOutlet weak var btnPhotos: UIButton!
    @IBOutlet weak var btnVideos: UIButton!    
    
    var selectedTab : SelectedTab = .discussion
    var delegate: ProfileHeadingCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func discussionTapped(_ sender: UIButton) {
        delegate?.btnSelected(type: .discussion)
    }
    
    @IBAction func aboutTapped(_ sender: UIButton) {
        delegate?.btnSelected(type: .about)
    }
    
    @IBAction func articlesTapped(_ sender: UIButton) {
        delegate?.btnSelected(type: .articles)
    }
    
    @IBAction func eventsTapped(_ sender: UIButton) {
        delegate?.btnSelected(type: .events)
    }
    
    @IBAction func friendsTapped(_ sender: UIButton) {
        delegate?.btnSelected(type: .friends)
    }
    
    @IBAction func photosTapped(_ sender: UIButton) {
        delegate?.btnSelected(type: .photos)
    }
    
    @IBAction func videosTapped(_ sender: UIButton) {
        delegate?.btnSelected(type: .videos)
    }
    
    
}
