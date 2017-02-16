//
//  AppDelegate.swift
//  Alarm
//
//  Created by Lasha Efremidze on 1/9/17.
//  Copyright © 2017 Lasha Efremidze. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Fabric.with([Crashlytics.self])
        
        Alarm.start { accepted, error in
            if accepted {
                Once("Alarm.scheduled") {
                    AlarmType.pm.schedule { error in }
                }
            } else {
                print("Notification access denied.")
            }
        }
        
        UISwitch.appearance().onTintColor = .weedGreen
        
        return true
    }
    
}
