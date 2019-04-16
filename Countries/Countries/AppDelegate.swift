//
//  AppDelegate.swift
//  Countries
//
//  Created by Lambda_School_Loaner_34 on 4/15/19.
//  Copyright © 2019 Frulwinn. All rights reserved.
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

