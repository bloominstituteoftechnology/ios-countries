//
//  Country.swift
//  Countries
//
//  Created by Carolyn Lea on 10/23/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import Foundation

struct Country: Codable, Equatable
{
    let name: String
    let region: String
    let capital: String?
    let population: Int

    //let flagImageString: String
    let alpha3Code: String
    let latlng: [Double]
    
    //let demonym: [String]
    let currencies: [Currency]
    let languages: [Language]
    
    struct Currency: Codable, Equatable
    {
        let name: String
    }
    
    struct Language: Codable, Equatable
    {
        let name: String
    }
    
    
}
