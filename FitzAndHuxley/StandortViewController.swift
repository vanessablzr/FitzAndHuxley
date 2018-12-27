//
//  StandortViewController.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 20.12.18.
//  Copyright © 2018 Vanessa Balzer. All rights reserved.
//

import UIKit
import MapKit

class StandortViewController: UIViewController {
    
    @IBOutlet weak var storeMapView: MKMapView!
    var locations : [MKPointAnnotation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        storeMapView.showsUserLocation = true
        storeMapView.delegate = self
    }
//    GMSMarkerOption? Artwork? MapAnnotionView
    
    func createAnnotations (){
        let annoi1 : MKPointAnnotation = MKPointAnnotation()
        annoi1.coordinate = CLLocationCoordinate2DMake(53.6542578, 10.0917126)
        annoi1.title = "Fitz and Huxley Hamburg"
        self.locations.append(annoi1)
        
        let annoi2 : MKPointAnnotation = MKPointAnnotation()
        annoi2.coordinate = CLLocationCoordinate2DMake(52.5015753, 13.34100352)
        annoi2.title = "Fitz and Huxley Berlin"
        self.locations.append(annoi2)
        
        let annoi3 : MKPointAnnotation = MKPointAnnotation()
        annoi3.coordinate = CLLocationCoordinate2DMake(48.2083024, 11.5631668)
        annoi3.title = "Fitz and Huxley München"
        self.locations.append(annoi3)
    }
}

extension StandortViewController : MKMapViewDelegate {
    func mapView (_ mapView : MKMapView, didUpdate userLocation: MKUserLocation) {
        let coordinate = userLocation.coordinate
        let region : MKCoordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 100000, longitudinalMeters: 100000)
        storeMapView.setRegion(region, animated: true)
    }
    
    
    
}
