//
//  Country.swift
//  Countries
//
//  Created by Farhan on 12/4/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

import Foundation
import UIKit

struct Country: Decodable {
    let name: String // auto
    let region: String
    let capital: String
    //let currencies: String
    let population: Int
    //let languages: String
    let flag: String
    let alpha3code: String
}
