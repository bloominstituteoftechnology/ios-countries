//
//  CountryTableViewController.swift
//  Countries
//
//  Created by Lambda_School_Loaner_34 on 4/15/19.
//  Copyright © 2019 Frulwinn. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController, UISearchBarDelegate {
    
    //MARK: - Properties
    let countryController = CountryController()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchTerm = searchBar.text else { return }
        
        countryController.fetchCountries(countryName: searchTerm) { (error) in
            
            if let error = error {
                NSLog("Error found fetching country array: \(error)")
                return
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
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
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDetail" {
            
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            // the destination is now a navigation controller, not the ColorDetailVC
            let navigationController = segue.destination as! UINavigationController
            
            let destination = navigationController.topViewController as? CountryDetailViewController
            
            destination?.country = countryController.countries[indexPath.row]
        }
    }

}
