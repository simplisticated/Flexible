//
//  QueryExecutor.swift
//  Flexible
//
//  Created by Igor Matyushkin on 01.08.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public class Executor<SourceElement: Any, ResultElement: Any> {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    internal init(sourceArray: Array<SourceElement>, query: Query<SourceElement, ResultElement>) {
        self.sourceArray = sourceArray
        self.query = query
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    fileprivate var sourceArray: Array<SourceElement>!
    
    fileprivate var query: Query<SourceElement, ResultElement>!
    
    // MARK: Public object methods
    
    public func run() -> [ResultElement] {
        switch query.selection {
        case .first(let count):
            return self.takeFirst(count: count)
        case .last(let count):
            return self.takeLast(count: count)
        case .all:
            return self.takeAll()
        }
    }
    
    // MARK: Private object methods
    
    fileprivate func sourceElement(_ element: SourceElement, passesFilterFrom query: Query<SourceElement, ResultElement>) -> Bool {
        guard let filter = query.filter else {
            return true
        }
        
        return filter(element)
    }
    
    fileprivate func sourceElement(_ element: SourceElement, mappedWith query: Query<SourceElement, ResultElement>) -> ResultElement {
        guard let mapping = query.mapping else {
            return element as! ResultElement
        }
        
        return mapping(element)
    }
    
    fileprivate func maximumNumberOfResultElements(for query: Query<SourceElement, ResultElement>, appliedTo sourceArray: Array<SourceElement>) -> Int {
        switch query.selection {
        case .first(let count):
            return min(count, sourceArray.count)
        case .last(let count):
            return min(count, sourceArray.count)
        case .all:
            return sourceArray.count
        }
    }
    
    fileprivate func takeFirst(count: Int) -> [ResultElement] {
        guard count > 0 else {
            return []
        }
        
        guard !self.sourceArray.isEmpty else {
            return []
        }
        
        var resultArray = Array<ResultElement>()
        
        let firstIndex = 0
        let lastIndex = self.sourceArray.count - 1
        
        for i in stride(from: firstIndex, through: lastIndex, by: 1) {
            let sourceElement = self.sourceArray[i]
            
            guard self.sourceElement(sourceElement, passesFilterFrom: self.query) else {
                continue
            }
            
            let resultElement = self.sourceElement(sourceElement, mappedWith: self.query)
            resultArray.append(resultElement)
            
            guard resultArray.count < self.maximumNumberOfResultElements(for: self.query, appliedTo: self.sourceArray) else {
                break
            }
        }
        
        return resultArray
    }
    
    fileprivate func takeLast(count: Int) -> [ResultElement] {
        guard count > 0 else {
            return []
        }
        
        guard !self.sourceArray.isEmpty else {
            return []
        }
        
        var resultArray = Array<ResultElement>()
        
        let firstIndex = self.sourceArray.count - 1
        let lastIndex = 0
        
        for i in stride(from: firstIndex, through: lastIndex, by: -1) {
            let sourceElement = self.sourceArray[i]
            
            guard self.sourceElement(sourceElement, passesFilterFrom: self.query) else {
                continue
            }
            
            let resultElement = self.sourceElement(sourceElement, mappedWith: self.query)
            resultArray.insert(resultElement, at: 0)
            
            guard resultArray.count < self.maximumNumberOfResultElements(for: self.query, appliedTo: self.sourceArray) else {
                break
            }
        }
        
        return resultArray
    }
    
    fileprivate func takeAll() -> [ResultElement] {
        var resultArray = Array<ResultElement>()
        
        for sourceElement in self.sourceArray {
            guard self.sourceElement(sourceElement, passesFilterFrom: self.query) else {
                continue
            }
            
            let resultElement = self.sourceElement(sourceElement, mappedWith: self.query)
            resultArray.append(resultElement)
        }
        
        return resultArray
    }
    
}
