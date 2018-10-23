//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by Linh Bouniol on 10/23/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: - Properties
    
    var countryController = CountryController()
    
    var countries = [Country]()
    
    // MARK: - Outlets/Actions
    
    @IBOutlet weak var searchBar: UISearchBar!

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, searchTerm.count > 0 else { return }
        
        searchBar.resignFirstResponder()
        
        countryController.fetchCountry(withName: searchTerm) { (countries, error) in
            if let error = error {
                NSLog("Error loading countries: \(error)")
            }
            
            guard let countries = countries else { return }
            
            self.countries = countries
            
            self.tableView.reloadData()
        }
    }
    
    // MARK: - TableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)

        let country = countries[indexPath.row]
        cell.textLabel?.text = country.name

        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let navVC = segue.destination as! UINavigationController
            let detailVC = navVC.topViewController as! CountryDetailViewController
            
            let indexPath = tableView.indexPathForSelectedRow!
            detailVC.country = countries[indexPath.row]
        }
    }
}
