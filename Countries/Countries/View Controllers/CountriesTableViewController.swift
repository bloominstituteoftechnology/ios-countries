//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by Ilgar Ilyasov on 12/4/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var countrySearchBar: UISearchBar!
    let countryController = CountryController()

    override func viewDidLoad() {
        super.viewDidLoad()
        countrySearchBar.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryController.countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        let country = countryController.countries[indexPath.row]
        
        cell.textLabel?.text = country.name
        
        return cell
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        
        countryController.searchForCountry(searchTerm: searchTerm) { (error) in
            if let error = error {
                NSLog("Error searching for country: \(error)")
                return
            }
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CellSegue" {
            guard let detailVC = segue.destination as? CountryDetailViewController,
                let indexPath = self.tableView.indexPathForSelectedRow else { return }
            let country = countryController.countries[indexPath.row]
            detailVC.country = country
        }
    }
}
