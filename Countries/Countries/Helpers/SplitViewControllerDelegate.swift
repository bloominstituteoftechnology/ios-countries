//
//  SplitViewControllerDelegate.swift
//  Countries
//
//  Created by Moses Robinson on 4/10/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class SplitViewControllerDelegate: UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        
        return true
    }
}
