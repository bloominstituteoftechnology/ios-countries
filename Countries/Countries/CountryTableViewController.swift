//
//  CountryTableViewController.swift
//  Countries
//
//  Created by Carolyn Lea on 10/23/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController
{
    @IBOutlet var searchTextField: UITextField!
    let countryController = CountryController()
    var allCountries: [Country] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        //tableView.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        countryController.fetchCountries { (error) in
            if let error = error
            {
                NSLog("Error fetching countries from network: \(error)")
            }
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        print(self.countryController.countries.count)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return countryController.countries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)

        let country = countryController.countries[indexPath.row]
        cell.textLabel?.text = country.name
        cell.detailTextLabel?.text = country.capital
        
        
        return cell
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "ShowDetail"
        {
            let detailView = segue.destination as! CountryDetailViewController
            if let indexPath = tableView.indexPathForSelectedRow
            {
                detailView.country = countryController.countries[indexPath.row]
                
            }
            
            detailView.countryController = countryController
            
        }
    }
    

}
