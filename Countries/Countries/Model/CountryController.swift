//
//  CountryController.swift
//  Countries
//
//  Created by Lambda_School_Loaner_34 on 4/15/19.
//  Copyright © 2019 Frulwinn. All rights reserved.
//

import UIKit

class CountryController {
    
    //MARK: - Properties
    var countries: [Country] = []
    
    let baseURL = URL(string: "https://restcountries.eu/rest/v2/name/")!

    
    func fetchCountries(countryName: String, completion: @escaping (Error?) -> Void) {
        let url = baseURL.appendingPathComponent(countryName)
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                NSLog("Error found while fetching for countries: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                NSLog("No countries data found.")
                completion(error)
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let decodedCountries = try jsonDecoder.decode([Country].self, from: data)
                self.countries = decodedCountries
                
            } catch {
                NSLog("could not decode data.")
                completion(error)
                return
            }
            
            completion(nil)
        }
        dataTask.resume()
    }
}
