//
//  SharedExtensions.swift
//  Alarm
//
//  Created by Lasha Efremidze on 2/24/17.
//  Copyright © 2017 Lasha Efremidze. All rights reserved.
//

import UIKit

let Defaults = UserDefaults.standard

extension UserDefaults {
    
    subscript(key: String) -> Any? {
        get { return object(forKey: key) }
        set { set(newValue, forKey: key) }
    }
    
    func once(_ key: String, block: () -> ()) {
        if !bool(forKey: key) {
            self[key] = true
            block()
        }
    }
    
}

let NC = NotificationCenter.default

extension Notification.Name {
    static let alarmsChanged = Notification.Name("alarm.changed")
}

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

enum Constants {
    static let defaultTitle = "It’s 4:20!"
    static let scheduledAlarm = "alarm.schedule"
}
