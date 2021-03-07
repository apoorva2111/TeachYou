//
//  AboutTVCell.swift
//  TeachYou
//
//  Created by Apoorva Gangrade on 06/03/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class AboutTVCell: UITableViewCell {
    @IBOutlet weak var tblAbout: UITableView!
 
    var number: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.tblAbout.register(UINib(nibName: "TblEducationCell", bundle: nil), forCellReuseIdentifier: "TblEducationCell")

        tblAbout.delegate = self
        tblAbout.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension AboutTVCell : UITableViewDelegate , UITableViewDataSource{

        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "TblEducationCell", for: indexPath) as! TblEducationCell
//            cell.setupData(number: indexPath.row)
            cell.layoutIfNeeded()
            return cell
        }
    }

