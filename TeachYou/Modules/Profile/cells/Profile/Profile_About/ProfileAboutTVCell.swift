//
//  ProfileAboutTVCell.swift
//  TeachYou
//
//  Created by Apoorva Gangrade on 02/03/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit
import KRProgressHUD
import Alamofire

protocol ProfileAboutTVCellDelegate {
    func editExperience(expWorkTitle: String, expCompanyName:String, expStartDatr:String, expEndDate:String,expPresent:Int, expId:Int)
    func editEducation(eduSchoolName: String, eduDegree:String, eduStartDatr:String, eduEndDate:String,eduPresent:Int, eduId:Int)
}


class ProfileAboutTVCell: UITableViewCell {
   //View About
    @IBOutlet weak var bgAboutVw: UIView!
    @IBOutlet weak var aboutTV: UITextView!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var editButtonOutlet: UIButton!
    //View Experience
    @IBOutlet weak var addExperienceButtonOutlet: UIButton!
    @IBOutlet weak var tblExperience: customTblView!
    @IBOutlet weak var txtvwExperience: UITextView!
    @IBOutlet weak var txtvwCompanyName: UITextView!
    @IBOutlet weak var btnOutletStartDate: UIButton!
    @IBOutlet weak var bgExperienceVw: UIView!
    @IBOutlet weak var btnOutletEndDate: UIButton!
    @IBOutlet weak var imgPresentCheckBox: UIImageView!
    @IBOutlet weak var btnOutletPresentCheck: UIButton!
    @IBOutlet weak var viewExperienceEndDate: UIView!
    @IBOutlet weak var tblExperinceHeightConstraint: NSLayoutConstraint!
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
    @IBOutlet weak var tblEducation: customTblView!
    @IBOutlet weak var viewEducationDateView: UIView!
    @IBOutlet weak var viewEducationSubmit: UIView!
    
    //View Skill
    @IBOutlet weak var bgSkillsVw: UIView!
    @IBOutlet weak var btnEditSkillOutlet: UIButton!
    @IBOutlet weak var lblSkills: UILabel!
    @IBOutlet weak var txtvwAddSkill: UITextView!
    @IBOutlet weak var viewSkillSubmit: UIView!
    
     //View Language
     @IBOutlet weak var bgLanguageVw: UIView!
     @IBOutlet weak var btnEditLanguageOutlet: UIButton!
     @IBOutlet weak var lblLanguage: UILabel!
     @IBOutlet weak var txtvwAddLanguage: UITextView!
    @IBOutlet weak var viewLanguageSubmit: UIView!
    
    //View Intrests
    @IBOutlet weak var bgIntrestVw: UIView!
    @IBOutlet weak var btnEditIntrestsOutlet: UIButton!
    @IBOutlet weak var lblIntrests: UILabel!
    @IBOutlet weak var txtvwAddIntrests: UITextView!
    @IBOutlet weak var viewIntrestSubmit: UIView!
    
    @IBOutlet weak var btnAboutSubmitHeightConstraint: NSLayoutConstraint!
  
    @IBOutlet weak var viewEducationHeightConstraint: NSLayoutConstraint!
    
    var viewCntrl : UIViewController?
    
    var userProfileData: ProfileModel?
    var tableViewMain : UITableView!

