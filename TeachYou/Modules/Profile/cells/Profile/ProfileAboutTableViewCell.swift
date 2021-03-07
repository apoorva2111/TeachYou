//
//  ProfileAboutTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 23/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

protocol ProfileAboutCellDelegate {
    func btnSelected(type: SelectedSubTab)
}


class ProfileAboutTableViewCell: UITableViewCell {

    @IBOutlet weak var aboutVw: UIView!
    @IBOutlet weak var aboutTV: UITextView!
    @IBOutlet weak var aboutHeaderVw: UIView!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var aboutVwHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var educationVw: UIView!
    @IBOutlet weak var educationHeaderVw: UIView!
    @IBOutlet weak var educationBaseVw: UIView!
    @IBOutlet weak var educationVwHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var experienceVw: UIView!
    @IBOutlet weak var experienceHeaderVw: UIView!
    @IBOutlet weak var experienceBaseVw: UIView!
    @IBOutlet weak var experienceVwHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var skillsVw: UIView!
    @IBOutlet weak var skillsHeaderVw: UIView!
    @IBOutlet weak var skillsVwHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var skillsTV: UITextView!
    @IBOutlet weak var languagesVw: UIView!
    @IBOutlet weak var languagesHeaderVw: UIView!
    @IBOutlet weak var languagesTV: UITextView!
    @IBOutlet weak var languagesVwHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var interestesVw: UIView!
    @IBOutlet weak var interestsHeaderVw: UIView!
    @IBOutlet weak var interestsTV: UITextView!
    @IBOutlet weak var interestsVwHeightConstraint: NSLayoutConstraint!
    
    var delegate: ProfileAboutCellDelegate?
    var isOpen = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isOpen = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        aboutVw.roundCornerWithShadow(shadowColor: .gray, radius: 10, borderWidth: 0, borderColor: .gray, shadowOpacity: 02, shadowRadius: 02, shadowOffsetWidth: 02, shadowOffsetHeight: 02)
        
        aboutTV.roundCornerWithShadow(shadowColor: .gray, radius: 0, borderWidth: 1, borderColor: .gray, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0)
        
        btnSubmit.roundCornerWithShadow(shadowColor: .clear, radius: 15, borderWidth: 1, borderColor: #colorLiteral(red: 0.6885303486, green: 0.09540378441, blue: 0.08321580042, alpha: 0.8470588235) , shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func editAboutTapped(_ sender: UIButton) {
        delegate?.btnSelected(type: .about)
        
        if isOpen {
            self.aboutTV.isHidden = true
            self.btnSubmit.isHidden = true
            isOpen = false
        } else {
            self.aboutTV.isHidden = false
            self.btnSubmit.isHidden = false
        }
        
    }
    
    @IBAction func submitAboutTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func educationTapped(_ sender: UIButton) {
        delegate?.btnSelected(type: .education)
        if isOpen {
            isOpen = false
            self.educationBaseVw.isHidden = true
        } else {
            isOpen = true
            self.educationBaseVw.isHidden = false
        }
    }
    
    @IBAction func submitEducaitonTapped(_ sender: UIButton) {
    }
    
    @IBAction func editExperienceTapped(_ sender: UIButton) {
        delegate?.btnSelected(type: .experience)
        if isOpen {
             self.experienceBaseVw.isHidden = true
            isOpen = false
        } else {
            self.experienceBaseVw.isHidden = false
        }
    }
    
    @IBAction func editSkillTapped(_ sender: UIButton) {
        delegate?.btnSelected(type: .skills)
        if isOpen {
             self.skillsTV.isHidden = true
            isOpen = false
        } else {
            self.skillsTV.isHidden = false
        }
    }
    
    @IBAction func submitSkillTapped(_ sender: UIButton) {
    }
    
    @IBAction func editLanguageTapped(_ sender: UIButton) {
        delegate?.btnSelected(type: .language)
        if isOpen {
             self.languagesTV.isHidden = true
            isOpen = false
        } else {
            self.languagesTV.isHidden = false
        }
    }
    
    @IBAction func submitLanguageTapped(_ sender: UIButton) {
    }
    
    @IBAction func editInterestTapped(_ sender: UIButton) {
        delegate?.btnSelected(type: .interests)
        if isOpen {
             self.interestsTV.isHidden = true
            isOpen = false
        } else {
            self.interestsTV.isHidden = false
        }
    }
    
    @IBAction func submitInterestTapped(_ sender: UIButton) {
    }
    
    
}
