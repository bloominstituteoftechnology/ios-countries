//
//  AppDelegate.swift
//  Countries
//
//  Created by Linh Bouniol on 10/23/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let splitViewController = window!.rootViewController as! UISplitViewController
        splitViewController.delegate = self
        
        return true
    }

    // prevent detailVC from showing up as the first screen when app launches
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        
        guard let detailNavVC = secondaryViewController as? UINavigationController,
            let detailVC = detailNavVC.topViewController as? CountryDetailViewController else {
            return false
        }
        
        if detailVC.country == nil {
            return true // we handled the collapse (did nothing) so discard the secondary controller
        }
        return false
    }

}

