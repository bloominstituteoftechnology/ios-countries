//
//  CountryController.swift
//  Countries
//
//  Created by Moses Robinson on 4/9/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class CountryController {
    
    func fetchCountries(countryName: String, completion: @escaping (Error?) -> Void) {
        
        let url = baseURL.appendingPathComponent(countryName)
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                NSLog("Error found while fetching for countries: \(error)")
                completion(NSError())
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
    
    //MARK: - Properties
    
    var countries: [Country] = []
    
    let baseURL = URL(string: "https://restcountries.eu/rest/v2/name/")!
    
}
