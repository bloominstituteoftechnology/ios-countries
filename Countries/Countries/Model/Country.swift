//
//  Country.swift
//  Countries
//
//  Created by Lambda_School_Loaner_34 on 4/15/19.
//  Copyright © 2019 Frulwinn. All rights reserved.
//

import UIKit

struct Country: Codable {
    let name: String
    let region: String
    let capital: String?
    let population: Int
    let currencies: [Currency]
    let languages: [Language]
    let flag: String
}

struct Currency: Codable {
    let name: String
}

struct Language: Codable {
    let name: String
}
