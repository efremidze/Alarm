//
//  InterfaceController.swift
//  Alarm WatchKit Extension
//
//  Created by Lasha Efremidze on 1/23/17.
//  Copyright © 2017 Lasha Efremidze. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    
    let items = Item.all()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        table.setNumberOfRows(items.count, withRowType: "row")
        for index in 0..<table.numberOfRows {
            guard let row = table.rowController(at: index) as? Row else { continue }
            row.item = items[index]
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}

class Row: NSObject {
    
    @IBOutlet var switchView: WKInterfaceSwitch! {
        didSet {
            switchView.setColor(.weedGreen)
        }
    }
    
    var item: Item! {
        didSet {
            switchView.setTitle(item.title)
            item.type.isScheduled { [weak self] scheduled in
                self?.switchView.setOn(scheduled)
            }
        }
    }
    
    @IBAction func valueChanged(_ value: Bool) {
        if value {
            item.type.schedule { error in }
        } else {
            item.type.unschedule()
        }
    }
    
}
