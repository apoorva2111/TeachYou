//
//  SearchViewController.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 01/02/21.
//  Copyright © 2021 KritiAgarwal. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var btnCollection: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.roundCornerWithShadow(shadowColor: .clear, radius: 15, borderWidth: 0.75, borderColor: #colorLiteral(red: 0.5832950473, green: 0, blue: 0.1457252502, alpha: 1), shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        for each in btnCollection {
            each.roundCornerWithShadow(shadowColor: .clear, radius: 15, borderWidth: 0.75, borderColor: #colorLiteral(red: 0.5832950473, green: 0, blue: 0.1457252502, alpha: 1), shadowOpacity: 0, shadowRadius: 0, shadowOffsetWidth: 0, shadowOffsetHeight: 0, clipsbounds: true)
        }
    }

}
