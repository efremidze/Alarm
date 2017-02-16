//
//  UIColorExtensions.swift
//  Alarm
//
//  Created by Lasha Efremidze on 2/5/17.
//  Copyright © 2017 Lasha Efremidze. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1)
    }
    
    class var dark: UIColor {
        return UIColor(white: 0.22, alpha: 1)
    }
    
    class var weedGreen: UIColor {
        return UIColor(red: 45, green: 194, blue: 109)
    }
    
}
