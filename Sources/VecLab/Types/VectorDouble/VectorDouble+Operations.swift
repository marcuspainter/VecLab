//
//  VectorDouble+Operations.swift
//  VecLab
//
//  Created by Marcus Painter on 23/04/2025.
//

import Foundation

// MARK: - Collection Operation Overrides

extension VectorDouble {
    /// Returns a new VectorDouble containing the results of mapping the given closure over the sequence's elements.
    public func map(_ transform: (Double) throws -> Double) rethrows -> VectorDouble {
        let resultCount = count
        let result = VectorDouble(count: resultCount)
        
        for i in 0..<resultCount {
            result[i] = try transform(self[i])
        }
        
        return result
    }
    
    /// Returns a new VectorDouble containing the elements that satisfy the given predicate.
    public func filter(_ isIncluded: (Double) throws -> Bool) rethrows -> VectorDouble {
        // For filter, we can't know the size in advance, so use a temporary array
        var tempValues = [Double]()
        tempValues.reserveCapacity(count) // Reserve capacity as optimization
        
        for i in 0..<count {
            let value = self[i]
            if try isIncluded(value) {
                tempValues.append(value)
            }
        }
        
        // Create final result with exact size
        let result = VectorDouble(count: tempValues.count)
        for i in 0..<tempValues.count {
            result[i] = tempValues[i]
        }
        
        return result
    }
    
    /// Returns a new VectorDouble by applying a filter and map in a single pass.
    public func compactMap(_ transform: (Double) throws -> Double?) rethrows -> VectorDouble {
        // Size unknown in advance
        var tempValues = [Double]()
        tempValues.reserveCapacity(count) // Reserve capacity as optimization
        
        for i in 0..<count {
            if let value = try transform(self[i]) {
                tempValues.append(value)
            }
        }
        
        // Create final result with exact size
        let result = VectorDouble(count: tempValues.count)
        for i in 0..<tempValues.count {
            result[i] = tempValues[i]
        }
        
        return result
    }
    
    /// Returns a new VectorDouble containing the elements of this VectorDouble in sorted order.
    public func sorted(by areInIncreasingOrder: ((Double, Double) throws -> Bool)? = nil) rethrows -> VectorDouble {
        let sortedIndices: [Int]
        
        if let comparator = areInIncreasingOrder {
            // Sort indices based on the provided comparator
            sortedIndices = try (0..<count).sorted { i, j in
                try comparator(self[i], self[j])
            }
        } else {
            // Use default ascending order if no comparator provided
            sortedIndices = (0..<count).sorted { i, j in
                self[i] < self[j]
            }
        }
        
        // Create result and populate it in sorted order
        let result = VectorDouble(count: count)
        for (newIndex, sourceIndex) in sortedIndices.enumerated() {
            result[newIndex] = self[sourceIndex]
        }
        
        return result
    }
    
    // Note: The standard slicing operations (prefix, suffix, dropFirst, dropLast)
    // don't need to be implemented explicitly since they will use our custom subscript(bounds:)
    // implementation through the Collection protocol's default implementations.
}

// MARK: - Convenience Methods

extension VectorDouble {
    /// Creates a new VectorDouble by concatenating the given vectors.
    public static func concat(_ vectors: VectorDouble...) -> VectorDouble {
        // Calculate total size
        let totalCount = vectors.reduce(0) { $0 + $1.count }
        
        // Pre-allocate result with exact size
        let result = VectorDouble(count: totalCount)
        
        // Copy elements with direct indexing
        var currentIndex = 0
        for vector in vectors {
            for i in 0..<vector.count {
                result[currentIndex] = vector[i]
                currentIndex += 1
            }
        }
        
        return result
    }
    
    /// Creates a new VectorDouble by repeating the given vector a specified number of times.
    public static func repeating(_ vector: VectorDouble, count: Int) -> VectorDouble {
        precondition(count >= 0, "Count must be non-negative")
        if count == 0 || vector.count == 0 {
            return VectorDouble(count: 0)
        }
        
        let result = VectorDouble(count: vector.count * count)
        for i in 0..<count {
            let offset = i * vector.count
            vector.withUnsafeBufferPointer { buffer in
                for j in 0..<buffer.count {
                    result[offset + j] = buffer[j]
                }
            }
        }
        
        return result
    }
    
    /// Creates a VectorDouble with values from start to end with the given step.
    public static func range(from start: Double, to end: Double, step: Double = 1.0) -> VectorDouble {
        precondition(step != 0, "Step must be non-zero")
        
        let ascending = step > 0
        let count = Swift.max(0, Int((end - start) / step) + (ascending && end > start ? 1 : 0))
        
        let result = VectorDouble(count: count)
        for i in 0..<count {
            result[i] = start + Double(i) * step
        }
        
        return result
    }
}
