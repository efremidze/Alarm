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
    
    static func all() -> [Item] {
        return [Item(title: "4:20 AM", subtitle: nil, type: .am), Item(title: "4:20 PM", subtitle: nil, type: .pm), Item(title: "April 20", subtitle: nil, type: .day)]
    }
}
