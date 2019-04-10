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
    let region: String
    let Capital: String
    let population: Int
    let currencies: [Currency]
    let languages: [Language]
    let flag: URL
    
    struct Currency: Codable {
        let name: String
        let symbol: String
    }
    
    struct Language: Codable {
        let name: String
    }
}
