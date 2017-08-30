//
//  ObjectAlert.swift
//  needlzapp
//
//  Created by scoobydoo on 08-20-2017.
//  Copyright © 2017 Spire Innovation. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    var myTitle: String
    var myMessage: String

    init(title: String, message: String){
        myTitle = title
        myMessage = message
        
    }
    
    private let alertController = UIAlertController(title: myTitle, message: myMessage, preferredStyle: UIAlertControllerStyle.alert)
        
    private let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
        print("Cancel")
    }
    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
        print("OK")
    }
        

    alertController.addAction(okAction)
    alertController.addAction(cancelAction)
    self.present(alertController, animated: true, completion: nil)

} // CLOSE class
