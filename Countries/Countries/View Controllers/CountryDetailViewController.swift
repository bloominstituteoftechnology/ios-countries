//
//  CountryDetailViewController.swift
//  Countries
//
//  Created by Linh Bouniol on 10/23/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    // MARK: - Outlets/Actions
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var currenciesLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
