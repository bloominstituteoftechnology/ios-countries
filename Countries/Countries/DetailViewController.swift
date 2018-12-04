//
//  DetailViewController.swift
//  Countries
//
//  Created by Farhan on 12/4/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var flagImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var regionLabel: UILabel!
    
    @IBOutlet weak var capitalLabel: UILabel!
    
    @IBOutlet weak var popLabel: UILabel!
    
    
    var country: Country?{
        didSet{
            updateViews()
        }
    }

    func updateViews()
    {
        guard let country = country, isViewLoaded else {return}
        
        nameLabel.text = country.name
        regionLabel.text = country.region
        capitalLabel.text = country.capital
        popLabel.text = "\(country.population) people"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

 


}

