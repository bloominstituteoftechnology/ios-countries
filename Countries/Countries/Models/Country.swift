//
//  Country.swift
//  Countries
//
//  Created by Ilgar Ilyasov on 12/4/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import CoreLocation

struct Country: Decodable {
    
    let name: String
    let subregion: String
    let capital: String
    let population: Int
    let currencies: [String]
    let languages: [String]
    let flagName: String
//    let location: CLLocationCoordinate2D
    
    init(name: String, subregion: String, capital:String, population: Int, currencies: [String], languages: [String], alpha3Code: String, latlng: (CLLocationDegrees, CLLocationDegrees) = (0, 0)) {
        self.name = name
        self.subregion = subregion
        self.capital = capital
        self.population = population
        self.currencies = currencies
        self.languages = languages
        self.flagName = alpha3Code
//        self.location = CLLocationCoordinate2D(latitude: latlng.0, longitude: latlng.1)
    }
    
    enum CountryCodingKeys: String, CodingKey {
        case name
        case subregion
        case capital
        case population
        case currencies
        case languages
        case alpha3Code
        case latlng
        
        enum CurrenciesCodingKeys: String, CodingKey {
            case name
        }
        
        enum LanguagesCodingKeys: String, CodingKey {
            case name
        }
    }
    
    init(from decoder: Decoder) throws {
        let dictionaryContainer = try decoder.container(keyedBy: CountryCodingKeys.self)
        
        // Name, subregion, capital, population
        let name = try dictionaryContainer.decode(String.self, forKey: .name)
        let subregion = try dictionaryContainer.decode(String.self, forKey: .subregion)
        let capital = try dictionaryContainer.decode(String.self, forKey: .capital)
        let population = try dictionaryContainer.decode(Int.self, forKey: .population)
        
        // Currencies
        var currenciesContainer = try dictionaryContainer.nestedUnkeyedContainer(forKey: .currencies)
        var currenciesArray = [String]()
        
        while !currenciesContainer.isAtEnd {
            let nestedDictionaryContainer = try currenciesContainer.nestedContainer(keyedBy: CountryCodingKeys.CurrenciesCodingKeys.self)
            let currencyName = try nestedDictionaryContainer.decode(String.self, forKey: .name)
            currenciesArray.append(currencyName)
        }
        
        // Languages
        var languagesContainer = try dictionaryContainer.nestedUnkeyedContainer(forKey: .languages)
        var languagesArray = [String]()
        
        while !languagesContainer.isAtEnd {
            let nestedDictionaryContainer = try languagesContainer.nestedContainer(keyedBy: CountryCodingKeys.LanguagesCodingKeys.self)
            let languageName = try nestedDictionaryContainer.decode(String.self, forKey: .name)
            languagesArray.append(languageName)
        }
        
        // Flag
        let alpha3Code = try dictionaryContainer.decode(String.self, forKey: .alpha3Code)
        
        // Latitude - longitude
//        var latlngContainer = try dictionaryContainer.nestedUnkeyedContainer(forKey: .latlng)
//        let latitude = try latlngContainer.decode(CLLocationDegrees.self)
//        let longitude = try latlngContainer.decode(CLLocationDegrees.self)
        
        
        self.name = name
        self.subregion = subregion
        self.capital = capital
        self.population = population
        self.currencies = currenciesArray
        self.languages = languagesArray
        self.flagName = alpha3Code.lowercased()
//        self.location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
