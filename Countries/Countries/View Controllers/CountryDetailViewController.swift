//
//  CountryDetailViewController.swift
//  Countries
//
//  Created by Nathanael Youngren on 4/15/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let country = country, isViewLoaded else { return }
        
        countryImageView.image = UIImage(named: country.flag)
        countryNameLabel.text = country.name
        countryCapitalLabel.text = "Capital: " + country.capital
        countryPopulationLabel.text = "Population: \(country.population)"
        countryRegionLabel.text = "Region: " + country.region
        
        let currenciesString = country.currencies.map { "\($0.name) (\($0.code), \($0.symbol))" }.joined(separator: ", ")
        let languagesString = country.languages.map { "\($0.name) (\($0.nativeName))" }.joined(separator: ", ")
        
        countryCurrenciesLabel.text = currenciesString
        countryLanguagesLabel.text = languagesString
    }
    
    var country: Country?
    
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryCapitalLabel: UILabel!
    @IBOutlet weak var countryPopulationLabel: UILabel!
    @IBOutlet weak var countryRegionLabel: UILabel!
    @IBOutlet weak var countryCurrenciesLabel: UILabel!
    @IBOutlet weak var countryLanguagesLabel: UILabel!
}
