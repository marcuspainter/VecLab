//
//  VectorDouble+Protocols.swift
//  VecLab
//
//  Created by Marcus Painter on 23/04/2025.
//

import Foundation

// MARK: - Core Collection Protocol Conformances

extension VectorDouble: Sequence {
    public typealias Element = Double
    
    public func makeIterator() -> UnsafeBufferPointer<Double>.Iterator {
        return withUnsafeBufferPointer { $0.makeIterator() }
    }
}

extension VectorDouble: Collection {
    public typealias Index = Int
    public typealias SubSequence = VectorDouble
    public typealias Indices = Range<Int>
    
    public var startIndex: Int { return 0 }
    public var endIndex: Int { return count }
    
    public func index(after i: Int) -> Int { return i + 1 }
    
    // Range subscript for slicing
    public subscript(bounds: Range<Int>) -> VectorDouble {
        let newCount = bounds.upperBound - bounds.lowerBound
        precondition(newCount >= 0, "Invalid range bounds")
        precondition(bounds.lowerBound >= 0 && bounds.upperBound <= count, "Range out of bounds")
        
        let result = VectorDouble(count: newCount)
        for i in 0..<newCount {
            result[i] = self[bounds.lowerBound + i]
        }
        return result
    }
}

extension VectorDouble: BidirectionalCollection {
    public func index(before i: Int) -> Int { return i - 1 }
}

extension VectorDouble: RandomAccessCollection {
    // No additional implementation needed
}

// MARK: - RangeReplaceableCollection Conformance

extension VectorDouble: RangeReplaceableCollection {
    public convenience init() {
        self.init(count: 0)
    }
    
    public convenience init<S>(_ elements: S) where S: Sequence, S.Element == Double {
        self.init(values: Array(elements))
    }
    
    public func replaceSubrange<C>(_ subrange: Range<Int>, with newElements: C) where C: Collection, C.Element == Double {
        precondition(subrange.lowerBound >= 0 && subrange.upperBound <= count, "Subrange out of bounds")
        
        let newCount = count + newElements.count - subrange.count
        let newBuffer = UnsafeMutableBufferPointer<Double>.allocate(capacity: newCount)
        
        // Copy elements before the subrange
        _ = newBuffer.initialize(from: self.withUnsafeBufferPointer { $0.prefix(subrange.lowerBound) })
        
        // Copy new elements
        var index = subrange.lowerBound
        for element in newElements {
            newBuffer[index] = element
            index += 1
        }
        
        // Copy elements after the subrange
        if subrange.upperBound < count {
            _ = newBuffer[index...].initialize(from: self.withUnsafeBufferPointer {
                $0.suffix(from: subrange.upperBound)
            })
        }
        
        // Replace the old buffer
        buffer.deallocate()
        buffer = newBuffer
        count = newCount
    }
}
