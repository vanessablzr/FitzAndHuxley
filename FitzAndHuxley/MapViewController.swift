//
//  MapViewController.swift
//  FitzAndHuxley
//
//  Created by Vanessa Balzer on 25.12.18.
//  Copyright © 2018 Vanessa Balzer. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
//    Pins für jeden Standort
    var pinHamburg = MKPointAnnotation()
    var pinMunich = MKPointAnnotation()
    var pinBerlin = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        mapView.showsUserLocation = true
        
//        Erster Standort Hamburg
        let hamburgCoordinate = CLLocationCoordinate2D(latitude: 53.5548584, longitude: 9.9894992)
        pinHamburg.coordinate = hamburgCoordinate
        pinHamburg.title = "Fitz and Huxley Hamburg"
        pinHamburg.subtitle = "Jungfernstieg 45, 20354 Hamburg"
        mapView.addAnnotation(pinHamburg)
 
//        Zweiter Standort München
        let munichCoordinate = CLLocationCoordinate2D(latitude: 48.1387399, longitude: 11.5697144)
        pinMunich.coordinate = munichCoordinate
        pinMunich.title = "Fitz and Huxley München"
        pinMunich.subtitle = "Neuhauser Straße 8, 80331 München"
        mapView.addAnnotation(pinMunich)

//        Dritter Standort Berlin
        let berlinCoordinate = CLLocationCoordinate2D(latitude: 52.527231, longitude: 13.3969531)
        pinBerlin.coordinate = berlinCoordinate
        pinBerlin.title = "Fitz and Huxley Berlin"
        pinBerlin.subtitle = "Kleiner Hamburger Straße 15, 10117 Berlin"
        mapView.addAnnotation(pinBerlin)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is MKAnnotationView){
            return nil
        }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "LocationIdentifier")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "LocationIdenfifier")
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
