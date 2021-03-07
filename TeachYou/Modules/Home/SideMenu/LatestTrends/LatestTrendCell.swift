//
//  LatestTrendCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 29/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

protocol LatestTrendCellDelegate {
    func viewMoreAction(id: Int, title: String, index: Int)
    func expandImgAction(urlStr: String)
}

class LatestTrendCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imgVw: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnViewMore: UIButton!
    
    var delegate: LatestTrendCellDelegate?
    var trendId: Int?
    var trendTitle : String?
    var trendData: LatestTrendsData?{
        didSet{
            guard let tdata = trendData else{return}
            self.setCellData(data: tdata)
        }
    }
    var sIndex = 0
    var imageUrlString:String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bgView.roundCornerWithShadow(shadowColor: .lightGray, radius: 5, borderWidth: 0, borderColor: .clear, shadowOpacity: 1, shadowRadius: 2, shadowOffsetWidth: 2, shadowOffsetHeight: 2)
    }
    
    func setCellData(data: LatestTrendsData) {
        self.lblTitle.text = data.heading ?? ""
        self.lblDescription.text = data.description ?? ""
        let urlStr = AppConstants.BASE_TRENDING_UPLOAD_URL + "/" + (data.image ?? "")
        print(urlStr)
        self.imageUrlString = urlStr
        self.imgVw.imageFromServerURL(urlString: urlStr) { (image) in }
        self.trendId = data.what_id ?? 0
        self.trendTitle = data.heading ?? ""
//        self.trendData = data
    }
    
    @IBAction func viewMoreTapped(_ sender: UIButton) {
        delegate?.viewMoreAction(id: self.trendId ?? 0, title: self.trendTitle ?? "", index: self.sIndex ?? 0)
    }
    
    @IBAction func imageTapped(_ sender: UIButton){
//        self.delegate?.expandImgAction(urlStr: self.imageUrlString)
    }
    
    
}
