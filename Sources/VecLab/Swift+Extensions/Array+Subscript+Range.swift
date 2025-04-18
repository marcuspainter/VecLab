//
//  Array+Subscript+Range.swift
//  VecLab
//
//  Created by Marcus Painter on 17/04/2025.
//

import Foundation
import Foundation

// Extension to make Array<Double> return arrays instead of slices when using range subscripts
// with size validation matching the pattern from step extensions
extension Array where Element == Double {
    
    /// Range subscript that returns Array<Double> instead of ArraySlice<Double>
    public subscript(bounds: Range<Int>) -> [Double] {
        get {
            precondition(bounds.lowerBound >= 0 && bounds.upperBound <= count, "Range out of bounds")
            // Use type annotation to avoid recursion
            let slice: ArraySlice<Double> = self[bounds]
            return Array(slice)
        }
        set {
            precondition(bounds.lowerBound >= 0 && bounds.upperBound <= count, "Range out of bounds")
            
            // Validate replacement size matches range size
            if bounds.count != newValue.count {
                print("ERROR: Replacement size must match range size: \(bounds.count) vs \(newValue.count)")
                return // Exit without making changes
            }
            
            replaceSubrange(bounds, with: newValue)
        }
    }
    
    /// Closed range subscript that returns Array<Double> instead of ArraySlice<Double>
    public subscript(bounds: ClosedRange<Int>) -> [Double] {
        get {
            precondition(bounds.lowerBound >= 0 && bounds.upperBound < count, "Range out of bounds")
            // Use type annotation to avoid recursion
            let slice: ArraySlice<Double> = self[bounds]
            return Array(slice)
        }
        set {
            precondition(bounds.lowerBound >= 0 && bounds.upperBound < count, "Range out of bounds")
            
            let halfOpenRange = bounds.lowerBound..<(bounds.upperBound + 1)
            
            // Validate replacement size matches range size
            if halfOpenRange.count != newValue.count {
                print("ERROR: Replacement size must match range size: \(halfOpenRange.count) vs \(newValue.count)")
                return // Exit without making changes
            }
            
            replaceSubrange(halfOpenRange, with: newValue)
        }
    }
    
    /// Partial range from subscript that returns Array<Double> instead of ArraySlice<Double>
    public subscript(bounds: PartialRangeFrom<Int>) -> [Double] {
        get {
            precondition(bounds.lowerBound >= 0, "Lower bound must be non-negative")
            precondition(bounds.lowerBound < count, "Lower bound out of range")
            
            // Use type annotation to avoid recursion
            let slice: ArraySlice<Double> = self[bounds]
            return Array(slice)
        }
        set {
            precondition(bounds.lowerBound >= 0, "Lower bound must be non-negative")
            precondition(bounds.lowerBound < count, "Lower bound out of range")
            
            let fullRange = bounds.lowerBound..<count
            
            // Validate replacement size matches range size
            if fullRange.count != newValue.count {
                print("ERROR: Replacement size must match range size: \(fullRange.count) vs \(newValue.count)")
                return // Exit without making changes
            }
            
            replaceSubrange(fullRange, with: newValue)
        }
    }
    
    /// Partial range up to subscript that returns Array<Double> instead of ArraySlice<Double>
    public subscript(bounds: PartialRangeUpTo<Int>) -> [Double] {
        get {
            precondition(bounds.upperBound >= 0, "Upper bound must be non-negative")
            precondition(bounds.upperBound <= count, "Upper bound out of range")
            
            // Use type annotation to avoid recursion
            let slice: ArraySlice<Double> = self[bounds]
            return Array(slice)
        }
        set {
            precondition(bounds.upperBound >= 0, "Upper bound must be non-negative")
            precondition(bounds.upperBound <= count, "Upper bound out of range")
            
            let fullRange = 0..<bounds.upperBound
            
            // Validate replacement size matches range size
            if fullRange.count != newValue.count {
                print("ERROR: Replacement size must match range size: \(fullRange.count) vs \(newValue.count)")
                return // Exit without making changes
            }
            
            replaceSubrange(fullRange, with: newValue)
        }
    }
    
    /// Partial range through subscript that returns Array<Double> instead of ArraySlice<Double>
    public subscript(bounds: PartialRangeThrough<Int>) -> [Double] {
        get {
            precondition(bounds.upperBound >= 0, "Upper bound must be non-negative")
            precondition(bounds.upperBound < count, "Upper bound out of range")
            
            // Use type annotation to avoid recursion
            let slice: ArraySlice<Double> = self[bounds]
            return Array(slice)
        }
        set {
            precondition(bounds.upperBound >= 0, "Upper bound must be non-negative")
            precondition(bounds.upperBound < count, "Upper bound out of range")
            
            let fullRange = 0...(bounds.upperBound)
            
            // Validate replacement size matches range size
            if fullRange.count != newValue.count {
                print("ERROR: Replacement size must match range size: \(fullRange.count) vs \(newValue.count)")
                return // Exit without making changes
            }
            
            replaceSubrange(0...bounds.upperBound, with: newValue)
        }
    }
}
