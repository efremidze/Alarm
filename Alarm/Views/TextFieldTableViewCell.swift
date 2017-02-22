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

class FloatingTextField: SkyFloatingLabelTextField {
    
//    override func editingRect(forBounds bounds: CGRect) -> CGRect {
//        var rect = super.textRect(forBounds: bounds)
//        rect.origin.y = 0
//        rect.size.height = bounds.size.height
//        return rect
//    }
    
//    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
//        var rect = super.placeholderRect(forBounds: bounds)
//        rect.origin.y = 0
//        rect.size.height = bounds.height
//        return rect
//    }
    
}
