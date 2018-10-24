//
//  CountryController.swift
//  Countries
//
//  Created by Carolyn Lea on 10/23/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import Foundation

private let baseURL = URL(string: "https://restcountries.eu/rest/v2/all")!

class CountryController
{
    var countries: [Country] = []
    
    func searchForCountry(with searchTerm: String, completion: @escaping (Country?, Error?) -> Void)
    {
        let url = baseURL.appendingPathComponent(searchTerm)
        print("This is the searchQueryItem \(url)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            if let error = error
            {
                NSLog("Error fetching data \(error)")
                completion(nil, error)
            }
            
            guard let data = data else {
                NSLog("Error fetching data. No data returned.")
                completion(nil, NSError())
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let searchResults = try jsonDecoder.decode(Country.self, from: data)
                let country = searchResults
                completion(country, nil)
            }
            catch
            {
                NSLog("Unable to decode data into country: \(error)")
                completion(nil, error)
                return
            }
        }
        dataTask.resume() 
    }
    
    func fetchCountries(completion: @escaping (Error?) -> Void)
    {
        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error {
                completion(error)
                return
            }
            guard let data = data else {
                completion(NSError())
                return
            }
            
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                self.countries = countries 
                completion(nil)
                
                print(countries)
            }
            catch
            {
                completion(error)
                return
            }
        }.resume()
    }
    
    
    
    
    
    
}




//all
//https://restcountries.eu/rest/v2/all

//name
//https://restcountries.eu/rest/v2/name/{name}
//https://restcountries.eu/rest/v2/name/united

//3-letter country code
//https://restcountries.eu/rest/v2/alpha/col

//currency
//https://restcountries.eu/rest/v2/currency/{currency}
//https://restcountries.eu/rest/v2/lang/es

//capital
//https://restcountries.eu/rest/v2/capital/{capital}
//https://restcountries.eu/rest/v2/capital/tallinn

//region
//https://restcountries.eu/rest/v2/region/{region}
//https://restcountries.eu/rest/v2/region/europe


//filter
//https://restcountries.eu/rest/v2/{service}?fields={field};{field};{field}
//https://restcountries.eu/rest/v2/all?fields=name;capital;currencies

