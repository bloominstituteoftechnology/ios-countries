//
//  SplitViewControllerDelegate.swift
//  Countries
//
//  Created by Lambda_School_Loaner_95 on 4/15/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

// This toothpick's only job is to be delegate of a split view controller
class SplitViewControllerDelegate: UISplitViewControllerDelegate {
    
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        // Seems like to should be the opposite bool value
        
        // Will you (someone else) take care of collapsing the view controllers if you want?
        return true
    }
    
    
}
