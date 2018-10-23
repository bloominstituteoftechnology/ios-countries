//
//  Country.swift
//  ios-countries
//
//  Created by Conner on 10/23/18.
//  Copyright © 2018 Conner. All rights reserved.
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
}

struct Currency: Codable {
    let code: String?
    let name: String?
    let symbol: String?
}

struct Language: Codable {
    let iso6391: String?
    let iso6392: String
    let name: String
    let nativeName: String
    
    enum CodingKeys: String, CodingKey {
        case iso6391 = "iso639_1"
        case iso6392 = "iso639_2"
        case name, nativeName
    }
}
