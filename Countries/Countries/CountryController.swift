//
//  CountryController.swift
//  Countries
//
//  Created by Julian A. Fordyce on 4/15/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation
import UIKit

class CountryContoller {
    
    private let baseURL = URL(string: "https://restcountries.eu/rest/v2/name/")!
    
    
    func fetchCountry(country: Country, completion: @escaping (Error?) -> Void) {
        var url = baseURL
        url.appendPathComponent(country.name)
        
        var request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                NSLog("Error getting data: \(error)")
                completion(error)
            }
            
            
            if let response = response {
                NSLog("\(response)")
                completion(error)
            }
            
            guard let data = data else {
                NSLog("No data returned from task")
                completion(error)
                return
            }
            
            do {
                let countryResults = try JSONDecoder().decode(Country.self, from: data)
                self.country = countryResults.self
                completion(nil)
            } catch {
                NSLog("Unable to decode JSON: \(error)")
                completion(error)
            }
        }.resume()
      }
    
    var country: Country?
}

    
    
    
    
    
    
    
    
    
    
    
    
    

