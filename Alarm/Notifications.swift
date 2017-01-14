//
//  Notifications.swift
//  Alarm
//
//  Created by Lasha Efremidze on 1/13/17.
//  Copyright © 2017 More Voltage. All rights reserved.
//

import UserNotifications

let UNC = UNUserNotificationCenter.current()

struct Notifications {
    
    enum `Type`: String {
        case am, pm, day
        
        private func dateComponents() -> DateComponents {
            switch self {
            case .am:
                var components = DateComponents()
                components.hour = 4
                components.minute = 20
                return components
            case .pm:
                var components = DateComponents()
                components.hour = 16
                components.minute = 20
                return components
            case .day:
                var components = DateComponents()
                components.month = 4
                components.day = 20
                return components
            }
        }
        
        func schedule(completionHandler: ((Error?) -> Void)? = nil) {
            UNC.add(identifier: rawValue, title: "420 Get High 🙃", dateComponents: dateComponents(), withCompletionHandler: completionHandler)
        }
    }
    
    static func start() {
        UNC.requestAuthorization(options: [.sound, .alert]) { accepted, error in
            if accepted {
                
            } else {
                print("Notification access denied.")
            }
        }
    }
    
    static func reset() {
        UNC.removeAllPendingNotificationRequests()
    }
    
}

extension UNUserNotificationCenter {
    
    func add(identifier: String, title: String, dateComponents: DateComponents, withCompletionHandler completionHandler: ((Error?) -> Void)? = nil) {
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let content = UNMutableNotificationContent()
        content.title = title
        content.sound = .default()
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        add(request, withCompletionHandler: completionHandler)
    }
    
}
