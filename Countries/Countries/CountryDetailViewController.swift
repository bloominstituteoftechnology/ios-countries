//
//  CountryDetailViewController.swift
//  Countries
//
//  Created by Carolyn Lea on 10/23/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController
{

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var regionLabel: UILabel!
    @IBOutlet var capitalLabel: UILabel!
    @IBOutlet var populationLabel: UILabel!
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var languageLabel: UILabel!
    @IBOutlet var demonymLabel: UILabel!
    
    @IBOutlet var mapView: UIView!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateViews()
    }
    

    private func updateViews()
    {
        
    }

}
