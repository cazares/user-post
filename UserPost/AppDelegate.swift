//
//  AppDelegate.swift
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

import UIKit

let topNavColor: UIColor = .red
let bgColor = UIColor(red: 238.0/255.0, green: 238/255.0, blue: 238/255.0, alpha: CGFloat(1.0))
let emptyString = ""
let padding = CGFloat(10.0)
let cancel = "Cancel"

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
        
        let mainViewController = UsersViewController()
        let navController = UINavigationController(rootViewController: mainViewController)
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

