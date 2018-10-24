//
//  CountryTableViewController.swift
//  Countries
//
//  Created by Carolyn Lea on 10/23/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController, UITextFieldDelegate
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
        searchTextField.delegate = self
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

    func image( _ image:UIImage, withSize newSize:CGSize) -> UIImage
    {
        
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0,y: 0,width: newSize.width,height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!.withRenderingMode(.automatic)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)

        let country = countryController.countries[indexPath.row]
        let imageName = country.alpha3Code.lowercased()
        cell.imageView?.image = image(UIImage(named: imageName)!, withSize: CGSize(width: 40, height: 30))
        cell.textLabel?.text = country.name
        cell.detailTextLabel?.text = country.capital
        
        
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let searchTerm = searchTextField.text, !(searchTextField != nil) else {return false}
        countryController.searchForCountry(with: searchTerm) { (Country, Error) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        return true
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
