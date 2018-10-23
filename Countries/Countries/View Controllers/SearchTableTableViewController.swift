//
//  SearchTableTableViewController.swift
//  Countries
//
//  Created by Andrew Dhan on 10/23/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

class SearchTableTableViewController: UITableViewController,UISearchBarDelegate {

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countries.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country.name
        cell.detailTextLabel?.text = country.capital
        let alpha3code = country.alpha3Code.lowercased()
        cell.imageView?.image = UIImage(named: alpha3code)
        return cell
    }
    // MARK: - UISearchBarDelege Methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        countryController.searchFor(country: searchText) { (results, error) in
            if let error = error {
                NSLog("Error searching for country: \(error)")
                return
            }
            guard let results = results else {
                NSLog("Fetch results is nil")
                return
            }
            guard !results.isEmpty else {return}
            self.countries = results
        }
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    private let countryController = CountryController()
    
    private var countries = [Country](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
}
