//
//  CountrySearchTableViewController.swift
//  ios-countries
//
//  Created by Conner on 10/23/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit

class CountrySearchTableViewController: UITableViewController {
    // MARK: - Properties
    let countryController = CountryController()

    // MARK: - Outlets
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryController.countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        
        let country = countryController.countries[indexPath.row]
        let countryFlag = country.flag
        let imageName = String(URL(fileURLWithPath: countryFlag).deletingPathExtension().lastPathComponent)
        cell.textLabel?.text = country.name
        cell.imageView?.image = UIImage(imageLiteralResourceName: imageName)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UISearchBarDelegate
extension CountrySearchTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return } // Make sure there is text in the search
        
        // perform search with search term
        countryController.performSearch(for: searchTerm) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
