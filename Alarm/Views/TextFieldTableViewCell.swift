//
//  TextFieldTableViewCell.swift
//  Alarm
//
//  Created by Lasha Efremidze on 2/8/17.
//  Copyright © 2017 Lasha Efremidze. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class TextFieldTableViewCell: UITableViewCell {
    
    lazy var textField: SkyFloatingLabelTextField = { [unowned self] in
        let textField = SkyFloatingLabelTextField()
        textField.addTarget(self, action: #selector(_editingChanged), for: .editingChanged)
        self.contentView.addSubview(textField)
        textField.constrainToEdges({
            var inset = self.separatorInset
            inset.top = 4
            return inset
        }())
        return textField
    }()
    
    var editingChanged: ((UITextField) -> Void)?
    
    @IBAction func _editingChanged(sender: UITextField) {
        self.editingChanged?(sender)
    }
    
}
