//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Daniel Salazar on 11/30/19.
//  Copyright © 2019 Daniel Salazar. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var mapView: MKMapView!
    
    // Programmatically create an MKMapView with constraints
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        // Set mapView as the root view
        view = mapView
        
        // Create segmentedControl
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satelite"])
        // Set background to white
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        // Start selection on "Standard"
        segmentedControl.selectedSegmentIndex = 0
        // Turn off default translation
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        // Add the segmentedControl to the view
        view.addSubview(segmentedControl)
        
//         Create layout constraints for segmentedControl manually
//        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
//        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        // Create layout constraints using safee area layout guide
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        
        // Activate constraints for segmentedControl
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        // Call function to change map when user clicks on different buttons
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Map loaded")
        // Do any additional setup after loading the view.
    }
    
    // Changes the map type
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
             break
        }
    }
}
