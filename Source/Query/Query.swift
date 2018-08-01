//
//  Query.swift
//  Flexible
//
//  Created by Igor Matyushkin on 01.08.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public struct Query<SourceElement: Any, ResultElement: Any> {
    var selection: Selection
    var mapping: MappingClosure<SourceElement, ResultElement>?
    var filter: FilterClosure<SourceElement>?
}
