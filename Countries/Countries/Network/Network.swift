//
//  Network.swift
//  Countries
//
//  Created by Michael Flowers on 12/9/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation


class Network {
    static let shared = Network()
//    var countries: [Country] = []
     fileprivate let baseURL = URL(string: "https://restcountries.eu/rest/v2/name")!
    
      func getCountriesFrom(searchTerm: String, completion: @escaping ([Country]?, Error?) -> Void){
        //append the baseURL with the search term
        let url = baseURL.appendingPathComponent(searchTerm)
        
        //we are getting so we just call urlsession
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let response = response as? HTTPURLResponse {
                print("Response: \(response.statusCode)")
            }
            
            if let error = error {
                print("Error in file: \(#file) in the body of the function: \(#function)\n on line: \(#line)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)\n")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
                completion(nil, NSError(domain: "Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n", code: 422))
                return
            }
            
            let jD = JSONDecoder()
            do {
                let countries =  try jD.decode([Country].self, from: data)
                print("success getting country back in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
                completion(countries, nil)
            } catch  {
                print("Error in: \(#function)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)")
                completion(nil, error)
                return
            }
        }.resume()
    }
}
