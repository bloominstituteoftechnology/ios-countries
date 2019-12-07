//
//  DetailViewController.swift
//  Countries
//
//  Created by Michael Stoffer on 12/7/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var capitolLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    @IBOutlet weak var currenciesLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateViews()
    }

    var country: Country? {
        didSet {
            // Update the view.
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let country = country, isViewLoaded else { return }
        
        self.flagImageView.image = UIImage(named: country.alpha3Code.lowercased())
        self.nameLabel.text = country.name
        self.populationLabel.text = String(country.population)
        self.regionLabel.text = country.region
        self.capitolLabel.text = country.capital
        
        let languages = country.languages.map { $0.name }
        self.languagesLabel.text = languages.joined()
        
        let currencies = country.currencies.map { $0.name }
        self.currenciesLabel.text = currencies.joined()
    }


}

