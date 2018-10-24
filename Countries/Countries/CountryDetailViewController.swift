//
//  CountryDetailViewController.swift
//  Countries
//
//  Created by Carolyn Lea on 10/23/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController
{

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var regionLabel: UILabel!
    @IBOutlet var capitalLabel: UILabel!
    @IBOutlet var populationLabel: UILabel!
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var languageLabel: UILabel!
    @IBOutlet var demonymLabel: UILabel!
    
    @IBOutlet var mapView: UIView!
    @IBOutlet var imageView: UIImageView!
    
    var countryController: CountryController?
    var country: Country?
    {
        didSet
        {
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateViews()
    }
    

    private func updateViews()
    {
        guard let country = country else {return}
        
        title = country.name
        nameLabel.text = country.name
        regionLabel.text = country.region
        capitalLabel.text = country.capital
        populationLabel.text = String(country.population)
        
        currencyLabel.text = "\(country.currencies)"
        languageLabel.text = "\(country.languages)"
        demonymLabel.text = country.demonym
        let imageName = country.alpha3Code.lowercased()
        imageView.image = UIImage(named: imageName)
        
    }

}
