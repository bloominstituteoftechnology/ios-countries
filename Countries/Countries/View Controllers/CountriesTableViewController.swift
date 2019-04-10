//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by Moses Robinson on 4/9/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    // MARK: - Properties
    
    let countryController = CountryController()

}
