//
//  ComplexDoubleArray+Enumerated.swift
//  VecLab
//
//  Created by Marcus Painter on 24/04/2025.
//

import Foundation

extension ComplexDoubleArray {
    
    /// Enumerate and transform the complex array.
    /// - Parameter transform: transform closure.
    /// - Returns: A new transformed complex array.
    public func enumeratedMap(_ transform: (Int, Complex) throws -> Complex) rethrows
        -> ComplexDoubleArray {
        var result = ComplexDoubleArray(count: count)
        
        for i in 0..<count {
            result[i] = try transform(i, self[i])
        }
        return result
    }
    
    /// Enumerate and transform the complex array.
    /// - Parameter transform: Transform closure.
    /// - Returns: A new transformed complex array.
    public func enumeratedCompactMap(_ transform: (Int, Complex) throws -> Complex?) rethrows
        -> ComplexDoubleArray {
        var tempResults = [Complex?](repeating: nil, count: count)
        var resultCount = 0
        
        // First pass: collect transformed values and count non-nil results
        for i in 0..<count {
            tempResults[i] = try transform(i, self[i])
            if tempResults[i] != nil {
                resultCount += 1
            }
        }
        
        // Second pass: allocate exact size and fill
        var result = ComplexDoubleArray(count: resultCount)
        
        var resultIndex = 0
        for temp in tempResults {
            if let value = temp {
                result[resultIndex] = value
                resultIndex += 1
            }
        }
        
        return result
    }
    
    /// Enumerate and filter a complex array.
    /// - Parameter predicate: Filter closure.
    /// - Returns: A new transformed complex array.
    public func enumeratedFilter(_ predicate: (Int, Complex) throws -> Bool) rethrows
        -> ComplexDoubleArray {
        var inclusion = [Bool](repeating: false, count: count)
        var resultCount = 0
        
        // First pass: determine which elements to include
        for i in 0..<count {
            inclusion[i] = try predicate(i, self[i])
            if inclusion[i] {
                resultCount += 1
            }
        }
        
        // Second pass: allocate exact size and fill
        var result = ComplexDoubleArray(count: resultCount)
        
        var resultIndex = 0
        for i in 0..<count {
            if inclusion[i] {
                result[resultIndex] = self[i]
                resultIndex += 1
            }
        }
        
        return result
    }
    
    /// Enumerate and perform an operation.
    /// - Parameter operation: Operation closure.
    public func enumeratedForEach(_ operation: (Int, Complex) throws -> Void) rethrows {
        for i in 0..<count {
            try operation(i, self[i])
        }
    }
}
