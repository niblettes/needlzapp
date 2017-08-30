//
//  MessageViewControll.swift
//  needlzapp
//
//  Created by scoobydoo on 08-14-2017.
//  Copyright © 2017 Spire Innovation. All rights reserved.
//

import Foundation

class MyMessage{
    
    
    var messageToDisplay: String = "" {

        willSet{
            
            print("message - old value: \(messageToDisplay)")
            
        }
        
        didSet{
            
            print("message - new value: \(messageToDisplay)")
            
        }
        
    }
    
 
    
}
