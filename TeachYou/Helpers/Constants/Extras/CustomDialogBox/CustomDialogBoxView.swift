//
//  CustomDialogBoxView.swift
//  HustleUp
//
//  Created by RNF-IOS-Yogita on 29/07/19.
//  Copyright © 2019 Rahul. All rights reserved.
//

import UIKit

protocol DialogueViewDelegate : class {
    func okTapped()
}

class CustomDialogBoxView: UIView {

    weak var delegate : DialogueViewDelegate?

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var viewDialog: UIView!
    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var buttonDelete: UIButton!
    @IBOutlet weak var buttonCross: UIButton!
    @IBOutlet weak var buttonOk: UIButton!

    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func awakeFromNib() {
        viewDialog.roundCornerWithShadow(shadowColor: UIColor.black, radius: 17, borderWidth: 1, borderColor: UIColor.clear, shadowOpacity: 1, shadowRadius: 6, shadowOffsetWidth: 0, shadowOffsetHeight: 6,clipsbounds: true)
        //viewBottom.roundTwoCorners(corners:[.bottomLeft,.bottomRight], radius: 17)
        
    }
    
    class func instanceFromNib() -> CustomDialogBoxView
    {
        let view = UINib(nibName: "CustomDialogBoxView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomDialogBoxView
        return view
    }
    
    func setData(text:String){
        labelDescription.text = text
        changecolor()
    }
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        delegate?.okTapped()
        self.removeFromSuperview()

    }
    
    func changecolor(){
        let main_string = labelDescription.text
        let string_to_color = "afgmobile@al-anon.org"

        let range = (main_string as! NSString).range(of: string_to_color)

        let attribute = NSMutableAttributedString.init(string: main_string ?? "")
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: colorConstant.k_LightBlue , range: range)
        labelDescription.attributedText = attribute
    
}

}
