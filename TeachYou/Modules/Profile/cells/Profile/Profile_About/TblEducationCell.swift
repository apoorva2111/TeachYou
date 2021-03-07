//
//  TblEducationCell.swift
//  TeachYou
//
//  Created by Apoorva Gangrade on 06/03/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class TblEducationCell: UITableViewCell {
    @IBOutlet weak var tblEducation: UITableView!
    var number: Int!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.tblEducation.register(UINib(nibName: "EducationTVCell", bundle: nil), forCellReuseIdentifier: "EducationTVCell")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension TblEducationCell :UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if nil == number {
            number = 1 + Int(arc4random_uniform(UInt32(10 - 1 + 1)))
        }
        return number
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EducationTVCell", for: indexPath) as! EducationTVCell
//            cell.setupData(number: indexPath.row)
        cell.layoutIfNeeded()
        return cell
    }
}
