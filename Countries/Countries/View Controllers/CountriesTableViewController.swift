//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by Linh Bouniol on 10/23/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    
    // MARK: - Outlets/Actions
    
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)

        // Configure the cell...

        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       ShowDetail
    }
}
