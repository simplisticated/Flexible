//
//  MappingClosure.swift
//  Flexible
//
//  Created by Igor Matyushkin on 01.08.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public typealias MappingClosure<Source: Any, Result: Any> = (_ source: Source) -> Result
