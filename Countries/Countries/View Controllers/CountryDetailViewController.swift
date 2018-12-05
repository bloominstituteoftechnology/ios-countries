//
//  CountryDetailViewController.swift
//  Countries
//
//  Created by Ilgar Ilyasov on 12/4/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    var country: Country? {
        didSet { updateViews() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    func updateViews() {
        
    }
}
