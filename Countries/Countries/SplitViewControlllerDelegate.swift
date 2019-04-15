//
//  SplitViewControlllerDelegate.swift
//  Countries
//
//  Created by Julian A. Fordyce on 4/15/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation
import UIKit

class SplitViewControllerDelegate: UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true 
    }
}
