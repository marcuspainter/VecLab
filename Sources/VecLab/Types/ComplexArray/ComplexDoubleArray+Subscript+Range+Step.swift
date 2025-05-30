//
//  ComplexDoubleArray+Subscript+Range+Step.swift
//  VecLab
//
//  Created by Marcus Painter on 18/04/2025.
//

import Foundation

// Extension to provide stepping functionality for ComplexDoubleArray
extension ComplexDoubleArray {

    // Helper method to verify that real and imag arrays have the same size
    private func verifySizes() {
        precondition(real.count == imag.count, "Internal error: real and imaginary arrays must have the same size")
    }

    /// Access elements from a closed range with a step value
    /// - Parameters:
    ///   - range: The range of indices to access
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    /// - Returns: A new complex array with the stepped values
    public subscript(range: ClosedRange<Int>, step: Int) -> ComplexDoubleArray {
        get {
            precondition(step != 0, "Step cannot be zero")
            precondition(range.lowerBound >= 0 && range.upperBound < count, "Range out of bounds")
            verifySizes()

            var result = ComplexDoubleArray()

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

            result.verifySizes()
            return result
        }
        set {
            setValues(in: range, step: step, to: newValue)
        }
    }

    /// Access elements from a half-open range with a step value
    /// - Parameters:
    ///   - range: The range of indices to access
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    /// - Returns: A new complex array with the stepped values
    public subscript(range: Range<Int>, step: Int) -> ComplexDoubleArray {
        get {
            precondition(step != 0, "Step cannot be zero")
            precondition(range.lowerBound >= 0 && range.upperBound <= count, "Range out of bounds")
            verifySizes()

            var result = ComplexDoubleArray()

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

            result.verifySizes()
            return result
        }
        set {
            setValues(in: range, step: step, to: newValue)
        }
    }

    /// Access elements from a partial range (from) with a step value
    /// - Parameters:
    ///   - range: The range of indices to access (from lowerBound to the end)
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    /// - Returns: A new complex array with the stepped values
    subscript(range: PartialRangeFrom<Int>, step: Int) -> ComplexDoubleArray {
        get {
            precondition(step != 0, "Step cannot be zero")
            precondition(range.lowerBound >= 0, "Lower bound must be non-negative")
            precondition(range.lowerBound < count, "Lower bound out of range")
            verifySizes()

            if step > 0 {
                return self[range.lowerBound..<count, step]
            } else {
                // For negative step, we want to go from the end towards the lowerBound
                return self[range.lowerBound...count-1, step]
            }
        }
        set {
            setValues(in: range, step: step, to: newValue)
        }
    }

    /// Access elements from a partial range (through) with a step value
    /// - Parameters:
    ///   - range: The range of indices to access (from start through upperBound)
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    /// - Returns: A new complex array with the stepped values
    subscript(range: PartialRangeThrough<Int>, step: Int) -> ComplexDoubleArray {
        get {
            precondition(step != 0, "Step cannot be zero")
            precondition(range.upperBound >= 0, "Upper bound must be non-negative")
            precondition(range.upperBound < count, "Upper bound out of range")
            verifySizes()

            return self[0...range.upperBound, step]
        }
        set {
            setValues(in: range, step: step, to: newValue)
        }
    }

    /// Access elements from a partial range (up to) with a step value
    /// - Parameters:
    ///   - range: The range of indices to access (from start up to upperBound)
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    /// - Returns: A new complex array with the stepped values
    subscript(range: PartialRangeUpTo<Int>, step: Int) -> ComplexDoubleArray {
        get {
            precondition(step != 0, "Step cannot be zero")
            precondition(range.upperBound >= 0, "Upper bound must be non-negative")
            precondition(range.upperBound <= count, "Upper bound out of range")
            verifySizes()

            if step > 0 {
                return self[0..<range.upperBound, step]
            } else {
                // For negative step, we want to go from (upperBound-1) towards 0
                // Make sure we handle the case where upperBound is 0
                if range.upperBound > 0 {
                    return self[0...range.upperBound-1, step]
                } else {
                    return ComplexDoubleArray()
                }
            }
        }
        set {
            setValues(in: range, step: step, to: newValue)
        }
    }

