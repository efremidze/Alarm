//
//  FoundationExtensions.swift
//  Alarm
//
//  Created by Lasha Efremidze on 2/8/17.
//  Copyright © 2017 Lasha Efremidze. All rights reserved.
//

import Foundation

let Defaults = UserDefaults.standard

extension UserDefaults {
    
    subscript(key: String) -> Any? {
        get { return object(forKey: key) }
        set { set(newValue, forKey: key) }
    }
    
}

func Once(_ key: String, block: () -> ()) {
    if !Defaults.bool(forKey: key) {
        Defaults[key] = true
        block()
    }
}
