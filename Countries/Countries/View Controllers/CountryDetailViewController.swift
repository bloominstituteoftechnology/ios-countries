//
//  CountryDetailViewController.swift
//  Countries
//
//  Created by Moses Robinson on 4/9/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true

        updateViews()
    }
    
    private func updateViews() {
        guard let country = country, isViewLoaded else { return }
        
        title = country.name
        
        
    }

    // MARK: - Properties

    var country: Country? {
        didSet {
            updateViews()
        }
    }
}
