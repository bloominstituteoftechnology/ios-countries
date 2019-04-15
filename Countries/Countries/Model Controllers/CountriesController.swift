//
//  CountriesController.swift
//  Countries
//
//  Created by Nathanael Youngren on 4/15/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import Foundation

enum NetworkingError: String, Error {
    case fetchingData
    case decodingData
}

class CountriesController {
    
    func fetchCountries(withSearch term: String, completion: @escaping (Error?) -> Void) {
        
        let url = baseURL.appendingPathComponent(term)
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error during URLSession: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                print("Error fetching data: \(NetworkingError.fetchingData)")
                completion(NetworkingError.fetchingData)
                return
            }
            
            do {
                let decodedCountries = try JSONDecoder().decode([Country].self, from: data)
                self.countries = decodedCountries
                completion(nil)
                return
            } catch {
                print("Error decoding data: \(NetworkingError.decodingData)")
                completion(NetworkingError.decodingData)
                return
            }
        }
        task.resume()
    }
    
    var countries: [Country] = []
    let baseURL = URL(string: "https://restcountries.eu/rest/v2/name/")!
}
