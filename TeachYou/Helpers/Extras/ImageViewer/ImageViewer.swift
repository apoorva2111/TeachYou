//
//  ImageViewer.swift
//  Al-Anon
//
//  Created by Rnf-Yogita on 23/02/20.
//  Copyright © 2020 Rnf-Yogita. All rights reserved.
//

import UIKit

class ImageViewer: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var constraintHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        
    }
    
    class func instanceFromNib() -> ImageViewer
    {
        let view = UINib(nibName: "ImageViewer", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ImageViewer
        return view
    }
    
    func setData(url:String){
        imageView.imageFromServerURL(urlString: url) { (image) in
            self.constraintHeight.constant =  Utilities.calculateImageViewSize(image: self.imageView.image ?? UIImage(), view: self.imageView).height
            self.layoutIfNeeded()
            self.layoutSubviews()
        }
    }
    
    @IBAction func crossButtontapped(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    
}
