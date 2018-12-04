//
//  Country.swift
//  Countries
//
//  Created by Ilgar Ilyasov on 12/4/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

struct Country {
    
    let name: String
    let subregion: String
    let capital: String
    let population: Double
    let currencies: [String]
    let languages: [String]
    let flag: UIImage
    let latlng: (Double, Double)
    
    init(name: String, subregion: String, capital:String, population: Double, currencies: [String], languages: [String], alpha3Code: String, latlng: (Double, Double) = (0, 0)) {
        self.name = name
        self.subregion = subregion
        self.capital = capital
        self.population = population
        self.currencies = currencies
        self.languages = languages
        self.flag = UIImage(named: alpha3Code)!
        self.latlng = latlng
    }
}
