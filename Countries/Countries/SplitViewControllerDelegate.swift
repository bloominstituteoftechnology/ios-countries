//
//  SplitViewControllerDelegate.swift
//  Countries
//
//  Created by Moin Uddin on 12/4/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class SplitViewControllerDelegate: NSObject, UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        guard let detailNavVC = secondaryViewController as? UINavigationController,
            let detailVC = detailNavVC.topViewController as? CountriesDetailViewController else {
                return false
        }
        
        if detailVC.country == nil {
            return true
        }
        
        return false
    }
}
