//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by Moin Uddin on 12/4/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        CountryController.shared.getCountries(with: searchTerm) { (countries, _) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CountryController.shared.countries.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        cell.textLabel?.text = CountryController.shared.countries[indexPath.row].name
        return cell
    }

 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewCountry" {
            let navVC = segue.destination as! UINavigationController
            let detailVC = navVC.topViewController as! CountriesDetailViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let country = CountryController.shared.countries[indexPath.row]
            detailVC.country = country
        }
        
    }


}
