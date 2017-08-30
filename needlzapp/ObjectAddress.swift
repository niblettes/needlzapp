//
//  ObjectAddress.swift
//  needlzapp
//
//  Created by scoobydoo on 08-15-2017.
//  Copyright © 2017 Spire Innovation. All rights reserved.
//

import Foundation
import CoreLocation

class Address {
    
// **********************************
// INIT
// **********************************
    
    init(location: CLLocation){
        self.location = location
    }
    
    
// **********************************
// PROPERTIES
// **********************************
    
    var location: CLLocation
    
// **********************************
// FUNCTIONS
// **********************************
    
    //print ("prop location: \(location)")
    
}
