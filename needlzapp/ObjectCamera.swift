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
    
    
    func checkAuthorized() {
        
        var cameraAuthorizationResult: (String, String)
        
        let authStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)

        
        switch authStatus {
        
        case .authorized:
            
            cameraAuthorizationResult = ("Authorized", "Already have access to camera")
            callback(cameraAuthorizationResult)
       
        case .notDetermined:
            
            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo) { response in
               
                if response {
                   
                    cameraAuthorizationResult = ("Success", "Thank you for authorizing camera access")
                    callback(cameraAuthorizationResult)
               
                } else {
                  
                    cameraAuthorizationResult = ("Error", "Camera access authorization is not determined")
                    callback(cameraAuthorizationResult)
                
                } // CLOSE if
           
            } // CLOSE completion handler
       
        case .restricted, .denied:
            
            cameraAuthorizationResult = ("Error", "Camera access has been restricted or denied")
            callback(cameraAuthorizationResult)
        
        } // CLOSE switch
 
 
    
    } // CLOSE checkAuthorized
    
    
    
    func displayCamera(){
        
        let session = AVCaptureDeviceDiscoverySession.init(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaTypeVideo, position: .back)
        
        
    } // CLOSE func displayCamera()

} // CLOSE class Camera()
