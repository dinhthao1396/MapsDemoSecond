//
//  ViewController.swift
//  MapsDemo
//
//  Created by Tran Dinh Thao on 7/26/17.
//  Copyright © 2017 Tran Dinh Thao. All rights reserved.
//
// ok ok ok
import UIKit
import  MapKit
import CoreLocation
class DirectionViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapsKitDemo: MKMapView!
    
    var latFromListDetail = Double()
    var lngFromListDetail = Double()
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(latFromListDetail)
        print(lngFromListDetail)
        directionData(lat: self.latFromListDetail, long: self.lngFromListDetail)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func directionData(lat: Double, long: Double){
        mapsKitDemo.delegate = self
        mapsKitDemo.showsScale = true
        mapsKitDemo.showsUserLocation = true
        mapsKitDemo.showsPointsOfInterest = true
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        let sourseCoordinates = locationManager.location?.coordinate
        let desCoordinates = CLLocationCoordinate2DMake(lat, long)
        //let desCoordinates = CLLocationCoordinate2D(latitude: 10.762622, longitude: 106.660172)
        
        let soursePlacemark = MKPlacemark(coordinate: sourseCoordinates!)
        let desPlacemark = MKPlacemark(coordinate: desCoordinates)
        print(soursePlacemark)
        let sourseItem = MKMapItem(placemark: soursePlacemark)
        let desItem = MKMapItem(placemark: desPlacemark)
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = sourseItem
        directionRequest.destination = desItem
        directionRequest.transportType = .walking
        let directions = MKDirections(request: directionRequest)
        directions.calculate(completionHandler: {
            response, error in
            
            guard let response = response else {
                if let error = error {
                    print("something wrong")
                    print(error)
                }
                return
            }
            let route = response.routes[0]
            self.mapsKitDemo.add(route.polyline, level: .aboveRoads)
            let rekt = route.polyline.boundingMapRect
            self.mapsKitDemo.setRegion(MKCoordinateRegionForMapRect(rekt), animated: true)
            
        })
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 5.0
        return renderer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

