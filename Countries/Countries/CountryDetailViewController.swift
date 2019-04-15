//
//  CountryDetailViewController.swift
//  Countries
//
//  Created by Lambda_School_Loaner_95 on 4/15/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        guard let country = country, isViewLoaded else { return }
        print("Inside update views")
        title = country.name
        nameLabel.text = country.name
        regionLabel.text = country.region
        capitalLabel.text = country.capital
        populationLabel.text = String(country.population)
        var currencyString = ""
        var languageString = ""
        for cur in country.currencies {
            currencyString += "\(cur)\n"
        }
        for lang in country.languages {
            languageString += "\(lang)\n"
        }
        currencyLabel.text = currencyString
        languageLabel.text = languageString
        
        /*var imageURL = URL(fileURLWithPath: country.flag)
        var imageData = Data(contentsOf: imageURL)*/
        flagImageView.image = UIImage(named: country.flag)
      //  flagImageView.image = UIImage(data: imageData)
        
    }
    
    var country: Country? {
        didSet {
            updateViews()
        }
    }
    var countryController: CountryController?
    
    @IBOutlet weak var flagImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var regionLabel: UILabel!
    
    @IBOutlet weak var capitalLabel: UILabel!
    
    @IBOutlet weak var populationLabel: UILabel!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    
}
