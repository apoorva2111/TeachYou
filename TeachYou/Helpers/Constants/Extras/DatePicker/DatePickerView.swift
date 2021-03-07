//
//  PickerView.swift
//
//  Created by RNF-IOS-Yogita on 23/11/18.
//  Copyright © 2018 RNF-Yogita. All rights reserved.
//

import UIKit

protocol DatePickerViewDelegate : class {
    func dobDoneTapped(value:String)
    func dobCancelTapped()
}

class DatePickerView: UIView {
    
    weak var delegate : DatePickerViewDelegate?
    @IBOutlet weak var pickerBGView: UIView!
    @IBOutlet weak var pickerTitle: UILabel!
    @IBOutlet weak var pickerView: UIDatePicker!
    @IBOutlet weak var pickerBottomConstraint: NSLayoutConstraint!
    var mode = 0 // 0-Date, 1-Time
    
    
    override func awakeFromNib() {
       
    }
    
    class func instanceFromNib() -> DatePickerView
    {
        let view = UINib(nibName: "DatePickerView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! DatePickerView
        
        return view
    }
    
    func changeMode(modeType:Int){
        
        mode = modeType
        (mode == 0) ? (pickerView.datePickerMode = .date) : (pickerView.datePickerMode = .time)
    }
    
     func setMinMaxDate(){
        var components = DateComponents()
        components.year = -100
        let minDate = Calendar.current.date(byAdding: components, to: Date())

        components.year = -13
        let maxDate = Calendar.current.date(byAdding: components, to: Date())

        pickerView.minimumDate = minDate
        pickerView.maximumDate = maxDate
        
    }

    
    func showPicker() {
        if mode == 0 {
            setMinMaxDate()
        }
        self.pickerBottomConstraint.constant = -self.pickerBGView.frame.size.height
        self.layoutIfNeeded()
        UIView.animate(withDuration: Double(0.5), animations: {
            self.pickerBottomConstraint.constant = 0
            self.layoutIfNeeded()
        }) { (success) in
           
        }
    }
    
    func hidePicker() {
        self.pickerBottomConstraint.constant = 0
        self.layoutIfNeeded()
        UIView.animate(withDuration: Double(0.5), animations: {
            self.pickerBottomConstraint.constant = -self.pickerBGView.frame.size.height
            self.layoutIfNeeded()
        }) { (success) in
            self.removeFromSuperview()
           
        }
    }
    
    
    
    //MARK: ------IBAction-------

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        hidePicker()
        self.delegate?.dobCancelTapped()
        self.removeFromSuperview()
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        let dateString: String?
        if mode == 0 {
            dateFormatter.dateFormat = DateFormatterConstant.kMM_dd_yyyy
            dateString = dateFormatter.string(from: pickerView.date)
        } else {
            dateFormatter.dateFormat = DateFormatterConstant.kHHmm
            dateString = dateFormatter.string(from: pickerView.date)
        }
        self.delegate?.dobDoneTapped(value: dateString ?? "")
        hidePicker()
    }
    
}
