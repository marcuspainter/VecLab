//
//  ComplexDoubleArray.swift
//  VecLab
//
//  Created by Marcus Painter on 09/04/2025.
//

// https://itwenty.me/posts/04-swift-collections/

import Foundation
import Accelerate

/// Complex array implementation using split real/imaginary arrays
public struct ComplexDoubleArray:
    Collection,
    Sequence,
    BidirectionalCollection,
    RandomAccessCollection,
    MutableCollection,
    RangeReplaceableCollection,
    Equatable,
    Hashable,
    Codable,
    Sendable,
    CustomStringConvertible,
    ExpressibleByArrayLiteral {
    
    // MARK: - Storage

    /// Array of real values.
    public internal(set) var real: [Double]

    /// Array of imaginary values.
    public internal(set) var imag: [Double]
    
    /// Set internal real and imaginary arrays together.
    internal mutating func setValue(real: [Double], imag: [Double]) {
        precondition(real.count == imag.count, "Real and imaginary arrays must have the same size.")
        self.real = real
        self.imag = imag
    }
    
    /// Set internal real and imaginary arrays together.
    internal mutating func setValue(to newValue: ComplexDoubleArray) {
        precondition(newValue.real.count == newValue.imag.count, "Real and imaginary arrays must have the same size.")
        self.real = newValue.real
        self.imag = newValue.imag
    }

    // MARK: - Initializers

    /// Initialize an empty complex array.
    public init() {
        real = []
        imag = []
    }

    /// Initialize  a complex array from real and imaginary arrays.
    /// - Parameters:
    ///   - real: Real array.
    ///   - imag: Imaginary array.
    public init(_ real: [Double], _ imag: [Double]) {
        assertSameSize(real, imag)
        self.real = real
        self.imag = imag
    }

    /// Initialize from real array only (zeros for imaginary)
    public init(realOnly: [Double]) {
        real = realOnly
        imag = [Double](repeating: 0, count: realOnly.count)
    }

    /// Initialize with a single complex value repeated
    public init(repeating value: ComplexDouble, count: Int) {
        real = [Double](repeating: value.real, count: count)
        imag = [Double](repeating: value.imag, count: count)
    }

    /// Initialize a complex array of length count.
    /// - Parameter count: Number of elements.
    public init(count: Int) {
        real = [Double](repeating: 0, count: count)
        imag = [Double](repeating: 0, count: count)
    }

    /*
    public init<C: Collection>(_ elements: C) where C.Element == ComplexDouble {
    */

    /// Initialize a complex array from a collection.
    /// - Parameter elements: A complex array.
    public init(_ elements: ComplexDoubleArray) {
        real = elements.map { $0.real }
        imag = elements.map { $0.imag }
    }

    /// Initialize a complex array from complex numbers.
    /// - Parameter elements: Literal array of complex numbers.
    public init(arrayLiteral elements: ComplexDouble...) {
        self.init(elements)
    }

    /// Reserve stroage capacity of array.
    /// - Parameter minimumCapacity: The minimum capacity.
    public mutating func reserveCapacity(_ minimumCapacity: Int) {
        real.reserveCapacity(minimumCapacity)
        imag.reserveCapacity(minimumCapacity)
    }

    // MARK: - Collection Protocol Requirements

    public typealias Element = ComplexDouble
    public typealias Index = Int
    public typealias SubSequence = ComplexDoubleArray
    public typealias Indices = Range<Int>

    /// The position of the first element in a nonempty array.
    public var startIndex: Int { return 0 }

    /// An array's "past the end" position—that is, the position one greater than the last valid subscript argument.
    public var endIndex: Int { return real.count }

    // MARK: - RangeReplaceableCollection

    /// Replace a subrange of a complex array.
    /// - Parameters:
    ///   - subrange: Index subrange.
    ///   - newElements: Replacement complex numbers.
    public mutating func replaceSubrange<C: Collection>(_ subrange: Range<Int>, with newElements: C)
        where C.Element == ComplexDouble {

        precondition(subrange.lowerBound >= 0 && subrange.upperBound <= count, "Range out of bounds")
        precondition(subrange.count == newElements.count,
                                 "Replacement size must match range size: \(subrange.count) vs \(newElements.count)")

        let newReals = newElements.map { $0.real }
        let newImags = newElements.map { $0.imag }

        real.replaceSubrange(subrange, with: newReals)
        imag.replaceSubrange(subrange, with: newImags)
    }

    // MARK: - Subscripts

    public subscript(position: Int) -> ComplexDouble {
        get {
            precondition(position >= 0 && position < count, "Index out of range")
            return ComplexDouble(real[position], imag[position])
        }
        set {
            precondition(position >= 0 && position < count, "Index out of range")
            real[position] = newValue.real
            imag[position] = newValue.imag
        }
    }

    // MARK: - Additional Convenience Methods

    /// Append a complex number.
    /// - Parameter element: A complex number.
    public mutating func append(_ element: ComplexDouble) {
        real.append(element.real)
        imag.append(element.imag)
    }
/*
    public mutating func append<S: Sequence>(contentsOf newElements: S) where S.Element == ComplexDouble {
*/
    /// Append a complex array.
    /// - Parameter newElements: A complex array.
    public mutating func append(contentsOf newElements: ComplexDoubleArray) {
        real.append(contentsOf: newElements.real)
        imag.append(contentsOf: newElements.imag)
    }

    /// Insert a complex array.
    /// - Parameters:
    ///   - element: A complex number.
    ///   - index: Index insertion point.
    public mutating func insert(_ element: ComplexDouble, at index: Int) {
        precondition(index >= 0 && index <= count, "Index out of range for insertion")
        real.insert(element.real, at: index)
        imag.insert(element.imag, at: index)
    }

    /// Removes a complex number.
    /// - Parameter index: Index of item.
    /// - Returns: Removed item.
    public mutating func remove(at index: Int) -> ComplexDouble {
        precondition(index >= 0 && index < count, "Index out of range for removal")
        let complexValue = ComplexDouble(real[index], imag[index])
        real.remove(at: index)
        imag.remove(at: index)
        return complexValue
    }

    /// Remove a range of complex numbers
    /// - Parameter bounds: A range of indices.
    public mutating func removeSubrange(_ bounds: Range<Int>) {
        precondition(bounds.lowerBound >= 0 && bounds.upperBound <= count, "Range out of bounds for removal")
        real.removeSubrange(bounds)
        imag.removeSubrange(bounds)
    }

    // MARK: - CustomStringConvertible

    /// String of complex value
    public var description: String {
        var result = "["
        for i in 0 ..< count {
            if i > 0 { result += ", " }
            if imag[i] >= 0 {
                result += "\(real[i]) + \(imag[i])i"
            } else {
                result += "\(real[i]) - \(abs(imag[i]))i"
            }
        }
        result += "]"
        return result
    }

    // MARK: - Equatable

    /// Compares for equality.
    /// - Parameters:
    ///   - lhs: A complex array.
    ///   - rhs: Another complex array.
    /// - Returns: True or false.
    public static func == (lhs: ComplexDoubleArray, rhs: ComplexDoubleArray) -> Bool {
        return lhs.real == rhs.real && lhs.imag == rhs.imag
    }

    // MARK: - Hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(real)
        hasher.combine(imag)
    }
}

