//
//  CountryController.swift
//  Countries
//
//  Created by Farhan on 12/4/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

import Foundation

class CountryController {
    
    private(set) public var countries = [Country]()
    
    private let baseURL = URL(string: "https://restcountries.eu/rest/v2/name")!
    
    func searchForCountries(with name: String, completion: @escaping ([Country], Error?) -> Void) {
        
        let requestURL = baseURL.appendingPathComponent(name)
        
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching search results: \(error)")
                return completion([], error)
            }
            
            guard let data = data else {
                NSLog("Data not availible \(String(describing: error))")
                return completion([], error)
            }
            
            do{
                let countryArr = try JSONDecoder().decode([Country].self, from: data)
                self.countries = countryArr
                completion(countryArr, nil)
            }catch {
                completion([], error)
                return
            }
            
        }.resume()
        
        
    }
    
}
