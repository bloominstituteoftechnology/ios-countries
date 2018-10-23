//
//  CountryController.swift
//  ios-countries
//
//  Created by Conner on 10/23/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import Foundation

class CountryController {
    func performSearch(for searchTerm: String, completion: @escaping () -> Void) {
        let url = baseURL.appendingPathComponent(searchTerm.lowercased())
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error GET countries: \(error)")
                return
            }
            guard let data = data else {
                completion()
                return
            }
            do {
                let jsonDecoder = JSONDecoder()
                let searchResults = try jsonDecoder.decode(Country.self, from: data)
            } catch {
                NSLog("Error decoding \(data) into object, error: \(error)")
            }
            completion()
        }
    }
    
    let baseURL = URL(string: "https://restcountries.eu/rest/v2/name/")!
    let countries: [Country] = []
}
