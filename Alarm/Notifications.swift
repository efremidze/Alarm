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
    
    func setup() {
        UNC.requestAuthorization(options: [.sound, .alert]) { accepted, error in
            if accepted {
                self.scheduleNotification()
            } else {
                print("Notification access denied.")
            }
        }
        
//        let action = UNNotificationAction(identifier: "remindLater", title: "Remind me later", options: [])
//        let category = UNNotificationCategory(identifier: "myCategory", actions: [action], intentIdentifiers: [], options: [])
//        UNC.setNotificationCategories([category])
    }
    
    func scheduleNotification() {
//        UNC.delegate = self
        UNC.removeAllPendingNotificationRequests()
        
        var components = DateComponents()
        components.hour = 16
        components.minute = 20
        UNC.add(components) { error in
            if let error = error {
                print("Uh oh! We had an error: \(error)")
            }
        }
    }
    
}

extension UNUserNotificationCenter {
    
    func add(_ dateComponents: DateComponents, withCompletionHandler completionHandler: ((Error?) -> Swift.Void)? = nil) {
        add(notificationRequest(dateComponents: dateComponents), withCompletionHandler: completionHandler)
    }
    
    private func notificationRequest(dateComponents: DateComponents) -> UNNotificationRequest {
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let content = UNMutableNotificationContent()
        content.title = "Tutorial Reminder"
        content.body = "Just a reminder to read your tutorial over at appcoda.com!"
        content.sound = UNNotificationSound.default()
//        content.categoryIdentifier = "myCategory"
        return UNNotificationRequest(identifier: "textNotification", content: content, trigger: trigger)
    }
    
}
