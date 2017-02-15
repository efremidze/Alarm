//
//  SwitchTableViewCell.swift
//  Alarm
//
//  Created by Lasha Efremidze on 2/8/17.
//  Copyright © 2017 Lasha Efremidze. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView?.frame.origin.x = 8
        imageView?.frame.size = CGSize(width: 38, height: 38)
        imageView?.center.y = contentView.center.y
        
        textLabel?.frame.origin.x = 54
    }
    
}
