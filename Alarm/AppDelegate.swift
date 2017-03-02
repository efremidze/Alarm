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
        HelpshiftCore.install(forApiKey: "d2fb09a5aab5d78081bea7e3263f2965", domainName: "morevoltage.helpshift.com", appID: "morevoltage_platform_20170222092520006-a5b526294f4d663")
        
        Fabric.with([Crashlytics.self])
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(color: .weedGreen), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
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
