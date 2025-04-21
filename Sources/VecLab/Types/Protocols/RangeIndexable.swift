//
//  RangeIndexable.swift
//  VecLab
//
//  Created by Marcus Painter on 20/04/2025.
//

// Generic extension for all types that conform to RangeIndexable
public extension Array where Element: BasicMath {
    
    // Range<Int> (a..<b)
    subscript(bounds: Range<Int>) -> [Element] {
        get {
            var result = [Element]()
            result.reserveCapacity(bounds.count)
            for i in bounds {
                result.append(self[i])
            }
            return result
        }
        set {
            precondition(newValue.count == bounds.count,
                "Size mismatch. Range size: \(bounds.count), new value size: \(newValue.count)")
            self.replaceSubrange(bounds, with: newValue)
        }
    }
    
    // ClosedRange<Int> (a...b)
    subscript(bounds: ClosedRange<Int>) -> [Element] {
        get {
            var result = [Element]()
            result.reserveCapacity(bounds.count)
            for i in bounds {
                result.append(self[i])
            }
            return result
        }
        set {
            precondition(newValue.count == bounds.count,
                "Size mismatch. Range size: \(bounds.count), new value size: \(newValue.count)")
            self.replaceSubrange(bounds.lowerBound..<(bounds.upperBound+1), with: newValue)
        }
    }
    
    // PartialRangeFrom<Int> (a...)
    subscript(bounds: PartialRangeFrom<Int>) -> [Element] {
        get {
            var result = [Element]()
            let rangeCount = self.count - bounds.lowerBound
            result.reserveCapacity(rangeCount)
            for i in bounds.lowerBound..<self.count {
                result.append(self[i])
            }
            return result
        }
        set {
            let rangeCount = self.count - bounds.lowerBound
            precondition(newValue.count == rangeCount,
                "Size mismatch. Range size: \(rangeCount), new value size: \(newValue.count)")
            self.replaceSubrange(bounds.lowerBound..<self.count, with: newValue)
        }
    }
    
    // PartialRangeUpTo<Int> (...<b)
    subscript(bounds: PartialRangeUpTo<Int>) -> [Element] {
        get {
            var result = [Element]()
            result.reserveCapacity(bounds.upperBound)
            for i in 0..<bounds.upperBound {
                result.append(self[i])
            }
            return result
        }
        set {
            precondition(newValue.count == bounds.upperBound,
                "Size mismatch. Range size: \(bounds.upperBound), new value size: \(newValue.count)")
            self.replaceSubrange(0..<bounds.upperBound, with: newValue)
        }
    }
    
    // PartialRangeThrough<Int> (...b)
    subscript(bounds: PartialRangeThrough<Int>) -> [Element] {
        get {
            var result = [Element]()
            let rangeCount = bounds.upperBound + 1
            result.reserveCapacity(rangeCount)
            for i in 0...bounds.upperBound {
                result.append(self[i])
            }
            return result
        }
        set {
            let rangeCount = bounds.upperBound + 1
            precondition(newValue.count == rangeCount,
                "Size mismatch. Range size: \(rangeCount), new value size: \(newValue.count)")
            // Convert closed range to half-open range
            self.replaceSubrange(0..<(bounds.upperBound + 1), with: newValue)
        }
    }
}

