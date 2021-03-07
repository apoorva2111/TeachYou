//
//  StoryCell.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 06/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

protocol StoryCellDelegate {
    func addStoryAction()
    func viewStoryAction()
}

class StoryCell: UITableViewCell {

    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: StoryCellDelegate?
    var selectedIndex = 0
    var storiesCount = 0
    var storyArr : [StoriesArray]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "SingleStoryCell", bundle: nil), forCellWithReuseIdentifier: "SingleStoryCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension StoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storiesCount + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleStoryCell", for: indexPath) as! SingleStoryCell
        
        if self.storyArr?.count ?? 0 > 0 {
            if indexPath.row == 0 {
                cell.addImg.isHidden = false
                cell.singleStoryCellDelegate = self
            } else {
                cell.addImg.isHidden = true
                cell.singleStoryCellDelegate = self
                cell.useRImg.imageFromServerURL(urlString: self.storyArr?[indexPath.row - 1].photo ?? "") { (image) in
                    cell.useRImg.roundCornerWithShadow(shadowColor: .clear, radius: cell.useRImg.frame.height/2, borderWidth: 0, borderColor: .clear, shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
                }
            }
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        if indexPath.row == 0 {
            delegate?.addStoryAction()
        } else {
            delegate?.viewStoryAction()
        }
    }
    
}


extension StoryCell : SingleStoryCellDelegate {
    
    func singleStoryCellAction() {
        
        if self.selectedIndex == 0 {
            delegate?.addStoryAction()
        } else {
            delegate?.viewStoryAction()
        }

    }
    
}
