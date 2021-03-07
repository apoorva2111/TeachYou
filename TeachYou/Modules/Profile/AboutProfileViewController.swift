//
//  AboutProfileViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 30/01/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class AboutProfileViewController: UIViewController {

    //View About
     @IBOutlet weak var bgAboutVw: UIView!
     @IBOutlet weak var aboutTV: UITextView!
     @IBOutlet weak var btnSubmit: UIButton!
     @IBOutlet weak var editButtonOutlet: UIButton!
    
    //View Experience
    @IBOutlet weak var addExperienceButtonOutlet: UIButton!
    @IBOutlet weak var tblExperience: UITableView!
    @IBOutlet weak var txtvwExperience: UITextView!
    @IBOutlet weak var txtvwCompanyName: UITextView!
    @IBOutlet weak var btnOutletStartDate: UIButton!
    @IBOutlet weak var bgExperienceVw: UIView!
    @IBOutlet weak var btnOutletEndDate: UIButton!
    @IBOutlet weak var imgPresentCheckBox: UIImageView!
    @IBOutlet weak var btnOutletPresentCheck: UIButton!
    @IBOutlet weak var viewExperienceEndDate: UIView!
   // @IBOutlet weak var tblExperinceHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewExperienceDateView: UIView!
    @IBOutlet weak var viewExpwerienceSubmit: UIView!
    
    //View Education
    @IBOutlet weak var bgEducationVw: UIView!
    @IBOutlet weak var addEducationOutlet: UIButton!
    @IBOutlet weak var txtSchoolName: UITextView!
    @IBOutlet weak var txtDegreeName: UITextView!
    @IBOutlet weak var imgEducationPresentlyCheckbox: UIImageView!
    @IBOutlet weak var btnOutletEducationEndDate: UIButton!
    @IBOutlet weak var viewEducationEndDate: UIView!
    @IBOutlet weak var btnOutletEducationStartDate: UIButton!
    @IBOutlet weak var tblEducation: UITableView!
    @IBOutlet weak var tblEducationHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewEducationDateView: UIView!
    
    @IBOutlet weak var viewEducationSubmit: UIView!
    
    //View Skill
    @IBOutlet weak var bgSkillsVw: UIView!
    @IBOutlet weak var btnEditSkillOutlet: UIButton!
    @IBOutlet weak var lblSkills: UILabel!
    @IBOutlet weak var txtvwAddSkill: UITextView!
    @IBOutlet weak var viewSkillSubmit: UIView!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
