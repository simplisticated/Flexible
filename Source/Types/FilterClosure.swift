//
//  FilterClosure.swift
//  Flexible
//
//  Created by Igor Matyushkin on 01.08.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public typealias FilterClosure<Element: Any> = (_ element: Element) -> Bool
