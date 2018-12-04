//
//  CountryController.swift
//  Countries
//
//  Created by Ilgar Ilyasov on 12/4/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class CountryController {
    
    var countries = [Country]()
    private let baseURL = URL(string: "https://restcountries.eu/rest/v2/name")!
    
    func searchForCountry(searchTerm: String, completion: @escaping ([Country]?, Error?) -> Void ) {
        
        let url = baseURL.appendingPathComponent(searchTerm)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching country: \(error)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                NSLog("No data returned")
                completion(nil, error)
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let countries = try jsonDecoder.decode([Country].self, from: data)
                
                DispatchQueue.main.async {
                    self.countries = countries
                }
            } catch {
                NSLog("Error decoding data; \(error)")
                completion(nil, error)
                return
            }
        }.resume()
    }
    
}
