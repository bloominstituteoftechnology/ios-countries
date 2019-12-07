//
//  Country.swift
//  Countries
//
//  Created by Michael Stoffer on 12/7/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import Foundation

struct Country {
    let name: String
    let region: String
    let capitol: String
    let population: Int
    let currencies: [Currency]
    let languages: [Language]
    let flag: Flag
}

struct Currency {
    let code: String
    let name: String
    let symbol: String
}

struct Language {
    let iso639_1: String
    let iso639_2: String
    let name: String
    let nativeName: String
}

struct Flag {
    let alpha3Code: String
}
