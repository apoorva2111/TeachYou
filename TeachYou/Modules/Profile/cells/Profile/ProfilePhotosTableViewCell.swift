//
//  ProfilePhotosTableViewCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 23/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

class ProfilePhotosTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionPhoto: UICollectionView!
    @IBOutlet weak var collectionPhotoHeightConstraint: NSLayoutConstraint!
    var arrPhotoDict = [NSDictionary]()
    var delegate: FeedCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionPhoto.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setPhotos(arrPhoto:[NSDictionary])  {
        arrPhotoDict = arrPhoto
        collectionPhoto.delegate = self
        collectionPhoto.dataSource = self
        collectionPhoto.reloadData()
    }
  
}
extension ProfilePhotosTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPhotoDict.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionPhoto.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        let objDict = arrPhotoDict[indexPath.row]
        let strImage = objDict["source"] as! String
        let url = "https://teachyou.in/content/uploads/" + strImage
        cell.imgPhotos.sd_setImage(with: URL(string: url), placeholderImage: #imageLiteral(resourceName: "New Project"))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionPhoto.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
    }
    

    override func layoutSubviews() {

        self.collectionPhoto.collectionViewLayout.invalidateLayout()
   
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let objDict = arrPhotoDict[indexPath.row]
        let strImage = objDict["source"] as! String
        let url = "https://teachyou.in/content/uploads/" + strImage
        delegate?.expandImgAction(urlStr: url)
    }
    


    
}
