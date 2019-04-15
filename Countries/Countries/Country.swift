//
//  Country.swift
//  Countries
//
//  Created by Julian A. Fordyce on 4/15/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation

struct CountryElement: Codable {
    let name: String
    let capital: String
    let region: String
    let population: Int
    let currencies: [Currency]
    let languages: [Language]
    let flag: String
}

struct Currency: Codable {
    let code, name: String
    let symbol: String?
}

struct Language: Codable {
    let iso6391, iso6392, name, nativeName: String
    
    enum CodingKeys: String, CodingKey {
        case iso6391 = "iso639_1"
        case iso6392 = "iso639_2"
        case name, nativeName
    }
}



