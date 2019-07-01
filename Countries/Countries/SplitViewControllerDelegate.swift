//
//  SplitViewControllerDelegate.swift
//  Countries
//
//  Created by Lambda_School_Loaner_34 on 4/16/19.
//  Copyright © 2019 Frulwinn. All rights reserved.
//

import Foundation
import UIKit

class SplitViewControllerDelegate: UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
