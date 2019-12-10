//
//  Flag.swift
//  Countries
//
//  Created by Michael Flowers on 12/9/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation


struct Flag: Codable {
    let name: String
    let capital: String
    let region: String
    let population: Int
    let currencies: [CurrencyName]
    let languages: [LanguageName]
    let flag: String

}

struct CurrencyName: Codable {
    let name: String
}

struct LanguageName: Codable {
    let name: String
}
