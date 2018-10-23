//
//  Country.swift
//  Countries
//
//  Created by Andrew Dhan on 10/23/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import Foundation

struct Country:Codable {
    var name: String
    var region: String
    var capital: String
    var population: Int
    var currencies: [Currency]
    var languages: [Language]
    var flag: URL
    var alpha3Code:String
}

struct Currency:Codable {
    var code: String?
    var name: String?
    var symbol: String?
}

struct Language:Codable {
    var name: String?
    var nativeName: String?
}
