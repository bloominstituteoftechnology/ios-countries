//
//  CountryDetailViewController.swift
//  Countries
//
//  Created by Ilgar Ilyasov on 12/4/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countrySubregionLabel: UILabel!
    @IBOutlet weak var countryCapitalLabel: UILabel!
    @IBOutlet weak var countryPopulationLabel: UILabel!
    @IBOutlet weak var countryCurrenciesLabel: UILabel!
    @IBOutlet weak var countryLanguagesLabel: UILabel!
    
    var country: Country? {
        didSet { updateViews() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    func updateViews() {
        
        guard let country = country, isViewLoaded else { return }
        
        countryImageView.image = UIImage(named: country.flagName)!
        countryNameLabel.text = "Name: \(country.name)"
        countrySubregionLabel.text = "Subregion: \(country.subregion)"
        countryCapitalLabel.text = "Capital: \(country.capital)"
        countryPopulationLabel.text = "Population: \(country.population)"
        countryCurrenciesLabel.text = "Currencies: \(country.currencies.joined(separator: ", ").capitalized)"
        countryLanguagesLabel.text = "Languages: \(country.languages.joined(separator: ", "))"
    }
}
