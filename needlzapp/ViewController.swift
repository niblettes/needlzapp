//
//  ViewController.swift
//  needlzapp
//
//  Created by scoobydoo on 08-12-2017.
//  Copyright © 2017 Spire Innovation. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

// **********************************
// IB
// **********************************
    
    @IBOutlet weak var cameraView: UIView!
    
// **********************************
// VARIABLES
// **********************************

    // The object that you use to start and stop the delivery of location-related events to your app.
    let myLocationManager = CLLocationManager()
    
    // Object that takes and displays system feedback messages to the UI
    let myMessage = MyMessage()
    
    // Needle Object
    let myNeedle = Needle()
    
    // Display camera
    let myCamera = Camera()

    
// **********************************
// VIEW LIFECYCLE EVENTS
// **********************************
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // check camera
        checkCameraAuthorized(){
            
        }
        
        // if can get location, get it
        myLocationManager.delegate = self
        
        if checkLocationAuthorization().status == "Success" {
            
            myLocationManager.requestLocation()
            
        } else {
            
        } // CLOSE if
    
    } // CLOSE viewDidLoad
    
    

// **********************************
// FUNCTIONS: LOCATION
// **********************************
    
    authorized
    enabled
    
    
    func setupStuff(){
        
        auth(){
            
            // auth completes then runs this
            enabled()
            
        }
        
        print (results)
        
    }
    
    function auth() {
    
    }
    
    func enabled(){
        
    }
    
    
    private func checkLocationAuthorization() -> (status: String, message: String) {
        
        print("check location auth")
        
        // Test 1:
        // if Location Authorization
        switch CLLocationManager.authorizationStatus() {
            
        case .notDetermined:
        
            myLocationManager.requestWhenInUseAuthorization()
            return ("Error", "Location authorization status cannot be determined")
            
        case .authorizedWhenInUse, .authorizedAlways:
            
            myMessage.messageToDisplay = "location access authorized"
            
            // Test 2:
            // if Location Enabled
            if CLLocationManager.locationServicesEnabled() {
                
                return ("Success", "Location services are enabled")
                
            } else {
                
                myLocationManager.requestWhenInUseAuthorization()
                return ("Error", "Location services are disabled")

            } // CLOSE if
            
        case .denied, .restricted:
            
            return ("Error", "Location authorization is denied")

            
        } // CLOSE switch
        
    } // CLOSE checkLocationAuthorization()
    
    
    
    // DELEGATE METHOD
    // when the user first tries the app it has no authorization.  
    // when the user authorizes we need to run checkLocationAuthorization again
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        checkLocationAuthorization()
    
    } // CLOSE didChangeAuthoriazation
    
    
    
    // DELETGATE METHOD:  CANNOT get location
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    
        myMessage.messageToDisplay = "Failed to Get Location"
    
    } // CLOSE didFailWithError
    
    
    
    
    // DELEGATE METHOD:  CAN get location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
     
        // OFF MAIN
        DispatchQueue.global(qos: .userInitiated).async {
            
            if let currentLocation = locations.first {
               
               self.myNeedle.myLocation = currentLocation
                
            } // CLOSE if let
            
            // ON MAIN
            DispatchQueue.main.async {
            
 
            
            } // CLOSE dispatch .main
            
        } // CLOSE dispatch .userInitiated
        
    }// CLOSE didUpdateLocations
    
}

