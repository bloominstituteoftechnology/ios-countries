//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by Moin Uddin on 12/4/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        return cell
    }

 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
    }


}
