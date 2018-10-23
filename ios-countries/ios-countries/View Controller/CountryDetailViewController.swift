//
//  CountryDetailViewController.swift
//  ios-countries
//
//  Created by Conner on 10/23/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    // MARK: - Properties
    var country: Country? {
        didSet {
            updateViews()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private
    private func updateViews() {
        guard let country = country, isViewLoaded else { return }
        title = country.name
    }
}
