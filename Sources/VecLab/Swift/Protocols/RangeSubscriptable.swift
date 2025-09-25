//
//  RangeSubscriptable.swift
//  VecLab
//
//  Created by Marcus Painter on 24/09/2025.
//

import Foundation
import Accelerate

// Extension to make Array<Double> return arrays instead of slices when using range subscripts
// with size validation matching the pattern from step extensions.

/*
public protocol RangeSubscriptable: MutableCollection & RangeReplaceableCollection
where Index == Int {
    subscript(range: ClosedRange<Int>) -> [Element] { get set }
    subscript(range: Range<Int>) -> [Element] { get set }
    subscript(range: PartialRangeFrom<Int>) -> [Element] { get set }
    subscript(range: PartialRangeThrough<Int>) -> [Element] { get set }
    subscript(range: PartialRangeUpTo<Int>) -> [Element] { get set }
    func helloRangeSubscriptable()
    subscript(bounds: Range<Int>) -> ArraySlice<Element> { get set }
}
public protocol RangeSubscriptableElement { }
// Notes:
// where Element == SomeProtocol → Element must be the protocol type itself
// where Element: SomeProtocol → Element must conform to the protocol
extension Array: RangeSubscriptable where Element: RangeSubscriptableElement { }

fileprivate func test() {
    
    let a = [Double](repeating: 0.0, count: 10)
    
    let c = a[1..<3]
    c.helloRangeSubscriptable()
    print(c)
}

extension RangeSubscriptable {
    
    public func helloRangeSubscriptable() {
        print("Hello, World!")
    }
    
    public subscript(bounds: Range<Int>) -> Array<Element> {
        return Array(self)
    }
    
    /// Range subscript that returns `[Element]` instead of `ArraySlice<Element>`
    public subscript(bounds: Range<Int>) -> [Element] {
        get {
            precondition(bounds.lowerBound >= 0 && bounds.upperBound <= count, "Range out of bounds")
            let slice: [Element] = self[bounds]
            return (slice)
        }
        set {
            precondition(bounds.lowerBound >= 0 && bounds.upperBound <= count, "Range out of bounds")
            precondition(bounds.count == newValue.count,
                         "Replacement size must match range size: \(bounds.count) vs \(newValue.count)")

            self.replaceSubrange(bounds, with: newValue) // now valid
        }
    }

    /// Closed range subscript that returns Array<Double> instead of ArraySlice<Double>
    public subscript(bounds: ClosedRange<Int>) -> [Element] {
        get {
            precondition(bounds.lowerBound >= 0 && bounds.upperBound < count, "Range out of bounds")
            // Use type annotation to avoid recursion
            let slice = ArraySlice<Element>(self[bounds])
            return Array(slice)
        }
        set {
            precondition(bounds.lowerBound >= 0 && bounds.upperBound < count, "Range out of bounds")

            let halfOpenRange = bounds.lowerBound..<(bounds.upperBound + 1)

            // Validate replacement size matches range size
            if halfOpenRange.count != newValue.count {
                print("ERROR: Replacement size must match range size: \(halfOpenRange.count) vs \(newValue.count)")
                return  // Exit without making changes
            }

            replaceSubrange(halfOpenRange, with: newValue)
        }
    }

    /// Partial range from subscript that returns Array<Double> instead of ArraySlice<Double>
    public subscript(bounds: PartialRangeFrom<Int>) -> [Element] {
        get {
            precondition(bounds.lowerBound >= 0, "Lower bound must be non-negative")
            precondition(bounds.lowerBound < count, "Lower bound out of range")

            // Use type annotation to avoid recursion
            let slice = self[bounds]
            return Array(slice)
        }
        set {
            precondition(bounds.lowerBound >= 0, "Lower bound must be non-negative")
            precondition(bounds.lowerBound < count, "Lower bound out of range")

            let fullRange = bounds.lowerBound..<count

            // Validate replacement size matches range size
            if fullRange.count != newValue.count {
                print("ERROR: Replacement size must match range size: \(fullRange.count) vs \(newValue.count)")
                return  // Exit without making changes
            }

            replaceSubrange(fullRange, with: newValue)
        }
    }

    /// Partial range up to subscript that returns Array<Double> instead of ArraySlice<Double>
    public subscript(bounds: PartialRangeUpTo<Int>) -> [Element] {
        get {
            precondition(bounds.upperBound >= 0, "Upper bound must be non-negative")
            precondition(bounds.upperBound <= count, "Upper bound out of range")

            // Use type annotation to avoid recursion
            let slice = self[bounds]
            return Array(slice)
        }
        set {
            precondition(bounds.upperBound >= 0, "Upper bound must be non-negative")
            precondition(bounds.upperBound <= count, "Upper bound out of range")

            let fullRange = 0..<bounds.upperBound

            // Validate replacement size matches range size
            if fullRange.count != newValue.count {
                print("ERROR: Replacement size must match range size: \(fullRange.count) vs \(newValue.count)")
                return  // Exit without making changes
            }

            replaceSubrange(fullRange, with: newValue)
        }
    }

    /// Partial range through subscript that returns Array<Double> instead of ArraySlice<Double>
    public subscript(bounds: PartialRangeThrough<Int>) -> [Element] {
        get {
            precondition(bounds.upperBound >= 0, "Upper bound must be non-negative")
            precondition(bounds.upperBound < count, "Upper bound out of range")

            // Use type annotation to avoid recursion
            let slice = self[bounds]
            return Array(slice)
        }
        set {
            precondition(bounds.upperBound >= 0, "Upper bound must be non-negative")
            precondition(bounds.upperBound < count, "Upper bound out of range")

            let fullRange = 0...(bounds.upperBound)

            // Validate replacement size matches range size
            if fullRange.count != newValue.count {
                print("ERROR: Replacement size must match range size: \(fullRange.count) vs \(newValue.count)")
                return  // Exit without making changes
            }

            replaceSubrange(0...bounds.upperBound, with: newValue)
        }
    }
}

*/
