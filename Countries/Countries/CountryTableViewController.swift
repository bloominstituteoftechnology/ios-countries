//
//  CountryTableViewController.swift
//  Countries
//
//  Created by Lambda_School_Loaner_95 on 4/15/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.countrySearchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchTerm = searchBar.text
        if searchTerm != nil {
            countryController.fetchCountry(byName: searchTerm!) { (error) in
                if let error = error {
                    print("Error grabbing countries from controller: \(error)")
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    // MARK: - Table view data source

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countryController.countries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)

        let country = countryController.countries[indexPath.row]
        cell.textLabel?.text = country.name

        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            guard let destinationVC = segue.destination as? UINavigationController, let detailVC = destinationVC.topViewController as? CountryDetailViewController, let countryIndex = tableView.indexPathForSelectedRow?.row else { return }
            detailVC.country = countryController.countries[countryIndex]
            detailVC.countryController = countryController
            
            
        }
    }
    
    
    
    
    @IBOutlet weak var countrySearchBar: UISearchBar!
    let countryController = CountryController()
    

}
