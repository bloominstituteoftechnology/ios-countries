//
//  Country.swift
//  Countries
//
//  Created by Nathanael Youngren on 4/15/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import Foundation

struct Country: Codable {
    let name: String
    let region: String
    let capital: String
    let population: Int
    let currencies: [Currency]
    let languages: [Language]
    let flag: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case region
        case capital
        case population
        case currencies
        case languages
        case flag = "alpha3Code"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let name = try container.decode(String.self, forKey: .name)
        let region = try container.decode(String.self, forKey: .region)
        let capital = try container.decode(String.self, forKey: .capital)
        let population = try container.decode(Int.self, forKey: .population)
        let currencies = try container.decode([Currency].self, forKey: .currencies)
        let languages = try container.decode([Language].self, forKey: .languages)
        
        let flagUppercase = try container.decode(String.self, forKey: .flag)
        let flag = flagUppercase.lowercased()
        
        self.name = name
        self.region = region
        self.capital = capital
        self.population = population
        self.currencies = currencies
        self.languages = languages
        self.flag = flag
    }
}

struct Currency: Codable {
    let code: String
    let name: String
    let symbol: String
}

struct Language: Codable {
    let symbol1: String
    let symbol2: String
    let name: String
    let nativeName: String
    
    enum CodingKeys: String, CodingKey {
        case symbol1 = "iso639_1"
        case symbol2 = "iso639_2"
        case name
        case nativeName
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let symbol1 = try container.decode(String.self, forKey: .symbol1)
        let symbol2 = try container.decode(String.self, forKey: .symbol2)
        let name = try container.decode(String.self, forKey: .name)
        let nativeName = try container.decode(String.self, forKey: .nativeName)
        
        self.symbol1 = symbol1
        self.symbol2 = symbol2
        self.name = name
        self.nativeName = nativeName
    }
}
