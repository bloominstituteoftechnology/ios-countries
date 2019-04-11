//
//  AppDelegate.swift
//  Countries
//
//  Created by Moses Robinson on 4/9/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureSplitViewController()
        
        return true
    }

    func configureSplitViewController() {
        
        // Referance to the split view controller on the screen, not a new instance of it.
        let splitViewController = window?.rootViewController as! UISplitViewController
        
        splitViewController.delegate = splitViewControllerDelegate
    }
    
    let splitViewControllerDelegate = SplitViewControllerDelegate()

}

