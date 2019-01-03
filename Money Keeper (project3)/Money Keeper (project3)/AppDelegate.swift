//
//  AppDelegate.swift
//  Money Keeper (project3)
//
//  Created by Abdullah Alsayari on 11/26/18.
//  Copyright © 2018 Abdullah Alsayari. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let defaults = UserDefaults(suiteName: defaultID)!
    
    override init() {
        defaults.set(Bundle.main.Build, forKey: "appVersion")
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let dFormatter = DateFormatter()
        dFormatter.dateStyle = .medium
        dFormatter.timeStyle = .full
        let dateTime = dFormatter.string(from: Date())
        defaults.set(dateTime, forKey: dTime)
        
        initilizeDefaults()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        let numLaunches = defaults.integer(forKey: numberLaunches) + 1
        defaults.set(numLaunches, forKey: numberLaunches)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
       
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
     
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func initilizeDefaults() {
        if let filePath = Bundle.main.path(forResource: "Defaults", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: filePath) {
            defaults.register(defaults: dict as! [String:Any])
            defaults.synchronize()
        }
    }

}

