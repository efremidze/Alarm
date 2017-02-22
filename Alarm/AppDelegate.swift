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
        
        HelpshiftCore.initialize(with: HelpshiftAll.sharedInstance())
        HelpshiftCore.install(forApiKey: "554fb19c87c9f4bd6d171e77226d0e5f", domainName: "morevoltage.helpshift.com", appID: "morevoltage_platform_20151213231950676-0208f040b50d0d4")
        
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
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(color: .weedGreen), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        UISwitch.appearance().onTintColor = .weedGreen
        
        return true
    }
    
}
