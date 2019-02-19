//
//  MapVC.swift
//  ImaginaryBankLocator
//
//  Created by Majlinda Llugiqi on 2/16/19.
//  Copyright © 2019 Majlinda Llugiqi. All rights reserved.
//

import UIKit
import GoogleMaps

class MapVC: BaseVC, CLLocationManagerDelegate, GMSMapViewDelegate {
    @IBOutlet weak var btnList: UIButton!
    @IBOutlet weak var btnMyLocation: UIButton!
    @IBOutlet weak var btnLocation: UIButton!
    @IBOutlet weak var mapView: GMSMapView!
    
    var locationManager = CLLocationManager()
    var marker = GMSMarker()
    var markerCurrent = GMSMarker()
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMap()
        setGradientBackground()

        mapView.delegate = self
        var arrayOfMarkers:[GMSMarker] = []
        
         //set buttonsGradient
        btnLocation.setGradientBackground(colorOne: UIColor(red: 177.0/255.0, green: 222.0/255.0, blue: 98.0/255.0, alpha: 1.0) , colorTwo: UIColor(red: 95.0/255.0, green: 152.0/255.0, blue: 57.0/255.0, alpha: 1.0))
        btnList.setGradientBackground(colorOne: UIColor(red: 177.0/255.0, green: 222.0/255.0, blue: 98.0/255.0, alpha: 1.0) , colorTwo: UIColor(red: 95.0/255.0, green: 152.0/255.0, blue: 57.0/255.0, alpha: 1.0))
        btnMyLocation.setGradientBackground(colorOne: UIColor(red: 43.0/255.0, green: 101.0/255.0, blue: 102.0/255.0, alpha: 1.0), colorTwo: UIColor(red: 143.0/255.0, green: 149.0/255.0, blue: 149.0/255.0, alpha: 1.0))
     
        
        //MARKERS for branches and ATMs
        for i in 0..<(response.data?.count)!{
            var location = Location()
            location = response.data![i].location!
            let type = response.data![i].type
            
            if(type == "branch"){
                let markerImage = UIImage(named: "ic_pin_branch.png")!
                
                //creating a marker view
                let markerView = UIImageView(image: markerImage)
                let position = CLLocationCoordinate2DMake(location.lat!, location.long!)
                
                self.marker = GMSMarker(position: position)
                self.marker.iconView = markerView
                self.marker.map = self.mapView
                marker.infoWindowAnchor = CGPoint(x: 0.5, y: 0.2)
                marker.accessibilityLabel = "\(i)"
            }
            else{
                let markerImage = UIImage(named: "ic_pin_atm.png")!//.withRenderingMode(.alwaysTemplate)
                
                //creating a marker view
                let markerView = UIImageView(image: markerImage)
                let position = CLLocationCoordinate2DMake(location.lat!, location.long!)
                
                self.marker = GMSMarker(position: position)
                //let pinColor = UIColor.green
                self.marker.iconView = markerView
                self.marker.map = self.mapView
            }
            
            let positionL = CLLocationCoordinate2DMake(location.lat!, location.long!)
            arrayOfMarkers.append(GMSMarker(position: positionL))
            print(GMSMarker(position: positionL))
            print(arrayOfMarkers as Any)
        }
        var bounds = GMSCoordinateBounds()
        for marker in arrayOfMarkers
        {
            bounds = bounds.includingCoordinate(marker.position)
        }
        let update = GMSCameraUpdate.fit(bounds, withPadding: 60)
        mapView.animate(with: update)
        
    
    }
    //infoWindow shown on marker's tap
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        var infoWindow:CustomInfoWindow?
        infoWindow = (UINib(nibName: "InfoWindow", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomInfoWindow)
        for i in 0..<(response.data?.count)!{
            var location = Location()
            location = response.data![i].location!
            //check which marker
            if(marker.position.latitude == location.lat && marker.position.longitude == location.long)
            {
                infoWindow?.lblName.text = response.data?[i].name
                infoWindow?.lblAddress.text = response.data?[i].address
            }
        }

        return infoWindow
    }
    //tap the InfoWindow
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        for i in 0..<(response.data?.count)!{
            var location = Location()
            location = response.data![i].location!
            //check which marker
            if(marker.position.latitude == location.lat && marker.position.longitude == location.long)
            {
                let tappedDescription = response.data?[i]
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "detailsVC") as? DetailsVC
                vc!.currentATMorBranch = tappedDescription!
                self.navigationController?.pushViewController(vc!, animated: true)
            }
        }
        
    }
    func setUpMap(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        currentLocation = locationManager.location
        
        if(CLLocationManager.authorizationStatus() != .authorizedWhenInUse && CLLocationManager.authorizationStatus() != .authorizedAlways){
            print("not authorized")
            
        }
        else{
            if(currentLocation != nil){
                let position = CLLocationCoordinate2DMake(currentLocation.coordinate.latitude, currentLocation.coordinate.longitude)
                
                let markerImage = UIImage(named: "ic_pin_user.png")!//.withRenderingMode(.alwaysTemplate)
                
                //creating a marker view
                let markerView = UIImageView(image: markerImage)
                
                self.markerCurrent = GMSMarker(position: position)
                self.markerCurrent.title = "Current Location"
                self.markerCurrent.iconView = markerView
                self.markerCurrent.map = self.mapView
                
            }
            else{
                print("")
            }
            
        }
        
    }
   

    @IBAction func btnLocation(_ sender: Any) {
        
    }
    @IBAction func btnMyLocation(_ sender: Any) {
        currentLocation = locationManager.location
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude, zoom: 12.0)
          mapView.camera = camera
    }
    

}

