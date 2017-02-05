//
//  UIColorExtensions.swift
//  Alarm
//
//  Created by Lasha Efremidze on 2/5/17.
//  Copyright © 2017 Lasha Efremidze. All rights reserved.
//

import UIKit

private extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1)
    }
    
    //    class var weedGreen: UIColor {
    //        return UIColor(red: 120, green: 185, blue: 60)
    //    }
    
    //    class var weedGreen: UIColor {
    //        return UIColor(red: 180, green: 236, blue: 81)
    //    }
    
    class var weedGreen: UIColor {
        return UIColor(red: 66, green: 147, blue: 33)
    }
    
}