// Function to assert that two arrays have the same size
private func assertSameSize<T, U>(_ lhs: [T], _ rhs: [U]) {
    precondition(lhs.count == rhs.count, "Arrays must have the same size: \(lhs.count) vs \(rhs.count)")
}

//
// NOTE: This extension must be in this file for private write access to real and imag arrays.
//

// Extension for ComplexDoubleArray to update range subscripts for consistent validation pattern
extension ComplexDoubleArray {

    // This extension includes only the range subscripts that need to be modified
    // to ensure a consistent validation pattern across all array operations

    // Returns concrete type ComplexDoubleArray not SubSequence

    /// Access a range of complex elements
    public subscript(bounds: Range<Int>) -> ComplexDoubleArray {
        get {
            precondition(bounds.lowerBound >= 0 && bounds.upperBound <= count, "Range out of bounds")
            var slice = ComplexDoubleArray()
            slice.real = Array(real[bounds])
            slice.imag = Array(imag[bounds])
            return slice
        }
        set {
            precondition(bounds.lowerBound >= 0 && bounds.upperBound <= count, "Range out of bounds")

            // Validate replacement size matches range size
            if bounds.count != newValue.count {
                print("ERROR: Replacement size must match range size: \(bounds.count) vs \(newValue.count)")
                return // Exit without making changes
            }

            real.replaceSubrange(bounds, with: newValue.real)
            imag.replaceSubrange(bounds, with: newValue.imag)
        }
    }

