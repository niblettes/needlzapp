//
//  ObjectCamera.swift
//  needlzapp
//
//  Created by scoobydoo on 08-15-2017.
//  Copyright © 2017 Spire Innovation. All rights reserved.
//

import Foundation
import AVFoundation

class Camera {
    
    
    // **********************************
    // PROPERTIES
    // **********************************
    
    

    
    // **********************************
    // FUNCTIONS
    // **********************************
    
    
    func checkAuthorized() -> Void {
        
        switch AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo) {
        
        case .authorized:
            
            self.alertUser("Authorized", "Already authorized to use camera")

        case .notDetermined:
            
            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo) { response in
               
                if response {
                   
                    self.displayCamera()
                    
                } else {
                    
                    self.alertUser("Failed","Camera access authorization is not determined")
                
                } // CLOSE if

           
            } // CLOSE completion handler
            
       
        case .restricted, .denied:
            
            self.alertUser("Error", "Camera access has been restricted or denied")
        
        } // CLOSE switch
        
        
 
    } // CLOSE checkAuthorized
    
    func alertUser(_ status: String, _ message: String) -> Void {
        print ("My Callback: \(status), \(message)")
    }
    
    
    func displayCamera(){
        
        let session = AVCaptureDeviceDiscoverySession.init(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaTypeVideo, position: .back)
        
        
    } // CLOSE func displayCamera()

} // CLOSE class Camera()
