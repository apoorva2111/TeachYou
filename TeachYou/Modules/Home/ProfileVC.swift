//
//  ProfileVC.swift
//  TeachYou
//
//  Created by Kriti Agarwal on 01/12/20.
//  Copyright © 2020 KritiAgarwal. All rights reserved.
//

import UIKit

struct Section {
  var name: String
  var items: [String]
  var collapsed: Bool
    
  init(name: String, items: [String], collapsed: Bool = false) {
    self.name = name
    self.items = items
    self.collapsed = collapsed
  }
}


class ProfileVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    
    var sections = [
      Section(name: "Mac", items: [""]),
      Section(name: "", items: ["Discussion", "About", "Articles", "Events", "Friends", "Photos", "Videos"]),
      Section(name: "iPhone", items: ["iPhone 7", "iPhone 6"]),
      Section(name: "Mac", items: ["MacBook", "MacBook Air"]),
      Section(name: "iPad", items: ["iPad Pro", "iPad Air 2"]),
      Section(name: "iPhone", items: ["iPhone 7", "iPhone 6"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.estimatedRowHeight = 44.0
        tableview.rowHeight = UITableView.automaticDimension
    }
    

}


extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].collapsed ? 0 : sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell? ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = sections[indexPath.section].items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")

        header.titleLabel.text = sections[section].name
        header.arrowLabel.text = ">"
        header.setCollapsed(sections[section].collapsed)

        header.section = section
        header.delegate = self

        return header
    }
    
    private func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 1 {
            return 0
        } else {
            return 50
        }
    }
    
}


extension ProfileVC: CollapsibleTableViewHeaderDelegate {

    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
    let collapsed = !sections[section].collapsed
        
    // Toggle collapse
    sections[section].collapsed = collapsed
    header.setCollapsed(collapsed)
    
    // Reload the whole section
    tableview.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
  }
}



protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int)
}

class CollapsibleTableViewHeader: UITableViewHeaderFooterView {
    let titleLabel = UILabel()
    let arrowLabel = UILabel()
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CollapsibleTableViewHeader.tapHeader(_:))))
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowLabel)
        contentView.backgroundColor = #colorLiteral(red: 0.1803921569, green: 0.2235294118, blue: 0.2666666667, alpha: 1)

        let marginGuide = contentView.layoutMarginsGuide

        // Arrow label
        contentView.addSubview(arrowLabel)
        arrowLabel.textColor = UIColor.white
        arrowLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowLabel.widthAnchor.constraint(equalToConstant: 12).isActive = true
        arrowLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        arrowLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        arrowLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true

        // Title label
        contentView.addSubview(titleLabel)
        titleLabel.textColor = UIColor.white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    }
    
    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CollapsibleTableViewHeader else {
            return
        }
        delegate?.toggleSection(self, section: cell.section)
    }
    
    func setCollapsed(_ collapsed: Bool) {
        // Animate the arrow rotation (see Extensions.swf)
//        arrowLabel.rotate(collapsed ? 0.0 : .pi / 2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