    /// Set elements in a closed range with a step value
    /// - Parameters:
    ///   - range: The range of indices to set
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    ///   - newValues: The new values to set
     mutating func setValues(in range: ClosedRange<Int>, step: Int, to newValues: ComplexDoubleArray) {
        precondition(step != 0, "Step cannot be zero")
        precondition(range.lowerBound >= 0 && range.upperBound < count, "Range out of bounds")
        verifySizes()
        newValues.verifySizes()

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

        verifySizes()
    }

    /// Set elements in a half-open range with a step value
    /// - Parameters:
    ///   - range: The range of indices to set
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    ///   - newValues: The new values to set
     mutating func setValues(in range: Range<Int>, step: Int, to newValues: ComplexDoubleArray) {
        precondition(step != 0, "Step cannot be zero")
        precondition(range.lowerBound >= 0 && range.upperBound <= count, "Range out of bounds")
        verifySizes()
        newValues.verifySizes()

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

        verifySizes()
    }

    /// Set elements in a partial range (from) with a step value
    /// - Parameters:
    ///   - range: The range of indices to set (from lowerBound to the end)
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    ///   - newValues: The new values to set
     mutating func setValues(in range: PartialRangeFrom<Int>, step: Int, to newValues: ComplexDoubleArray) {
        precondition(range.lowerBound >= 0, "Lower bound must be non-negative")
        precondition(range.lowerBound < count, "Lower bound out of range")
        verifySizes()
        newValues.verifySizes()

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
     mutating func setValues(in range: PartialRangeThrough<Int>, step: Int, to newValues: ComplexDoubleArray) {
        precondition(range.upperBound >= 0, "Upper bound must be non-negative")
        precondition(range.upperBound < count, "Upper bound out of range")
        verifySizes()
        newValues.verifySizes()

        setValues(in: 0...range.upperBound, step: step, to: newValues)
    }

    /// Set elements in a partial range (up to) with a step value
    /// - Parameters:
    ///   - range: The range of indices to set (from start up to upperBound)
    ///   - step: The step value (how many indices to skip). Can be positive or negative.
    ///   - newValues: The new values to set
     mutating func setValues(in range: PartialRangeUpTo<Int>, step: Int, to newValues: ComplexDoubleArray) {
        precondition(range.upperBound >= 0, "Upper bound must be non-negative")
        precondition(range.upperBound <= count, "Upper bound out of range")
        verifySizes()
        newValues.verifySizes()

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
var array = ComplexDoubleArray([
    ComplexDouble(0, 0),
    ComplexDouble(1, 1),
    ComplexDouble(2, 2),
    ComplexDouble(3, 3),
    ComplexDouble(4, 4),
    ComplexDouble(5, 5),
    ComplexDouble(6, 6),
    ComplexDouble(7, 7),
    ComplexDouble(8, 8),
    ComplexDouble(9, 9)
])

// Get every second element in the range
let everySecond = array[0...8, 2]  // [0+0i, 2+2i, 4+4i, 6+6i, 8+8i]

// Get elements in reverse order with step -1
let reversed = array[9...0, -1]  // [9+9i, 8+8i, 7+7i, 6+6i, 5+5i, 4+4i, 3+3i, 2+2i, 1+1i, 0+0i]

// Set every third element
array.setValues(in: 0...9, step: 3, to: ComplexDoubleArray([
    ComplexDouble(10, 10),
    ComplexDouble(20, 20),
    ComplexDouble(30, 30),
    ComplexDouble(40, 40)
]))
// array becomes [10+10i, 1+1i, 2+2i, 20+20i, 4+4i, 5+5i, 30+30i, 7+7i, 8+8i, 40+40i]

// This will print an error and not modify the array
array.setValues(in: 0...9, step: 2, to: ComplexDoubleArray([
    ComplexDouble(1, 1),
    ComplexDouble(2, 2),
    ComplexDouble(3, 3)
]))
// ERROR: New values count (3) must match the number of stepped indices (5)
*/
