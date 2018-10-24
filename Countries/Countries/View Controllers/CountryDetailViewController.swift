//
//  CountryDetailViewController.swift
//  Countries
//
//  Created by Linh Bouniol on 10/23/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit
import MapKit

class CountryDetailViewController: UIViewController, MKMapViewDelegate {
    
    // MARK: - Properties
    
    var country: Country? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Outlets/Actions
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var currenciesLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    // MARK: - Methods
    
    private func updateViews() {
        guard let country = country, isViewLoaded else { return }
        
        navigationItem.title = country.name
        regionLabel.text = "Region: \(country.region)"
        capitalLabel.text = "Capital: \(country.capital)"
        populationLabel.text = "Population: \(country.population)"
        currenciesLabel.text = "Currencies: \(country.currencies.joined(separator: ", "))"
        languagesLabel.text = "Languages: \(country.languages.joined(separator: ", "))"
        
        imageView.image = UIImage(named: "\(country.alpha3Code)")
        
        mapView.region = MKCoordinateRegion(center: country.coordinate, span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0))
        
        // span is the angle of how much the region takes up?
    }
}
