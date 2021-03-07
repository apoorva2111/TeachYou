//
//  EventDetailsTopTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 22/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

protocol EventDetailsTopTableViewCellDelegate {
    func eventInterestedTapped(sender: UIButton)
    func eventGoingTapped(sender: UIButton)
}

class EventDetailsTopTableViewCell: UITableViewCell {

    @IBOutlet weak var eventCoverImgVw: UIImageView!
    @IBOutlet weak var btnGoing: UIButton!
    @IBOutlet weak var btnInterested: UIButton!
    @IBOutlet weak var lblEventTitle: UILabel!
    var delegate:EventDetailsTopTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCellData(imgUrlStr:String, event_title:String) {
    
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = AppConstants.BASE_UPDATE_URL
        urlComponent.path = imgUrlStr
        guard let url = urlComponent.url else { return }
        self.eventCoverImgVw.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "userPlaceholder"))
        
        self.lblEventTitle.text = event_title
        
        
    }
    
    
    @IBAction func interestedBtnTapped(_ sender: UIButton) {
        sender.setTitle("UPDATING", for: .normal)
        print("interestedBtnTapped")
        self.delegate?.eventInterestedTapped(sender: sender)
    }
    
    @IBAction func goingBtnTapped(_ sender: UIButton) {
        sender.setTitle("UPDATING", for: .normal)
        print("goingBtnTapped")
        self.delegate?.eventGoingTapped(sender: sender)
        
    }
    
    
}
