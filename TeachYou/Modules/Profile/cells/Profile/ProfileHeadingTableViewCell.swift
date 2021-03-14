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
    
    @IBOutlet weak var imgDiscussion: UIImageView!
    @IBOutlet weak var imgAbout: UIImageView!
    @IBOutlet weak var imgArticles: UIImageView!
    @IBOutlet weak var imgEvents: UIImageView!
    @IBOutlet weak var imgFriends: UIImageView!
    @IBOutlet weak var imgPhotos: UIImageView!
    @IBOutlet weak var imgVideos: UIImageView!

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
        imgDiscussion.image = #imageLiteral(resourceName: "arrow_down")
        imgAbout.image = #imageLiteral(resourceName: "arrow_right")
        imgEvents.image = #imageLiteral(resourceName: "arrow_right")
        imgPhotos.image = #imageLiteral(resourceName: "arrow_right")
        imgVideos.image = #imageLiteral(resourceName: "arrow_right")
        imgFriends.image = #imageLiteral(resourceName: "arrow_right")
        imgArticles.image = #imageLiteral(resourceName: "arrow_right")
        
        delegate?.btnSelected(type: .discussion)
    }
    
    @IBAction func aboutTapped(_ sender: UIButton) {
        imgAbout.image = #imageLiteral(resourceName: "arrow_down")
        imgDiscussion.image = #imageLiteral(resourceName: "arrow_right")
        imgEvents.image = #imageLiteral(resourceName: "arrow_right")
        imgPhotos.image = #imageLiteral(resourceName: "arrow_right")
        imgVideos.image = #imageLiteral(resourceName: "arrow_right")
        imgFriends.image = #imageLiteral(resourceName: "arrow_right")
        imgArticles.image = #imageLiteral(resourceName: "arrow_right")
        delegate?.btnSelected(type: .about)
    }
    
    @IBAction func articlesTapped(_ sender: UIButton) {
        imgArticles.image = #imageLiteral(resourceName: "arrow_down")
        imgDiscussion.image = #imageLiteral(resourceName: "arrow_right")
        imgEvents.image = #imageLiteral(resourceName: "arrow_right")
        imgPhotos.image = #imageLiteral(resourceName: "arrow_right")
        imgVideos.image = #imageLiteral(resourceName: "arrow_right")
        imgFriends.image = #imageLiteral(resourceName: "arrow_right")
        imgAbout.image = #imageLiteral(resourceName: "arrow_right")
        delegate?.btnSelected(type: .articles)
    }
    
    @IBAction func eventsTapped(_ sender: UIButton) {
        imgEvents.image = #imageLiteral(resourceName: "arrow_down")
        imgDiscussion.image = #imageLiteral(resourceName: "arrow_right")
        imgArticles.image = #imageLiteral(resourceName: "arrow_right")
        imgPhotos.image = #imageLiteral(resourceName: "arrow_right")
        imgVideos.image = #imageLiteral(resourceName: "arrow_right")
        imgFriends.image = #imageLiteral(resourceName: "arrow_right")
        imgAbout.image = #imageLiteral(resourceName: "arrow_right")
        delegate?.btnSelected(type: .events)
    }
    
    @IBAction func friendsTapped(_ sender: UIButton) {
        imgFriends.image = #imageLiteral(resourceName: "arrow_down")
        imgDiscussion.image = #imageLiteral(resourceName: "arrow_right")
        imgArticles.image = #imageLiteral(resourceName: "arrow_right")
        imgPhotos.image = #imageLiteral(resourceName: "arrow_right")
        imgVideos.image = #imageLiteral(resourceName: "arrow_right")
        imgEvents.image = #imageLiteral(resourceName: "arrow_right")
        imgAbout.image = #imageLiteral(resourceName: "arrow_right")
        delegate?.btnSelected(type: .friends)
    }
    
    @IBAction func photosTapped(_ sender: UIButton) {
        imgFriends.image = #imageLiteral(resourceName: "arrow_right")
        imgDiscussion.image = #imageLiteral(resourceName: "arrow_right")
        imgArticles.image = #imageLiteral(resourceName: "arrow_right")
        imgPhotos.image = #imageLiteral(resourceName: "arrow_down")
        imgVideos.image = #imageLiteral(resourceName: "arrow_right")
        imgEvents.image = #imageLiteral(resourceName: "arrow_right")
        imgAbout.image = #imageLiteral(resourceName: "arrow_right")
        delegate?.btnSelected(type: .photos)
    }
    
    @IBAction func videosTapped(_ sender: UIButton) {
        imgFriends.image = #imageLiteral(resourceName: "arrow_right")
        imgDiscussion.image = #imageLiteral(resourceName: "arrow_right")
        imgArticles.image = #imageLiteral(resourceName: "arrow_right")
        imgPhotos.image = #imageLiteral(resourceName: "arrow_right")
        imgVideos.image = #imageLiteral(resourceName: "arrow_down")
        imgEvents.image = #imageLiteral(resourceName: "arrow_right")
        imgAbout.image = #imageLiteral(resourceName: "arrow_right")
        delegate?.btnSelected(type: .videos)
    }
    
    
}
