//
//  CountryController.swift
//  ios-countries
//
//  Created by De MicheliStefano on 23.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import Foundation

class CountryController {
    
    var countries: [Country] = []
    var baseUrlString = "https://restcountries.eu/rest/v2/name/"
    
    func fetchCountries(with name: String, completion: @escaping (Error?) -> Void) {
        let url = URL(string: baseUrlString)!.appendingPathComponent(name)
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching countries: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                NSLog("Error getting data from fetchin")
                completion(NSError())
                return
            }
            
            do {
                let decodedCountries = try JSONDecoder().decode([Country].self, from: data)
                self.countries = decodedCountries
                completion(nil)
            } catch {
                NSLog("Error decoding countries: \(error)")
                completion(error)
                return
            }
        }.resume()
    }
    
}
