//
//  Country.swift
//  ios-countries
//
//  Created by De MicheliStefano on 23.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import Foundation
import UIKit

struct Country: Decodable {
    
    let name: String
    let region: String
    let capital: String
    let population: Int
    //let currencies: [String]
    //let languages: [String]
    let flagSuffix: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case region
        case capital
        case population
        //case currencies
        //case languages
        case flagSuffix = "alpha3Code"
    }
    
}
