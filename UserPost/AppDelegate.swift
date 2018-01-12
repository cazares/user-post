//
//  AppDelegate.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

let topNavColor = .red
let backgroundRGB = CGFloat(238)
let backgroundColor = UIColor(red: backgroundRGB, green: backgroundRGB, blue: backgroundRGB, alpha: CGFloat(1.0))
let emptyString = ""

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let barAppearance = UINavigationBar.appearance()
        barAppearance.barTintColor = topNavColor
        barAppearance.tintColor = .white
        barAppearance.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        application.isStatusBarHidden = false
        application.statusBarStyle = .lightContent
        
        let searchViewController = UserPostViewController()
        let navController = UINavigationController(rootViewController: searchViewController)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
}

