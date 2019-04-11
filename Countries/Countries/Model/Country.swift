//
//  Country.swift
//  Countries
//
//  Created by Moses Robinson on 4/9/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

struct Country: Codable {
    
    let name: String
    let region: String?
    let capital: String?
    let population: Int
    let currencies: [Currency?]
    let languages: [Language]
    let flagCode: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case region
        case capital
        case population
        case currencies
        case languages
        case flagCode = "alpha3Code"
    }
    
    struct Currency: Codable {
        let name: String?
        let symbol: String?
    }
    
    struct Language: Codable {
        let name: String
    }
}
