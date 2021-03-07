//
//  ProfileEventTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 23/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

class ProfileEventTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
   
    @IBOutlet weak var eventImgVw: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
   
    @IBOutlet weak var eventIntrestedLabel: UILabel!
  
    @IBOutlet weak var btnOutletIntrest: UIButton!
   
    @IBAction func intrestBtnTapped(_ sender: Any) {
    }
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
        self.lblTitle.text = data.event_title
        self.eventIntrestedLabel.text = "\(String(describing: data.event_interested ?? 0)) interested"
        self.eventImgVw.imageFromServerURL(urlString: data.event_picture ?? "") { (image) in
        //            cell.imgView.image = cell.imgView.image?.crop(to: cell.imgView.frame.size)
                }
        self.selectedEventId = "\(data.event_id ?? 0)"
        if data.i_joined?.is_interested == 0 {
            self.btnOutletIntrest.setTitle("Interest", for: .normal)
            self.btnOutletIntrest.setImage(UIImage(systemName: "person.fill"), for: .normal)
            self.actionType = "interest"
        } else {
            self.btnOutletIntrest.setTitle("Interested", for: .normal)
            self.btnOutletIntrest.setImage(UIImage(systemName: "checkmark"), for: .normal)
            self.actionType = "uninterest"
        }
    }

}
