//
//  DetailViewController.swift
//  Countries
//
//  Created by Andrew Dhan on 10/23/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    func updateViews(){
        guard isViewLoaded, let country = country else {return}
        
        self.title = country.name
        
        nameLabel.text = country.name
        regionLabel.text = country.region
        capitalLabel.text = country.capital
        populationLabel.text = String(country.population)
        currencyLabel.text = country.currencies.compactMap{
            guard let name = $0.name,
                let symbol = $0.symbol else {return ""}
            return "\(name) (\(symbol)) "
            }.joined(separator: ",")
        languageLabel.text = country.languages.compactMap{
            guard let name = $0.name,
                let nativeName = $0.nativeName else {return ""}
            return "\(name) (\(nativeName)) "
        }.joined(separator: ", ")
        
        let alpha3code = country.alpha3Code.lowercased()
        imageView?.image = UIImage(named: alpha3code)
    }
    
    //MARK: - Properties
    var country: Country?{
        didSet{
            updateViews()
        }
    }
    
    //IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
}
