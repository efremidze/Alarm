//
//  AppDelegate.swift
//  Alarm
//
//  Created by Lasha Efremidze on 1/9/17.
//  Copyright © 2017 Lasha Efremidze. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(color: .weedGreen), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISwitch.appearance().onTintColor = .weedGreen
        
        Alarm.start { accepted, error in
            if accepted {
                Defaults.once(Constants.scheduledAlarm) {
                    AlarmType.pm.schedule { error in
                        NC.post(name: .alarmsChanged, object: nil)
                    }
                }
            }
        }
        
        return true
    }
    
}
