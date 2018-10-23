//
//  CountryController.swift
//  Countries
//
//  Created by Andrew Dhan on 10/23/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import Foundation

private let baseURL = URL(string: "https://restcountries.eu/rest/v2/name/")!

class CountryController{
    
    func searchFor(country: String, completion: @escaping ([Country]?, Error?) -> Void){
        let url = baseURL.appendingPathComponent(country)
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                NSLog("Data is nil")
                return
            }
            
            var countries = [Country]()
            do{
                countries = try JSONDecoder().decode([Country].self, from: data)
            } catch{
                completion(nil, error)
            }
            completion(countries,nil)
            
        }.resume()
        
    }
}
