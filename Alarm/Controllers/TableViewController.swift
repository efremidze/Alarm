//
//  TableViewController.swift
//  Alarm
//
//  Created by Lasha Efremidze on 2/8/17.
//  Copyright © 2017 Lasha Efremidze. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let items: [Item] = [Item.make(title: "4:20 AM", subtitle: nil, type: .am), Item.make(title: "4:20 PM", subtitle: nil, type: .pm), Item.make(title: "4/20", subtitle: nil, type: .day)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "pattern")!)
        self.tableView.tableHeaderView = {
            let view = UIView()
            view.frame.size.height = 150
            let imageView = UIImageView(image: UIImage(named: "weed"))
            imageView.tintColor = .weedGreen
            view.addSubview(imageView)
            imageView.constrain {[
                $0.centerXAnchor.constraint(equalTo: $0.superview!.centerXAnchor),
                $0.centerYAnchor.constraint(equalTo: $0.superview!.centerYAnchor, constant: 25)
            ]}
            return view
        }()
        self.tableView.tableFooterView = UIView()
    }
    
}

// MARK: - UITableViewDataSource
extension TableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = String(describing: SwitchTableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? SwitchTableViewCell ?? SwitchTableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        let item = items[indexPath.row]
        
        cell.selectionStyle = .none
        cell.imageView?.image = UIImage(named: item.type.rawValue)
        cell.imageView?.contentMode = .center
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        item.type.isScheduled { scheduled in
            cell.switchView.isOn = scheduled
        }
        cell.valueChanged = { switchView in
            if switchView.isOn {
                item.type.schedule(title: Constants.defaultTitle) { error in }
            } else {
                item.type.unschedule()
            }
        }
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension TableViewController {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Scheduled Alarms"
    }
    
}
