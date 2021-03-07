//
//  ImagePreviewViewController.swift
//  Al-Anon
//
//  Created by Resourcifi-Kriti on 02/03/20.
//  Copyright © 2020 Rnf-Yogita. All rights reserved.
//

import UIKit
import SDWebImage

protocol TransferImage: class {
    func sendImageToPreviousView(image: UIImage)
}


class ImagePreviewViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!

    var img: UIImage!
    var imgStr = ""
    weak var transferDatadelegate: TransferImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        imgView.imageFromServerURL(urlString: imgStr) { (image) in
//
//        }
        let viewHeight: CGFloat = scrollView.frame.size.height
        let viewWidth: CGFloat = scrollView.frame.size.width

        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        var xPostion: CGFloat = 0
     
        let view = UIView(frame: CGRect(x: xPostion, y: 0, width: viewWidth + 20, height: viewHeight))
        xPostion += viewWidth
        let imageView = ImageViewZoom(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        imageView.setup()
        imageView.imageScrollViewDelegate = self
        imageView.imageContentMode = .aspectFit
        imageView.initialOffset = .center
        imgView.isHidden = true
        imgView.imageFromServerURL(urlString: imgStr) { (image) in
        }
        let img = imgView.image
      
        imageView.display(image: img!)
    


        view.addSubview(imageView)
        scrollView.addSubview(view)
      
        scrollView.contentSize = CGSize(width: xPostion, height: viewHeight)
        self.view.addSubview(scrollView)

    }
    
    @IBAction func closeBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension ImagePreviewViewController: ImageViewZoomDelegate {
    func imageScrollViewDidChangeOrientation(imageViewZoom: ImageViewZoom) {
        print("Did change orientation")
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print("scrollViewDidEndZooming at scale \(scale)")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollViewDidScroll at offset \(scrollView.contentOffset)")
    }
}
