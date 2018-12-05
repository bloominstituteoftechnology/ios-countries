//
//  CountryController.swift
//  Countries
//
//  Created by Moin Uddin on 12/4/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit


class CountryController {
    
    static let shared = CountryController()
    
    func getCountries(completion: @escaping ([Country]?, Error?) -> Void) {
        let allCountriesUrl = baseUrl.appendingPathComponent("all")
        let request = URLRequest(url: allCountriesUrl)
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("There was an error fetching countries: \(error)")
                completion(nil, error)
            }
            
            guard let data = data else {
                return
            }
            
            do {
                guard let dictionaries = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else { return }
                for dictionary in dictionaries {
                    let name = dictionary["name"] as! String
                    let imageCode = dictionary["alpha3Code"] as! String
                    let capital = dictionary["capital"] as! String
                    let region = dictionary["region"] as! String
                    let currencyDictionaries = dictionary["currencies"] as! [[String: Any]]
                    var currencies: [String] = []
                    for currencyDictionary in currencyDictionaries {
                        guard let currency = currencyDictionary["name"] as? String else { continue }
                        currencies.append(currency)
                    }
                    var languages: [String] = []
                    let languagesDictionaries = dictionary["languages"] as! [[String: Any]]
                    for languagesDictionary in languagesDictionaries {
                        guard let language = languagesDictionary["name"] as? String else { continue }
                        languages.append(language)
                    }
                    let population = dictionary["population"] as! Int
                    let flag = UIImage(named: imageCode.lowercased())!
                    let country = Country(name: name, region: region, capital: capital, population: population, currencies: currencies, languages: languages, flag: flag )
                    self.countries.append(country)
                }
                completion(self.countries, nil)
            }
            catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    private(set) var countries: [Country] = []
    let baseUrl = URL(string: "https://restcountries.eu/rest/v2")!
}
