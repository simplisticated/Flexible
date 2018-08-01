//
//  ArrayExtensionQuery.swift
//  Flexible
//
//  Created by Igor Matyushkin on 28.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public extension Array {
    
    public var flx: Steps.Take<Element> {
        get {
            return Steps.Take(
                sourceArray: self
            )
        }
    }
    
}
