//
//  ComplexDoubleArray+Zip.swift
//  VecLab
//
//  Created by Marcus Painter on 25/04/2025.
//

import Foundation

extension ComplexDoubleArray {
    
    /// Combine another complex array and transform it.
    /// - Parameters:
    ///   - other: Another complex array.
    ///   - transform: transform description.
    /// - Returns: A new transformed complex array.
    public func zipMap(_ other: ComplexDoubleArray, _ transform: (Complex, Complex) throws -> Complex) rethrows
        -> ComplexDoubleArray {
        let minCount = Swift.min(self.count, other.count)
        var result = ComplexDoubleArray(count: minCount)
        
        for i in 0..<minCount {
            result[i] = try transform(self[i], other[i])
        }
        
        return result
    }

    /// Combine another complex array and transform it.
    /// - Parameters:
    ///   - other: Another complex array.
    ///   - transform: transform description.
    /// - Returns: A new transformed complex array.
    public func zipCompactMap(_ other: ComplexDoubleArray, _ transform: (Complex, Complex) throws -> Complex?) rethrows
        -> ComplexDoubleArray {
        let minCount = Swift.min(self.count, other.count)
        var tempResults = [Complex?](repeating: nil, count: minCount)
        var resultCount = 0
        
        // First pass: collect transformed values and count non-nil results
        for i in 0..<minCount {
            tempResults[i] = try transform(self[i], other[i])
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

    /// Combine another complex array and filter it.
    /// - Parameters:
    ///   - other: Another complex array.
    ///   - predicate: Filter criteria.
    /// - Returns: A new transformed complex array.
    public func zipFilter(_ other: ComplexDoubleArray, _ predicate: (Complex, Complex) throws -> Bool) rethrows
        -> ComplexDoubleArray {
        let minCount = Swift.min(self.count, other.count)
        var inclusion = [Bool](repeating: false, count: minCount)
        var resultCount = 0
        
        // First pass: determine which elements to include
        for i in 0..<minCount {
            inclusion[i] = try predicate(self[i], other[i])
            if inclusion[i] {
                resultCount += 1
            }
        }
        
        // Second pass: allocate exact size and fill
        var result = ComplexDoubleArray(count: resultCount)
        
        var resultIndex = 0
        for i in 0..<minCount {
            if inclusion[i] {
                result[resultIndex] = self[i]
                resultIndex += 1
            }
        }
        
        return result
    }
    
    /// Combine another complex array and performs a closure operation.
    /// - Parameters:
    ///   - other: Another complex array.
    ///   - operation: Closure operation.
    public func zipForEach(_ other: ComplexDoubleArray, _ operation: (Complex, Complex) throws -> Void) rethrows {
        let minCount = Swift.min(self.count, other.count)
        
        for i in 0..<minCount {
            try operation(self[i], other[i])
        }
    }
}
