//
//  EventDetailsCountTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 22/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

protocol EventDetailsCountTableViewCellDelegate {
    func goingMembersTapped(_ sender: UIButton)
    func invitedTapped(_ sender: UIButton)
    func interestedMembersTapped(_ sender: UIButton)
}
class EventDetailsCountTableViewCell: UITableViewCell {

    @IBOutlet weak var lblGoingValue: UILabel!
    @IBOutlet weak var lblInterestedValue: UILabel!
    @IBOutlet weak var lblInvitedValue: UILabel!
    @IBOutlet weak var bgVw: UIView!
    var delegate: EventDetailsCountTableViewCellDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func goingTapped(_ sender: UIButton){
        self.delegate?.goingMembersTapped(sender)
    }
    
    @IBAction func interestedTapped(_ sender: UIButton){
        self.delegate?.interestedMembersTapped(sender)
        
    }
    
    @IBAction func invitedMembersTapped(_ sender: UIButton){
        self.delegate?.invitedTapped(sender)
    }
   
    
    
}