    /// Access a closed range of complex elements
    public subscript(bounds: ClosedRange<Int>) -> ComplexDoubleArray {
        get {
            precondition(bounds.lowerBound >= 0 && bounds.upperBound < count, "Range out of bounds")
            return self[bounds.lowerBound..<(bounds.upperBound + 1)]
        }
        set {
            precondition(bounds.lowerBound >= 0 && bounds.upperBound < count, "Range out of bounds")

            let halfOpenRange = bounds.lowerBound..<(bounds.upperBound + 1)

            // Validate replacement size matches range size
            if halfOpenRange.count != newValue.count {
                print("ERROR: Replacement size must match range size: \(halfOpenRange.count) vs \(newValue.count)")
                return // Exit without making changes
            }

            self[halfOpenRange] = newValue
        }
    }

    /// Access a partial range from lower bound
    public subscript(bounds: PartialRangeFrom<Int>) -> ComplexDoubleArray {
        get {
            precondition(bounds.lowerBound >= 0, "Lower bound must be non-negative")
            precondition(bounds.lowerBound < count, "Lower bound out of range")
            return self[bounds.lowerBound..<endIndex]
        }
        set {
            precondition(bounds.lowerBound >= 0, "Lower bound must be non-negative")
            precondition(bounds.lowerBound < count, "Lower bound out of range")

            let fullRange = bounds.lowerBound..<endIndex

            // Validate replacement size matches range size
            if fullRange.count != newValue.count {
                print("ERROR: Replacement size must match range size: \(fullRange.count) vs \(newValue.count)")
                return // Exit without making changes
            }

            self[fullRange] = newValue
        }
    }

    /// Access a partial range up to upper bound
    public subscript(bounds: PartialRangeUpTo<Int>) -> ComplexDoubleArray {
        get {
            precondition(bounds.upperBound >= 0, "Upper bound must be non-negative")
            precondition(bounds.upperBound <= count, "Upper bound out of range")
            return self[0..<bounds.upperBound]
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

            self[fullRange] = newValue
        }
    }

    /// Access a partial range through upper bound
    public subscript(bounds: PartialRangeThrough<Int>) -> ComplexDoubleArray {
        get {
            precondition(bounds.upperBound >= 0, "Upper bound must be non-negative")
            precondition(bounds.upperBound < count, "Upper bound out of range")
            return self[0...bounds.upperBound]
        }
        set {
            precondition(bounds.upperBound >= 0, "Upper bound must be non-negative")
            precondition(bounds.upperBound < count, "Upper bound out of range")

            let fullRange = 0...bounds.upperBound

            // Validate replacement size matches range size
            if (fullRange.upperBound - fullRange.lowerBound + 1) != newValue.count {
                print("ERROR: Replacement size must match range size: \((fullRange.upperBound - fullRange.lowerBound + 1)) vs \(newValue.count)")
                return // Exit without making changes
            }

            self[fullRange] = newValue
        }
    }
}

