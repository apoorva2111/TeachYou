//
//  EventCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 15/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

protocol EventCellDelegate {
    func interestedBtnAction(id: String, actionType: String)
}

class EventCell: UITableViewCell {

    @IBOutlet weak var eventImgVw: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventInterestedLbl: UILabel!
    @IBOutlet weak var btnInterest: UIButton!
    @IBOutlet weak var bgView: UIView!
    
    var delegate: EventCellDelegate?
    var selectedEventId: String?
    var actionType: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellData(data: Events) {
        self.eventTitle.text = data.event_title
        self.eventInterestedLbl.text = "\(String(describing: data.event_interested ?? 0)) interested"
        self.eventImgVw.imageFromServerURL(urlString: data.event_picture ?? "") { (image) in
        //            cell.imgView.image = cell.imgView.image?.crop(to: cell.imgView.frame.size)
                }
        self.selectedEventId = "\(data.event_id ?? 0)"
        if data.i_joined?.is_interested == 0 {
            self.btnInterest.setTitle("Interest", for: .normal)
            self.btnInterest.setImage(UIImage(systemName: "person.fill"), for: .normal)
            self.actionType = "interest"
        } else {
            self.btnInterest.setTitle("Interested", for: .normal)
            self.btnInterest.setImage(UIImage(systemName: "checkmark"), for: .normal)
            self.actionType = "uninterest"
        }
    }
    
    func setGoCellData(data: Events) {
        self.eventTitle.text = data.event_title
        self.eventInterestedLbl.text = "\(String(describing: data.event_interested ?? 0)) interested"
        self.eventImgVw.imageFromServerURL(urlString: data.event_picture ?? "") { (image) in
        //            cell.imgView.image = cell.imgView.image?.crop(to: cell.imgView.frame.size)
                }
        self.selectedEventId = "\(data.event_id ?? 0)"
        if data.i_joined?.is_going == 0 {
            self.btnInterest.setTitle("Going", for: .normal)
            self.btnInterest.setImage(UIImage(systemName: "hand.raised.fill"), for: .normal)
            self.actionType = "event-go"
        } else {
            self.btnInterest.setTitle("Going", for: .normal)
            self.btnInterest.setImage(UIImage(systemName: "checkmark"), for: .normal)
            self.actionType = "event-ungo"
        }
    }


    @IBAction func interestedBtnTapped(_ sender: UIButton) {
        delegate?.interestedBtnAction(id: selectedEventId ?? "", actionType: self.actionType ?? "")
    }
    
    
}
