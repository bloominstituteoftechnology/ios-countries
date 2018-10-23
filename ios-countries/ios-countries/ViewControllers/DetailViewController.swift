//
//  DetailViewController.swift
//  ios-countries
//
//  Created by De MicheliStefano on 23.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var country: Country? {
        didSet {
            configureView()
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var currenciesLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    

    func configureView() {
        navigationController?.title = country?.name
        flagImageView?.image = country?.flag
        nameLabel?.text = country?.name
        regionLabel?.text = country?.region
        capitalLabel?.text = country?.capital
        populationLabel?.text = ""
        currenciesLabel?.text = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

