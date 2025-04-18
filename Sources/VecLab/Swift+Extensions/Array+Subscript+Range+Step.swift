//
//  Array+Subscript+Range+Step.swift
//  VecLab
//
//  Created by Marcus Painter on 18/04/2025.
//

import Foundation

import Foundation

// Extension to provide stepping functionality for Double arrays
extension Array where Element == Double {
    
    /// Access elements from a closed range with a step value
    /// - Parameters:
    ///   - range: The range of indices to access
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    /// - Returns: A new array with the stepped values
    public subscript(range: ClosedRange<Int>, step: Int) -> [Double] {
        precondition(step != 0, "Step cannot be zero")
        precondition(range.lowerBound >= 0 && range.upperBound < count, "Range out of bounds")
        
        var result = [Double]()
        
        if step > 0 {
            let indices = [Int](stride(from: range.lowerBound, through: range.upperBound, by: step))
            for index in indices {
                result.append(self[index])
            }
        } else {
            let indices = [Int](stride(from: range.upperBound, through: range.lowerBound, by: step))
            for index in indices {
                result.append(self[index])
            }
        }
        
        return result
    }
    
    /// Access elements from a half-open range with a step value
    /// - Parameters:
    ///   - range: The range of indices to access
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    /// - Returns: A new array with the stepped values
    public subscript(range: Range<Int>, step: Int) -> [Double] {
        precondition(step != 0, "Step cannot be zero")
        precondition(range.lowerBound >= 0 && range.upperBound <= count, "Range out of bounds")
        
        var result = [Double]()
        
        if step > 0 {
            let indices = [Int](stride(from: range.lowerBound, to: range.upperBound, by: step))
            for index in indices {
                result.append(self[index])
            }
        } else if range.upperBound > range.lowerBound {
            // For negative step, start from (upperBound-1) and go to the lowerBound
            let indices = [Int](stride(from: range.upperBound - 1, through: range.lowerBound, by: step))
            for index in indices {
                result.append(self[index])
            }
        }
        
        return result
    }
    
    /// Access elements from a partial range (from) with a step value
    /// - Parameters:
    ///   - range: The range of indices to access (from lowerBound to the end)
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    /// - Returns: A new array with the stepped values
    public subscript(range: PartialRangeFrom<Int>, step: Int) -> [Double] {
        precondition(step != 0, "Step cannot be zero")
        precondition(range.lowerBound >= 0, "Lower bound must be non-negative")
        precondition(range.lowerBound < count, "Lower bound out of range")
        
        if step > 0 {
            return self[range.lowerBound..<count, step]
        } else {
            // For negative step, we want to go from the end towards the lowerBound
            return self[range.lowerBound...count-1, step]
        }
    }
    
    /// Access elements from a partial range (through) with a step value
    /// - Parameters:
    ///   - range: The range of indices to access (from start through upperBound)
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    /// - Returns: A new array with the stepped values
    public subscript(range: PartialRangeThrough<Int>, step: Int) -> [Double] {
        precondition(step != 0, "Step cannot be zero")
        precondition(range.upperBound >= 0, "Upper bound must be non-negative")
        precondition(range.upperBound < count, "Upper bound out of range")
        
        return self[0...range.upperBound, step]
    }
    
    /// Access elements from a partial range (up to) with a step value
    /// - Parameters:
    ///   - range: The range of indices to access (from start up to upperBound)
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    /// - Returns: A new array with the stepped values
    public subscript(range: PartialRangeUpTo<Int>, step: Int) -> [Double] {
        precondition(step != 0, "Step cannot be zero")
        precondition(range.upperBound >= 0, "Upper bound must be non-negative")
        precondition(range.upperBound <= count, "Upper bound out of range")
        
        if step > 0 {
            return self[0..<range.upperBound, step]
        } else {
            // For negative step, we want to go from (upperBound-1) towards 0
            // Make sure we handle the case where upperBound is 0
            if range.upperBound > 0 {
                return self[0...range.upperBound-1, step]
            } else {
                return []
            }
        }
    }
    
    /// Set elements in a closed range with a step value
    /// - Parameters:
    ///   - range: The range of indices to set
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    ///   - newValues: The new values to set
    public mutating func setValues(in range: ClosedRange<Int>, step: Int, to newValues: [Double]) {
        precondition(step != 0, "Step cannot be zero")
        precondition(range.lowerBound >= 0 && range.upperBound < count, "Range out of bounds")
        
        let indices: [Int]
        if step > 0 {
            indices = [Int](stride(from: range.lowerBound, through: range.upperBound, by: step))
        } else {
            indices = [Int](stride(from: range.upperBound, through: range.lowerBound, by: step))
        }
        
        if indices.count != newValues.count {
            print("ERROR: New values count (\(newValues.count)) must match the number of stepped indices (\(indices.count))")
            return
        }
        
        for (i, index) in indices.enumerated() {
            self[index] = newValues[i]
        }
    }
    
