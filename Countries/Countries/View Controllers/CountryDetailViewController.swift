//
//  CountryDetailViewController.swift
//  Countries
//
//  Created by Lambda_School_Loaner_34 on 4/15/19.
//  Copyright © 2019 Frulwinn. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    //MARK: - Properties
    var country: Country? {
        didSet{
            updateViews()
        }
    }
    
    //MARK: - Outlets
    @IBOutlet weak var flagView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    

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
        
        let currenciesString = country.currencies.map({ $0.name ?? "N/A" }).joined(separator: ", ")
        currencyLabel.text = "Currencies: \(currenciesString)"
        let languagesString = country.languages.map({ $0.name }).joined(separator: ", ")
        languageLabel.text = "Languages: \(languagesString)"
        
        flagView.image = UIImage(named: country.flag.lowercased())
    }
}
