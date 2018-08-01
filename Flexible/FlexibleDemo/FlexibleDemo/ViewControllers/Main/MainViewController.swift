//
//  MainViewController.swift
//  FlexibleDemo
//
//  Created by Igor Matyushkin on 24.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit
import Flexible

class MainViewController: UIViewController {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Outlets
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize navigation bar
        
        self.navigationItem.title = "Main Screen"
        
        let array = [
            1, 2, 3, 4, 5, 6, 7, 8, 9, 10
        ]
        
        let result = array.flx.take(.last(count: 4))
            .mapped { (number) -> String in
                return String(
                    format: "value = %d",
                    number
                )
            }
            .where { (number) -> Bool in
                return number < 8
            }
        
        print(result)
    }
    
    // MARK: Private object methods
    
    // MARK: Actions
    
}
