//
//  Alarm.swift
//  Alarm
//
//  Created by Lasha Efremidze on 1/13/17.
//  Copyright © 2017 More Voltage. All rights reserved.
//

import UserNotifications

let UNC = UNUserNotificationCenter.current()

enum AlarmType: String {
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
    
    func schedule(title: String, completionHandler: ((Error?) -> Void)? = nil) {
        UNC.add(identifier: rawValue, title: title, dateComponents: dateComponents(), withCompletionHandler: completionHandler)
    }
    
    func unschedule() {
        UNC.removePendingNotificationRequests(withIdentifiers: [rawValue])
    }
}

struct Alarm {
    
    static func start(completionHandler: @escaping (Bool, Error?) -> Void) {
        UNC.requestAuthorization(options: [.sound, .alert], completionHandler: completionHandler)
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
