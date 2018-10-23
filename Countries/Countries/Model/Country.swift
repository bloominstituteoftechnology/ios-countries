//
//  Country.swift
//  Countries
//
//  Created by Linh Bouniol on 10/23/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import Foundation

struct Country: Codable {
    
    var name: String
    var region: String
    var capital: String // could be empty string
    var population: Int
    var currencies: [String]
    var languages: [String]
    var alpha3Code: String  // abbrev. of country, use to match with the flag name
//    var flag: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case region
        case capital
        case population
        case currencies
        case languages
        case alpha3Code
        
        enum CurrenciesCodingKeys: String, CodingKey {
            case name
        }
        
        enum LangaugesCodingKeys: String, CodingKey {
            case name
        }
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.region = try container.decode(String.self, forKey: .region)
        self.capital = try container.decode(String.self, forKey: .capital)
        self.population = try container.decode(Int.self, forKey: .population)
        self.alpha3Code = try container.decode(String.self, forKey: .alpha3Code).lowercased()
        
        // currencies array
        var currenciesContainer = try container.nestedUnkeyedContainer(forKey: .currencies)
        var currencies = [String]()
        while !currenciesContainer.isAtEnd {
            let nameContainer = try currenciesContainer.nestedContainer(keyedBy: CodingKeys.CurrenciesCodingKeys.self)
            let nameString = try nameContainer.decode(String.self, forKey: .name)
            currencies.append(nameString)
        }
        self.currencies = currencies
        
        // languages array
        var langaugesContainter = try container.nestedUnkeyedContainer(forKey: .languages)
        var languages = [String]()
        while !langaugesContainter.isAtEnd {
            let nameContainer = try langaugesContainter.nestedContainer(keyedBy: CodingKeys.LangaugesCodingKeys.self)
            let nameString = try nameContainer.decode(String.self, forKey: .name)
            languages.append(nameString)
        }
        self.languages = languages
    }
}