    /// Set elements in a half-open range with a step value
    /// - Parameters:
    ///   - range: The range of indices to set
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    ///   - newValues: The new values to set
    public mutating func setValues(in range: Range<Int>, step: Int, to newValues: [Double]) {
        precondition(step != 0, "Step cannot be zero")
        precondition(range.lowerBound >= 0 && range.upperBound <= count, "Range out of bounds")
        
        let indices: [Int]
        if step > 0 {
            indices = [Int](stride(from: range.lowerBound, to: range.upperBound, by: step))
        } else if range.upperBound > range.lowerBound {
            // For negative step, start from (upperBound-1) and go to the lowerBound
            indices = [Int](stride(from: range.upperBound - 1, through: range.lowerBound, by: step))
        } else {
            indices = []
        }
        
        if indices.count != newValues.count {
            print("ERROR: New values count (\(newValues.count)) must match the number of stepped indices (\(indices.count))")
            return
        }
        
        for (i, index) in indices.enumerated() {
            self[index] = newValues[i]
        }
    }
    
    /// Set elements in a partial range (from) with a step value
    /// - Parameters:
    ///   - range: The range of indices to set (from lowerBound to the end)
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    ///   - newValues: The new values to set
    public mutating func setValues(in range: PartialRangeFrom<Int>, step: Int, to newValues: [Double]) {
        precondition(range.lowerBound >= 0, "Lower bound must be non-negative")
        precondition(range.lowerBound < count, "Lower bound out of range")
        
        if step > 0 {
            setValues(in: range.lowerBound..<count, step: step, to: newValues)
        } else {
            setValues(in: range.lowerBound...count-1, step: step, to: newValues)
        }
    }
    
    /// Set elements in a partial range (through) with a step value
    /// - Parameters:
    ///   - range: The range of indices to set (from start through upperBound)
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    ///   - newValues: The new values to set
    public mutating func setValues(in range: PartialRangeThrough<Int>, step: Int, to newValues: [Double]) {
        precondition(range.upperBound >= 0, "Upper bound must be non-negative")
        precondition(range.upperBound < count, "Upper bound out of range")
        
        setValues(in: 0...range.upperBound, step: step, to: newValues)
    }
    
    /// Set elements in a partial range (up to) with a step value
    /// - Parameters:
    ///   - range: The range of indices to set (from start up to upperBound)
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    ///   - newValues: The new values to set
    public mutating func setValues(in range: PartialRangeUpTo<Int>, step: Int, to newValues: [Double]) {
        precondition(range.upperBound >= 0, "Upper bound must be non-negative")
        precondition(range.upperBound <= count, "Upper bound out of range")
        
        if step > 0 {
            setValues(in: 0..<range.upperBound, step: step, to: newValues)
        } else if range.upperBound > 0 {
            setValues(in: 0...range.upperBound-1, step: step, to: newValues)
        } else {
            // If upperBound is 0 and step is negative, there are no values to set
            if !newValues.isEmpty {
                print("ERROR: New values count (\(newValues.count)) must match the number of stepped indices (0)")
            }
        }
    }
}

// Example usage:
/*
var array = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0]

// Get every second element in the range
let everySecond = array[0...8, 2]  // [0.0, 2.0, 4.0, 6.0, 8.0]

// Get elements in reverse order with step -1
let reversed = array[9...0, -1]  // [9.0, 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0, 0.0]

// Get every second element in reverse
let reverseEverySecond = array[8...0, -2]  // [8.0, 6.0, 4.0, 2.0, 0.0]

// Set every third element
array.setValues(in: 0...9, step: 3, to: [10.0, 20.0, 30.0, 40.0])
// array becomes [10.0, 1.0, 2.0, 20.0, 4.0, 5.0, 30.0, 7.0, 8.0, 40.0]

// Set every second element in reverse
array.setValues(in: 9...1, step: -2, to: [90.0, 70.0, 50.0, 30.0, 10.0])
// array becomes [10.0, 10.0, 2.0, 30.0, 4.0, 50.0, 30.0, 70.0, 8.0, 90.0]

// This will print an error and not modify the array
array.setValues(in: 0...9, step: 2, to: [1.0, 2.0, 3.0])
// ERROR: New values count (3) must match the number of stepped indices (5)
*/
