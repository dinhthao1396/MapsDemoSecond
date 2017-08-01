//
//  MapsNearbyViewController.swift
//  MapsDemo
//
//  Created by Tran Dinh Thao on 7/28/17.
//  Copyright © 2017 Tran Dinh Thao. All rights reserved.
// sss vvvvvv
// ok ok ok
import UIKit
import MapKit
import CoreLocation

class MapsNearbyViewController: UIViewController, MKMapViewDelegate { //, CLLocationManagerDelegate
    
    @IBOutlet weak var mapsToShow: MKMapView!
    
    var dataMapsType = Int()
    var urlString = ""
    var dataRecevie = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        mapsToShow.delegate = self
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showNearLocation(lat: Double, lng: Double, name: String, address: String){
        mapsToShow.delegate = self
        mapsToShow.showsScale = true
        mapsToShow.showsUserLocation = true
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapsToShow.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = name
        annotation.subtitle = address
        annotation.coordinate = location
        self.mapsToShow.addAnnotation(annotation)
    }
    func showData(array: [ModelOfDirec]) {
        
        for i in 0..<array.count {
            showNearLocation(lat: Double(array[i].lat), lng: Double(array[i].lng), name: array[i].name, address: array[i].vicinity)
        }
        
    }
    func loadData() {
        
        switch dataRecevie {
        case 0:
            urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=10.7657374,106.67110279999997&radius=2000&type=restaurant&key=AIzaSyAIi4TJkiMAfZR3vUk_mptHDbB2QQboEAg"
        case 1:
            urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=10.7657374,106.67110279999997&radius=2000&type=hospital&key=AIzaSyAIi4TJkiMAfZR3vUk_mptHDbB2QQboEAg"
        case 2:
            urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=10.7657374,106.67110279999997&radius=2000&type=school&key=AIzaSyAIi4TJkiMAfZR3vUk_mptHDbB2QQboEAg" // done
        case 3:
            urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=10.7657374,106.67110279999997&radius=2000&type=hotel&key=AIzaSyAIi4TJkiMAfZR3vUk_mptHDbB2QQboEAg" // done
        case 4:
            urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=10.7657374,106.67110279999997&radius=5000&type=museum&key=AIzaSyAIi4TJkiMAfZR3vUk_mptHDbB2QQboEAg"
            
        default:
            urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=10.7657374,106.67110279999997&radius=2000&type=restaurant&key=AIzaSyAIi4TJkiMAfZR3vUk_mptHDbB2QQboEAg"
        }
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print("Some thing Wrong")
            } else
            {
                
                
                OperationQueue.main.addOperation{
                do {
                    
                        
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                    guard let topApps = TopApps(json: parsedData) else {return}
                    guard let appItem = topApps.results  else {return}
                    for i in 0..<appItem.count {
                        self.showNearLocation(lat: Double(appItem[i].lat), lng: Double(appItem[i].lng), name: appItem[i].name, address: appItem[i].vicinity)
                    }
                } catch let error as NSError {
                    print(error)
                }
                catch let someError as NSException{
                    print(someError)
                }
               
                }
                

            }
           // }
            }.resume()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
