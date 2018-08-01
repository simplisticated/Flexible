//
//  Steps.swift
//  Flexible
//
//  Created by Igor Matyushkin on 01.08.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public struct Steps {
    
    /*
     * Take step.
     */
    public struct Take<SourceElement: Any> {
        var sourceArray: Array<SourceElement>
        
        public func take(_ selection: Selection) -> Mapping<SourceElement> {
            return Mapping(
                sourceArray: self.sourceArray,
                selection: selection
            )
        }
    }
    
    /*
     * Mapping step.
     */
    public struct Mapping<SourceElement: Any> {
        var sourceArray: Array<SourceElement>
        var selection: Selection
        
        public func mapped<ResultElement: Any>(_ closure: @escaping MappingClosure<SourceElement, ResultElement>) -> Filter<SourceElement, ResultElement> {
            return Filter(
                sourceArray: self.sourceArray,
                selection: self.selection,
                mapping: closure
            )
        }
        
        public func noMapping() -> Filter<SourceElement, SourceElement> {
            return Filter(
                sourceArray: self.sourceArray,
                selection: self.selection,
                mapping: nil
            )
        }
    }
    
    /*
     * Filter step.
     */
    public struct Filter<SourceElement: Any, ResultElement: Any> {
        var sourceArray: Array<SourceElement>
        var selection: Selection
        var mapping: MappingClosure<SourceElement, ResultElement>?
        
        public func `where`(_ filter: @escaping FilterClosure<SourceElement>) -> [ResultElement] {
            let query = Query(
                selection: self.selection,
                mapping: self.mapping,
                filter: filter
            )
            
            let executor = Executor(sourceArray: self.sourceArray, query: query)
            return executor.run()
        }
        
        public func noFilter() -> [ResultElement] {
            let query = Query(
                selection: self.selection,
                mapping: self.mapping,
                filter: nil
            )
            
            let executor = Executor(sourceArray: self.sourceArray, query: query)
            return executor.run()
        }
    }
    
}
