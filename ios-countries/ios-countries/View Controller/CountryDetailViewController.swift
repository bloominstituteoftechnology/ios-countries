//
//  CountryDetailViewController.swift
//  ios-countries
//
//  Created by Conner on 10/23/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var flagImageView: UIImageView!
    
    // MARK: - Properties
    var countryController: CountryController?
    var country: Country? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
        updateViews()
    }
    
    // MARK: - Private
    private func updateViews() {
        guard let country = country, isViewLoaded,
            let countryFlag = countryController?.countryURLtoFilename(flagURL: country.flag) else { return }
        title = country.name
        flagImageView.image = UIImage(imageLiteralResourceName: countryFlag)
    }
}
