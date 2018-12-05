//
//  CountriesDetailViewController.swift
//  Countries
//
//  Created by Moin Uddin on 12/4/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class CountriesDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
        
        updateViews()
    }
    
    
    @IBOutlet weak var flagImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var regionLabel: UILabel!
    
    @IBOutlet weak var capitalLabel: UILabel!
    
    @IBOutlet weak var populationLabel: UILabel!
    
    @IBOutlet weak var currenciesLabel: UILabel!
    
    @IBOutlet weak var languagesLabel: UILabel!
    
    
    private func updateViews() {
        guard let country = country, isViewLoaded else { return }
        nameLabel.text = "Name: \(country.name)"
        flagImageView.image = country.flag
        regionLabel.text = "Region: \(country.region)"
        let capitalText = country.capital == "" ? "Capital: N/A" : "Capital: \(country.capital)"
        capitalLabel.text = capitalText
        populationLabel.text = "Population: \(country.population)"
        currenciesLabel.text = "Currencies: \(country.currencies.joined(separator: ","))"
        languagesLabel.text = "Languages: \(country.languages.joined(separator: ","))"
    }

    var country: Country? {
        didSet {
            updateViews()
        }
    }

}
