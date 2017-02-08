//
//  Item.swift
//  Alarm
//
//  Created by Lasha Efremidze on 2/5/17.
//  Copyright © 2017 Lasha Efremidze. All rights reserved.
//

import Foundation

struct Item {
    let title: String
    let subtitle: String?
    let type: AlarmType
    
    static func make(title: String, subtitle: String?, type: AlarmType) -> Item {
        return Item(title: title, subtitle: subtitle, type: type)
    }
}
