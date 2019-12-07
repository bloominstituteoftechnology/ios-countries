//
//  MasterViewController.swift
//  Countries
//
//  Created by Michael Stoffer on 12/7/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    @IBOutlet weak var countrySearchBar: UISearchBar!
    var detailViewController: DetailViewController? = nil

    let countryController = CountryController()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = editButtonItem

//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
//        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        self.countrySearchBar.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    @objc
    func insertNewObject(_ sender: Any) {
//        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let country = self.countryController.countries[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.country = country
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                detailViewController = controller
            }
        }
    }

    // MARK: - Table View

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryController.countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        let country = countryController.countries[indexPath.row]
        cell.textLabel!.text = country.name
        return cell
    }
}

extension MasterViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = self.countrySearchBar.text else { return }
        
        self.countryController.searchForCountry(searchTerm: searchTerm) { (countries, error) in
            if let error = error {
                NSLog("Error searching for Countries: \(error)")
            }
            
            if let countries = countries {
                DispatchQueue.main.async {
                    self.countryController.countries = countries
                    self.tableView.reloadData()
                }
            }
        }
    }
}
