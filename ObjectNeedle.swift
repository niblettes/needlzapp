//
//  ObjNeedle.swift
//  needlzapp
//
//  Created by scoobydoo on 08-12-2017.
//  Copyright © 2017 Spire Innovation. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class Needle {

    
// **********************************
// PROPERTIES
// **********************************
    
    var myLocation: CLLocation?{
    
        willSet{

        }
        
        didSet{
            
            // unwrap myLocation optional
            if let thisLocation = myLocation{
                
                // populate address string varaibles
                var myAddress = Address(location: thisLocation)
            
            } else {
                
                // error with location
                
            }

        }
        
    }
    
    
    var myMap: UIImage?
    var myPhoto: UIImage?
    
    var myLat: String      = ""
    var myLon: String      = ""
    var myAddress: String  = ""
    
    let time = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)


    
}
