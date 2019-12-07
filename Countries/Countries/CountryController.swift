//
//  CountryController.swift
//  Countries
//
//  Created by Michael Stoffer on 12/7/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum NetworkError: Error {
    case otherError
    case badData
}

class CountryController {
    var countries: [Country] = []
    
    let baseURL = URL(string: "https://restcountries.eu/rest/v2/name/")!
    
    func searchForCountry(searchTerm: String, completion: @escaping ([Country]?, Error?) -> Void) {
        let countryURL = baseURL.appendingPathComponent(searchTerm.lowercased())
        
        var request = URLRequest(url: countryURL)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, result, error) in
            if let error = error {
                NSLog("Error fetching data: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let data = data else {
                NSLog("No data returned from data task")
                DispatchQueue.main.async {
                    completion(nil, error);
                }
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let countries = try jsonDecoder.decode([Country].self, from: data)
                DispatchQueue.main.async {
                    completion(countries, nil)
                }
            } catch {
                NSLog("Error decoding country object: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
        }.resume()
    }
    
    func removeCountry() {
        
    }
    
}