    var language = ""
    var skill = ""
    var intrests = ""
    var selectDateFor = ""
    var tableViewEdicationHeight: CGFloat = 0
    var tableViewExperienceHeight: CGFloat = 0
    var arrEducation = [EducationsModel]()
    var edu_id = 0
    var exp_id = 0
    var edu_endDate = ""
    var exp_endDate = ""
    var delegate : ProfileAboutTVCellDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setView()
    }
    
    func setView()  {

        bgAboutVw.roundCornerWithShadow(shadowColor: .lightGray, radius: 20, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)

        bgExperienceVw.roundCornerWithShadow(shadowColor: .lightGray, radius: 20, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)

        bgEducationVw.roundCornerWithShadow(shadowColor: .lightGray, radius: 20, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)

        bgSkillsVw.roundCornerWithShadow(shadowColor: .lightGray, radius: 20, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
       
        bgLanguageVw.roundCornerWithShadow(shadowColor: .lightGray, radius: 20, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
       
        bgIntrestVw.roundCornerWithShadow(shadowColor: .lightGray, radius: 20, borderWidth: 0, borderColor: .clear, shadowOpacity: 2, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
       
        aboutTV.text = "Write about yourself "
        aboutTV.textColor = UIColor.lightGray

        txtvwAddLanguage.isHidden = true
        txtvwAddSkill.isHidden = true
        txtvwAddIntrests.isHidden = true
        viewSkillSubmit.isHidden = true
        viewIntrestSubmit.isHidden = true
        viewLanguageSubmit.isHidden = true
        viewEducationSubmit.isHidden = true
        viewEducationDateView.isHidden = true
        viewExpwerienceSubmit.isHidden = true
        viewExperienceDateView.isHidden = true
        
        tblEducation.delegate = self
        tblEducation.dataSource = self
        tblExperience.delegate = self
        tblExperience.dataSource = self
//        txtvwExperience.delegate = self
//        txtvwCompanyName.delegate = self
//        txtSchoolName.delegate = self
//        txtvwAddLanguage.delegate = self
        
        
        self.tblEducation.register(UINib(nibName: "EducationTVCell", bundle: nil), forCellReuseIdentifier: "EducationTVCell")
        self.tblExperience.register(UINib(nibName: "ExperienceTVCell", bundle: nil), forCellReuseIdentifier: "ExperienceTVCell")
    }
    
    func setData(userData: ProfileModel?) {
        var arrLanguage = [String]()
        var arrSkills = [String]()
        var arrIntrests = [String]()
        userProfileData = userData
        if let strLanguage = userData?.user_languages{
            language = strLanguage
            let stringArray = strLanguage.split(separator: ",")
            for objLanguage in stringArray{
                let language = String(objLanguage)
                let trimmed = language.trimmingCharacters(in: .whitespacesAndNewlines)

                arrLanguage.append(trimmed)
            }
            
        lblLanguage.attributedText = NSAttributedStringHelper.createBulletedList(fromStringArray: arrLanguage, font: UIFont(name: "Roboto-Medium", size:13.0))

        }
        if let strSkills = userData?.user_skills{
            skill = strSkills
            let stringArray = strSkills.split(separator: ",")
            for objSkill in stringArray{
                let language = String(objSkill)
                let trimmed = language.trimmingCharacters(in: .whitespacesAndNewlines)

                arrSkills.append(trimmed)
            }
            
        lblSkills.attributedText = NSAttributedStringHelper.createBulletedList(fromStringArray: arrSkills, font: UIFont(name: "Roboto-Medium", size:13.0))

        }
        if let strIntrest = userData?.user_interests{
            intrests = strIntrest
            let stringArray = strIntrest.split(separator: ",")
            for objSkill in stringArray{
                let language = String(objSkill)
                let trimmed = language.trimmingCharacters(in: .whitespacesAndNewlines)

                arrIntrests.append(trimmed)
            }
            
        lblIntrests.attributedText = NSAttributedStringHelper.createBulletedList(fromStringArray: arrIntrests, font: UIFont(name: "Roboto-Medium", size:13.0))

        }
        aboutTV.text = userData?.user_biography
        aboutTV.textColor = UIColor.black
        self.btnEditSkillOutlet.setImage(#imageLiteral(resourceName: "pencil"), for: .normal)
        self.btnEditLanguageOutlet.setImage(#imageLiteral(resourceName: "pencil"), for: .normal)
        self.btnEditIntrestsOutlet.setImage(#imageLiteral(resourceName: "pencil"), for: .normal)
        
    
       
            if let experience = userData?.experiences?.count{
                if experience > 0 {

                    self.tblExperience.reloadData()
                    self.tblExperience.layoutIfNeeded()


                }
            }else{
                self.viewExpwerienceSubmit.isHidden = false
                self.viewExperienceDateView.isHidden = false
                self.tblExperience.reloadData()
                self.tblExperience.layoutIfNeeded()
            }

            if let education = userData?.educations?.count{
                if education > 0 {

                    self.tblEducation.reloadData()
                    self.tblEducation.layoutIfNeeded()

                }
            }else{
                self.viewEducationSubmit.isHidden = false
                self.viewEducationDateView.isHidden = false
                self.tblEducation.reloadData()
                self.tblEducation.layoutIfNeeded()
            }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    @IBAction func btnSelectDateAction(_ sender: UIButton) {
        let isDOBTapped = false
        if sender.tag == 10{
            print("Expreience Start Date")
            selectDateFor = "Expreience Start Date"
            Utilities.initDOBPicker(delegate: self, mode: 0, isDOB: isDOBTapped)


        }else if sender.tag == 20 {
            print("Expreience End Date")
            selectDateFor = "Expreience End Date"
            Utilities.initDOBPicker(delegate: self, mode: 0, isDOB: isDOBTapped)

        }else if sender.tag == 30 {
            print("Expreience Presently")
            if sender.isSelected{
                sender.isSelected = false
                viewExperienceEndDate.isHidden = false
                imgPresentCheckBox.image = #imageLiteral(resourceName: "unchecked")
                ProfileAboutString.exp_Present = 0


            }else{
                sender.isSelected = true
                viewExperienceEndDate.isHidden = true
                imgPresentCheckBox.image = #imageLiteral(resourceName: "checked")
                let date = Utilities.getCurrentDate(format: DateFormatterConstant.kdateyyyy_mm_dd)
                print(date)
                exp_endDate = date
                ProfileAboutString.exp_Present = 1
            }

        }else if sender.tag == 40 {
            print("Education Start Date")
            selectDateFor = "Education Start Date"

            Utilities.initDOBPicker(delegate: self, mode: 0, isDOB: isDOBTapped)


        }else if sender.tag == 50 {
            print("Education End Date")
            selectDateFor = "Education End Date"

            Utilities.initDOBPicker(delegate: self, mode: 0, isDOB: isDOBTapped)


        }else if sender.tag == 60 {
            print("Education Presently")
            if sender.isSelected{
                sender.isSelected = false
                viewEducationEndDate.isHidden = false
                imgEducationPresentlyCheckbox.image = #imageLiteral(resourceName: "unchecked")
                ProfileAboutString.edu_Present = 0


            }else{
                sender.isSelected = true
                viewEducationEndDate.isHidden = true
                imgEducationPresentlyCheckbox.image = #imageLiteral(resourceName: "checked")
                let date = Utilities.getCurrentDate(format: DateFormatterConstant.kdateyyyy_mm_dd)
                print(date)
                edu_endDate = date
                ProfileAboutString.edu_Present = 1
            }

        }
    }
    @IBAction func btnCloseAction(_ sender: UIButton) {
        if sender.tag == 1{
            viewExpwerienceSubmit.isHidden = true
            viewExperienceDateView.isHidden = true

        }else if sender.tag == 2{
            viewEducationSubmit.isHidden = true
            viewEducationDateView.isHidden = true

        }
    }
    @IBAction func btnEditableAction(_ sender: UIButton) {
        if sender.tag == 10 {
            print("About")
            btnSubmit.isHidden = false
        }else if sender.tag == 20 {
            print("Experiance")
                viewExpwerienceSubmit.isHidden = false
                viewExperienceDateView.isHidden = false
            txtvwExperience.text = ""
            txtvwCompanyName.text = ""
            btnOutletStartDate.setTitle("Start Date", for: .normal)
            btnOutletStartDate.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
            btnOutletEndDate.setTitle("End Date", for: .normal)
            btnOutletEndDate.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
            ProfileAboutString.exp_ActionType = "Add"

        
        }else if sender.tag == 30 {
            print("Education")
           
                viewEducationSubmit.isHidden = false
                viewEducationDateView.isHidden = false
            ProfileAboutString.edu_ActionType = "Add"
            txtSchoolName.text = ""
            txtDegreeName.text = ""
            btnOutletEducationStartDate.setTitle("Start Date", for: .normal)
            btnOutletEducationStartDate.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
            btnOutletEducationEndDate.setTitle("End Date", for: .normal)
            btnOutletEducationEndDate.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)


        }else if sender.tag == 40 {
            print("Skills")
            if sender.isSelected{
                sender.isSelected = false
                txtvwAddSkill.isHidden = true
                viewSkillSubmit.isHidden = true
                txtvwAddSkill.text = ""
                lblSkills.isHidden = false
                btnEditSkillOutlet.setImage(#imageLiteral(resourceName: "pencil"), for: .normal)
                self.tableViewMain.reloadData()
                 self.tableViewMain.layoutIfNeeded()


            }else{
                sender.isSelected = true
                txtvwAddSkill.isHidden = false
                viewSkillSubmit.isHidden = false
                lblSkills.isHidden = true
                txtvwAddSkill.text = skill
                btnEditSkillOutlet.setImage(#imageLiteral(resourceName: "cross_btn"), for: .normal)
                self.tableViewMain.reloadData()
                 self.tableViewMain.layoutIfNeeded()

            }

        }else if sender.tag == 50 {
            print("Language")
            if sender.isSelected{
                sender.isSelected = false
                txtvwAddLanguage.isHidden = true
                viewLanguageSubmit.isHidden = true
                lblLanguage.isHidden = false
                txtvwAddLanguage.text = ""
                self.tableViewMain.reloadData()
                 self.tableViewMain.layoutIfNeeded()

            }else{
                sender.isSelected = true
                txtvwAddLanguage.isHidden = false
                viewLanguageSubmit.isHidden = false
                lblLanguage.isHidden = true
                txtvwAddLanguage.text = language
                self.tableViewMain.reloadData()
                 self.tableViewMain.layoutIfNeeded()

            }
            
        }else if sender.tag == 60 {
            print("Intrest")
            if sender.isSelected{
                sender.isSelected = false
                txtvwAddIntrests.isHidden = true
                viewIntrestSubmit.isHidden = true
                txtvwAddIntrests.text = ""
                lblIntrests.isHidden = false
                self.tableViewMain.reloadData()
                 self.tableViewMain.layoutIfNeeded()
            }else{
                sender.isSelected = true
                txtvwAddIntrests.isHidden = false
                viewIntrestSubmit.isHidden = false
                txtvwAddIntrests.text = intrests
                lblIntrests.isHidden = true
                self.tableViewMain.reloadData()
                 self.tableViewMain.layoutIfNeeded()
            }
        }
    }
    @IBAction func btnSubmitAction(_ sender: UIButton) {

        if sender.tag == 10{
            print("Submit Experience")
            ProfileAboutString.isFirstTimeBottomConstraint = true
            AddExperience()

        }else if sender.tag == 20{
            print("Submit Education")
            ProfileAboutString.isFirstTimeBottomConstraint = true
            AddEducation()
        }else if sender.tag == 30{
            print("Submit Skills")
            ProfileAboutString.isFirstTimeBottomConstraint = false
            addSkill()
            
        }else if sender.tag == 40{
            print("Submit Language")
            ProfileAboutString.isFirstTimeBottomConstraint = false
            addLanguage()

        }else if sender.tag == 50{
            print("Submit intrest")
            ProfileAboutString.isFirstTimeBottomConstraint = false

            AddIntrest()

        }else if sender.tag == 60{
            ProfileAboutString.isFirstTimeBottomConstraint = false
            print("About")
            AddAbout()
        }
    }
}
extension ProfileAboutTVCell : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblEducation{
            return userProfileData?.educations?.count ?? 0
        }else{
            return userProfileData?.experiences?.count ?? 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblEducation{
            let cell = tblEducation.dequeueReusableCell(withIdentifier: "EducationTVCell") as! EducationTVCell
            cell.lblSchool_companyName.text = userProfileData?.educations?[indexPath.row].user_edu_major
            edu_id = userProfileData?.educations?[indexPath.row].edu_id ?? 0
            cell.lblPosition.text = userProfileData?.educations?[indexPath.row].user_edu_degree
            if userProfileData?.educations?[indexPath.row].edu_present == 1{
                cell.lblTotalTimeDate.text = (userProfileData?.educations?[indexPath.row].edu_from_date)! + " - Presently"
            }else{
                cell.lblTotalTimeDate.text = (userProfileData?.educations?[indexPath.row].edu_from_date)! + " - " + (userProfileData?.educations?[indexPath.row].edu_to_date)!
            }
            cell.viewEdit.isHidden = true
            cell.viewDelete.isHidden = true
            cell.btnEditOutlet.addTarget(self, action: #selector(editEducationAction), for: .touchUpInside)
            cell.btnDeleteOutlet.addTarget(self, action: #selector(deleteEducationAction), for: .touchUpInside)
            cell.btnEditOutlet.tag = indexPath.row
            cell.btnDeleteOutlet.tag = indexPath.row

            return cell

        }else{
            let cell = tblExperience.dequeueReusableCell(withIdentifier: "ExperienceTVCell") as! ExperienceTVCell
            cell.lblSchool_companyName.text = userProfileData?.experiences?[indexPath.row].user_work_title
            cell.lblPosition.text = userProfileData?.experiences?[indexPath.row].user_work_place
            exp_id = userProfileData?.experiences?[indexPath.row].exp_id ?? 0
            if userProfileData?.experiences?[indexPath.row].user_work_present == 1{
                cell.lblTotalTimeDate.text = (userProfileData?.experiences?[indexPath.row].user_work_from_date)! + " - Presently"
            }else{
                cell.lblTotalTimeDate.text = (userProfileData?.experiences?[indexPath.row].user_work_from_date)! + " - " + (userProfileData?.experiences?[indexPath.row].user_work_to_date)!
            }
            cell.viewEdit.isHidden = true
            cell.viewDelete.isHidden = true
            cell.btnEditOutlet.addTarget(self, action: #selector(editExperienceAction), for: .touchUpInside)
            cell.btnDeleteOutlet.addTarget(self, action: #selector(deleteExperienceAction), for: .touchUpInside)
            cell.btnEditOutlet.tag = indexPath.row
            cell.btnDeleteOutlet.tag = indexPath.row

         //   cell.layoutIfNeeded()

            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    @objc  func editEducationAction(_ sender: UIButton) {
        let obj = userProfileData?.educations?[sender.tag]
        ProfileAboutString.edu_ActionType = "Edit"
        delegate.editEducation(eduSchoolName: obj?.user_edu_major ?? "", eduDegree: obj?.user_edu_degree ?? "", eduStartDatr: obj?.edu_from_date ?? "", eduEndDate: obj?.edu_to_date ?? "", eduPresent: obj?.edu_present ?? 0, eduId: obj?.edu_id ?? 0)
    }
    
    @objc  func deleteEducationAction(_ sender: UIButton) {
      //  let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:self.tblExperience)
        let obj = userProfileData?.educations?[sender.tag]
        ProfileAboutString.isFirstTimeBottomConstraint = true
        DeleteEducation(eduid: obj?.edu_id ?? 0)
    }
    
    @objc  func editExperienceAction(_ sender: UIButton) {
        let obj = userProfileData?.experiences?[sender.tag]
        ProfileAboutString.exp_ActionType = "Edit"
        
        delegate.editExperience(expWorkTitle: obj?.user_work_title ?? "", expCompanyName: obj?.user_work_place ?? "", expStartDatr: obj?.user_work_from_date ?? "", expEndDate: obj?.user_work_to_date ?? "", expPresent: obj?.user_work_present ?? 0, expId: obj?.exp_id ?? 0)
    }
    
    @objc  func deleteExperienceAction(_ sender: UIButton) {
        let obj = userProfileData?.experiences?[sender.tag]
        DeleteExperience(exp_id: obj?.exp_id ?? 0)
    }
}
//extension ProfileAboutTVCell: UITextViewDelegate{
//
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if txtvwExperience.textColor == UIColor.lightGray {
//            txtvwExperience.text = nil
//            txtvwExperience.textColor = UIColor.black
//        }
//        if txtvwCompanyName.textColor == UIColor.lightGray {
//            txtvwCompanyName.text = nil
//            txtvwCompanyName.textColor = UIColor.black
//        }
//        if txtSchoolName.textColor == UIColor.lightGray {
//            txtSchoolName.text = nil
//            txtSchoolName.textColor = UIColor.black
//        }
//        if txtDegreeName.textColor == UIColor.lightGray {
//            txtDegreeName.text = nil
//            txtDegreeName.textColor = UIColor.black
//        }
//        if aboutTV.textColor == UIColor.lightGray {
//            txtvwCompanyName.text = nil
//            txtvwCompanyName.textColor = UIColor.black
//        }
//    }
//
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if txtvwExperience.text.isEmpty{
//            txtvwExperience.text = "Experience"
//            txtvwExperience.textColor = UIColor.lightGray
//        }
//        if txtvwCompanyName.text.isEmpty{
//            txtvwCompanyName.text = "Company Name"
//            txtvwCompanyName.textColor = UIColor.lightGray
//        }
//        if txtSchoolName.text.isEmpty{
//            txtSchoolName.text = "School/Collage Name"
//            txtSchoolName.textColor = UIColor.lightGray
//        }
//        if txtDegreeName.text.isEmpty{
//            txtDegreeName.text = "Degree"
//            txtDegreeName.textColor = UIColor.lightGray
//        }
//        if aboutTV.text.isEmpty {
//            textView.text = "Write about yourself"
//            textView.textColor = UIColor.lightGray
//        }
//    }
//}
extension ProfileAboutTVCell:DatePickerViewDelegate{
    func dobDoneTapped(value: String) {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = DateFormatterConstant.kMM_dd_yyyy//kdateyyyy_dd_mm

        if selectDateFor == "Expreience Start Date"{

            let showStartDate = inputFormatter.date(from: value)
            inputFormatter.dateFormat = DateFormatterConstant.kdateyyyy_mm_dd
            let resultString = inputFormatter.string(from: showStartDate!)
            btnOutletStartDate.setTitle(resultString, for: .normal)
            btnOutletStartDate.setTitleColor(.black, for: .normal)
            
        }else if selectDateFor == "Expreience End Date"{
            
            let showEndDate = inputFormatter.date(from: value)
            inputFormatter.dateFormat = DateFormatterConstant.kdateyyyy_mm_dd
            let resultString = inputFormatter.string(from: showEndDate!)
            btnOutletEndDate.setTitle(resultString, for: .normal)
            exp_endDate = resultString
            ProfileAboutString.exp_Present = 0
            btnOutletEndDate.setTitleColor(.black, for: .normal)
       
        }else if selectDateFor == "Education Start Date"{
            
            let showStartDate = inputFormatter.date(from: value)
            inputFormatter.dateFormat = DateFormatterConstant.kdateyyyy_mm_dd
            let resultString = inputFormatter.string(from: showStartDate!)
            btnOutletEducationStartDate.setTitle(resultString, for: .normal)
            btnOutletEducationStartDate.setTitleColor(.black, for: .normal)
       
        }else if selectDateFor == "Education End Date"{
            
            let showEndDate = inputFormatter.date(from: value)
            inputFormatter.dateFormat = DateFormatterConstant.kdateyyyy_mm_dd
            let resultString = inputFormatter.string(from: showEndDate!)
            btnOutletEducationEndDate.setTitle(resultString, for: .normal)
            edu_endDate = resultString
            ProfileAboutString.edu_Present = 0
            btnOutletEducationEndDate.setTitleColor(.black, for: .normal)
        }
        ProfileAboutString.isFirstTimeBottomConstraint = true
        viewCntrl?.viewDidLoad()
    }
    
    func dobCancelTapped() {
        
    }
    
    
}
//Api call
extension ProfileAboutTVCell {
    
    func AddEducation() {
        KRProgressHUD.show()
        if ProfileAboutString.edu_ActionType == "Add"{
            edu_id += 1
            print(edu_id)
        }else if ProfileAboutString.edu_ActionType == ""{
            ProfileAboutString.edu_ActionType = "Add"
        }
        
        
        let parameters: [String: Any] = [
            "action" : "addEditEducation",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "action_name" : ProfileAboutString.edu_ActionType,//"Edit"
            "user_edu_major" : txtSchoolName.text ?? "",
            "user_edu_degree" : txtDegreeName.text ?? "",
            "edu_from_date" : btnOutletEducationStartDate.currentTitle ?? "",
            "edu_present" : ProfileAboutString.edu_Present,
            "edu_to_date" : edu_endDate,
            "edu_id" : edu_id
         ]
       
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                KRProgressHUD.dismiss()
              
              if let respValuev = response.value as?[String:Any] {
                let status = respValuev["status"] as? Bool
                if status == true{
                    self.viewEducationSubmit.isHidden = true
                    self.viewEducationDateView.isHidden = true
                    self.getAbout()
                    ProfileAboutString.isFirstTimeBottomConstraint = true
                    self.viewCntrl?.viewDidLoad()
                }
                }
                                
            }
        
    }
    func AddAbout() {
        KRProgressHUD.show()
        
        let parameters: [String: Any] = [
            "action" : "update_user_profile",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "action_name" : "biography",
            "user_biography" : aboutTV.text ?? ""
         ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                KRProgressHUD.dismiss()
              
              if let respValuev = response.value as?[String:Any] {
                let status = respValuev["status"] as? Bool
                if status == true{
                    self.btnSubmit.isHidden = true
                    self.getAbout()
                    self.viewCntrl?.viewDidLoad()
                }
                }
                                
            }
        
    }
    func AddExperience() {
        KRProgressHUD.show()
        if ProfileAboutString.exp_ActionType == "Add"{
                   exp_id += 1
                   print(exp_id)
        }else if ProfileAboutString.exp_ActionType == ""{
            ProfileAboutString.exp_ActionType = "Add"
        }
               
        
        let parameters: [String: Any] = [
            "action" : "addEditExperience",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "action_name" : ProfileAboutString.exp_ActionType,//"Edit"
            "user_work_title" : txtvwExperience.text ?? "",
            "user_work_place" : txtvwCompanyName.text ?? "",
            "user_work_from_date" : btnOutletStartDate.currentTitle ?? "",
            "user_work_present" : ProfileAboutString.exp_Present,
            "user_work_to_date" : exp_endDate,
            "exp_id" : exp_id
         ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                KRProgressHUD.dismiss()
              
              if let respValuev = response.value as?[String:Any] {
                let status = respValuev["status"] as? Bool
                if status == true{
                    self.viewExpwerienceSubmit.isHidden = true
                    self.viewExperienceDateView.isHidden = true
                   // self.getAbout()
                    self.viewCntrl?.viewDidLoad()
                }
                }
                                
            }
        
    }

    func DeleteEducation(eduid:Int) {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "deleteEducation",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "edu_id" : eduid
         ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                KRProgressHUD.dismiss()
              
              if let respValuev = response.value as?[String:Any] {
                let status = respValuev["status"] as? Bool
                if status == true{
                    self.viewExpwerienceSubmit.isHidden = true
                    self.viewExperienceDateView.isHidden = true
                    self.tblEducation.reloadData()

                    //self.getAbout()
                    self.viewCntrl?.viewDidLoad()
                }
                }
                                
            }
    }
    func DeleteExperience(exp_id:Int) {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "deleteExperience",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "exp_id" : exp_id
         ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                KRProgressHUD.dismiss()
              
              if let respValuev = response.value as?[String:Any] {
                let status = respValuev["status"] as? Bool
                if status == true{
                    self.viewExpwerienceSubmit.isHidden = true
                    self.viewExperienceDateView.isHidden = true
                    self.tblExperience.reloadData()
                    //self.getAbout()
                    self.viewCntrl?.viewDidLoad()
                }
                }
                                
            }
        
    }
    func AddIntrest(){
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "update_user_profile",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "action_name" : "profile_sli",
            "user_interests" : txtvwAddIntrests.text ?? ""
         ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                KRProgressHUD.dismiss()
              
              if let respValuev = response.value as?[String:Any] {
                let status = respValuev["status"] as? Bool
                if status == true{
                    self.txtvwAddIntrests.isHidden = true
                    self.viewIntrestSubmit.isHidden = true
                   self.txtvwAddIntrests.text = ""
                    self.lblIntrests.isHidden = false
                    self.btnEditIntrestsOutlet.isSelected = true
                    self.btnEditIntrestsOutlet.setImage(#imageLiteral(resourceName: "pencil"), for: .normal)
                   // self.getAbout()
                    self.btnEditIntrestsOutlet.isSelected = false
                    self.viewCntrl?.viewDidLoad()
                }
                }
                                
            }
        
    }
    func addLanguage(){
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "update_user_profile",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "action_name" : "profile_sli",
            "user_languages" : txtvwAddLanguage.text ?? ""
         ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                KRProgressHUD.dismiss()
              print(response)
                if let respValuev = response.value as?[String:Any] {
                let status = respValuev["status"] as? Bool
                if status == true{
                    self.txtvwAddLanguage.isHidden = true
                    self.viewLanguageSubmit.isHidden = true
                   self.txtvwAddLanguage.text = ""
                    self.lblLanguage.isHidden = false
                    self.btnEditLanguageOutlet.isSelected = true
                    self.btnEditLanguageOutlet.setImage(#imageLiteral(resourceName: "pencil"), for: .normal)
                 //   self.getAbout()
                    self.btnEditLanguageOutlet.isSelected = false
                    self.viewCntrl?.viewDidLoad()
                }
                }
                                
            }
        
    }
    func addSkill(){
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "update_user_profile",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
            "action_name" : "profile_sli",
            "user_skills" : txtvwAddSkill.text ?? ""
         ]
        print(parameters)
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                KRProgressHUD.dismiss()
              
              if let respValuev = response.value as?[String:Any] {
                let status = respValuev["status"] as? Bool
                if status == true{
                    self.txtvwAddSkill.isHidden = true
                    self.viewSkillSubmit.isHidden = true
                   self.txtvwAddSkill.text = ""
                    self.lblSkills.isHidden = false
                    self.btnEditSkillOutlet.isSelected = true
                    self.btnEditSkillOutlet.setImage(#imageLiteral(resourceName: "pencil"), for: .normal)
                   // self.getAbout()
                    self.btnEditSkillOutlet.isSelected = false
                    self.viewCntrl?.viewDidLoad()
                }
                }
                                
            }
        
    }
    func getAbout() {
        KRProgressHUD.show()
        let parameters: [String: Any] = [
            "action" : "getUserData",
            "user_id" : UserSessionManager.shared.getUserId() ?? "",
        ]
        let urlString = AppConstants.BASE_URL
        let url = URL.init(string: urlString)
        
        AF.request(url!, method: .post, parameters: parameters)
            .responseJSON { response in
                //to get status code
                KRProgressHUD.dismiss()
                guard let dataResponse = response.data else {
                    print("Response Error")
                    return }
                self.userProfileData = nil
                do
                                {
                                    let objRes: ProfileModel = try JSONDecoder().decode(ProfileModel.self, from: dataResponse)
                                    self.userProfileData = objRes
                                    self.tableViewExperienceHeight = 0
                                    self.tableViewEdicationHeight = 0
                                    self.setData(userData: self.userProfileData)
                                    self.tblEducation.beginUpdates()
                                    self.tblEducation.endUpdates()
                                    self.tblExperience.beginUpdates()
                                    self.tblExperience.endUpdates()
                                    self.tableViewMain.beginUpdates()
                                    self.tableViewMain.endUpdates()

                                } catch let error{
                                    print(error)
                                }
            }
        
    }
}


