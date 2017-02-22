//
//  TableViewController.swift
//  Alarm
//
//  Created by Lasha Efremidze on 2/8/17.
//  Copyright © 2017 Lasha Efremidze. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let items: [Item] = [Item.make(title: "4:20 AM", subtitle: nil, type: .am), Item.make(title: "4:20 PM", subtitle: nil, type: .pm), Item.make(title: "April 20", subtitle: nil, type: .day)]
    
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
        self.tableView.keyboardDismissMode = .interactive
        
        Alarm.start { accepted, error in
            if accepted {
                Once("Alarm.scheduled") {
                    AlarmType.pm.schedule { error in
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            } else {
                print("Notification access denied.")
            }
        }
    }
    
}

// MARK: - UITableViewDataSource
extension TableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return items.count
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let reuseIdentifier = String(describing: SwitchTableViewCell.self)
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? SwitchTableViewCell ?? SwitchTableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
            let item = items[indexPath.row]
            cell.selectionStyle = .none
            cell.imageView?.image = UIImage(named: item.type.rawValue)
            cell.imageView?.contentMode = .center
            cell.imageView?.tintColor = .weedGreen
            cell.textLabel?.text = item.title
            cell.textLabel?.textColor = .dark
            cell.textLabel?.font = .preferredFont(forTextStyle: .body)
            cell.detailTextLabel?.text = item.subtitle
            item.type.isScheduled { scheduled in
                cell.switchView.isOn = scheduled
            }
            cell.valueChanged = { switchView in
                if switchView.isOn {
                    item.type.schedule { error in }
                } else {
                    item.type.unschedule()
                }
            }
            return cell
//        case 1:
//            let reuseIdentifier = String(describing: TextFieldTableViewCell.self)
//            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? TextFieldTableViewCell ?? TextFieldTableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
//            cell.textField.placeholder = "Title";
//            cell.textField.text = Constants.defaultTitle
//            cell.textField.font = .preferredFont(forTextStyle: .body)
//            cell.textField.textColor = .dark
//            cell.textField.lineColor = .clear
//            cell.textField.selectedLineColor = .clear
//            cell.textField.titleColor = .weedGreen
//            cell.textField.selectedTitleColor = .weedGreen
//            cell.textField.lineHeight = 0
//            cell.textField.selectedLineHeight = 0
//            cell.editingChanged = { textField in
//                print(textField.text)
//            }
//            return cell
        default:
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = "Send Feedback"
            return cell
        }
    }
    
}

// MARK: - UITableViewDelegate
extension TableViewController {
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            cell.separatorInset.left = 54
            cell.preservesSuperviewLayoutMargins = false
            cell.layoutMargins = UIEdgeInsets()
        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Scheduled Alarms"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case 1:
            HelpshiftSupport.showFAQs(self.parent!, with: nil)
        default:
            break
        }
    }
    
}
