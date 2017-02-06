//
//  ViewController.swift
//  Alarm
//
//  Created by Lasha Efremidze on 1/9/17.
//  Copyright © 2017 Lasha Efremidze. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let items: [Item] = [Item.make(title: "4:20 AM", subtitle: nil, type: .am), Item.make(title: "4:20 PM", subtitle: nil, type: .pm), Item.make(title: "4/20", subtitle: nil, type: .day)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.backgroundColor = .weedGreen
//        self.navigationController?.isNavigationBarHidden = true
//        self.navigationController?.navigationBar.barTintColor = .weedGreen
//        self.navigationController?.navigationBar.tintColor = .white
//        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationItem.title = "420!"
        
        self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "pattern")!)
        self.tableView.tableHeaderView = UIImageView(image: UIImage(named: "header"))
        self.tableView.tableFooterView = UIView()
        
        Alarm.start { accepted, error in
            if !accepted {
                print("Notification access denied.")
            }
        }
    }
    
}

// MARK: - UITableViewDataSource
extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = String(describing: SwitchTableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? SwitchTableViewCell ?? SwitchTableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        let item = items[indexPath.row]
        
        cell.selectionStyle = .none
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        item.type.isScheduled { scheduled in
            cell.switchView.isOn = scheduled
        }
        cell.valueChanged = { switchView in
            if switchView.isOn {
                item.type.schedule(title: "420 Get High 🙃") { error in }
            } else {
                item.type.unschedule()
            }
        }
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension ViewController {

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Scheduled Alarms"
    }
    
}

//private class Cell: UITableViewCell {
//    
//    lazy var datePicker: UIDatePicker = { [unowned self] in
//        let picker = UIDatePicker()
//        picker.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
//        self.contentView.addSubview(picker)
//        return picker
//    }()
//    
//    var valueChangedBlock: ((UIDatePicker) -> ())?
//    
//    @objc @IBAction func valueChanged(_ sender: UIDatePicker) {
//        valueChangedBlock?(sender)
//    }
//    
//}

private class SwitchTableViewCell: UITableViewCell {
    
    lazy var switchView: UISwitch = { [unowned self] in
        let view = UISwitch()
        view.addTarget(self, action: #selector(_valueChanged), for: .valueChanged)
        self.accessoryView = view
        return view
    }()
    
    var valueChanged: ((UISwitch) -> Void)?
    
    @IBAction func _valueChanged(sender: UISwitch) {
        self.valueChanged?(sender)
    }
    
}
