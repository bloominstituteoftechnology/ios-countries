//
//  AppDelegate.swift
//  Countries
//
//  Created by Julian A. Fordyce on 4/15/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureSplitViewControllerDelegate()
        return true
    }

    func configureSplitViewControllerDelegate() {
        let splitViewController = window?.rootViewController as! UISplitViewController
        splitViewController.delegate = splitViewControllerDelegate
        
    }
    
    let splitViewControllerDelegate = SplitViewControllerDelegate()

}

