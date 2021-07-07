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
        nameLabel.text = country.name
        regionLabel.text = country.region
        capitalLabel.text = "Capital: \(country.capital ?? "N/A")"
        populationLabel.text = "Population: \(country.population)"

        let currenciesString = country.currencies.map({$0?.name ?? "N/A"}).joined(separator: ", ")
        currencyLabel.text = "Currencies: \(currenciesString)"
        let languagesString = country.languages.map({ $0.name }).joined(separator: ", ")
        languagesLabel.text = "Languages: \(languagesString)"
        
        flagImageView.image = UIImage(named: country.flagCode.lowercased())
    }

    // MARK: - Properties

    var country: Country? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet var flagImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var regionLabel: UILabel!
    @IBOutlet var capitalLabel: UILabel!
    @IBOutlet var populationLabel: UILabel!
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var languagesLabel: UILabel!
    
}
