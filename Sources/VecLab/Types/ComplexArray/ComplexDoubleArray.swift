//
//  ComplexDoubleArray.swift
//  VecLab
//
//  Created by Marcus Painter on 09/04/2025.
//

// https://itwenty.me/posts/04-swift-collections/

import Accelerate
import Foundation

/// Complex array implementation using split real/imaginary arrays
public struct ComplexDoubleArray:
    // Collection,
    // Sequence,
    // BidirectionalCollection,
    // RandomAccessCollection,
    // MutableCollection,
    // RangeReplaceableCollection,
    // Equatable,
    // Hashable,
    // CustomStringConvertible,
    // CustomDebugStringConvertible,
    // ExpressibleByArrayLiteral
    Codable,
    Sendable {

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
        validateSize(real, imag)
        self.real = real
        self.imag = imag
    }

    /// Initialize from real array only (zeros for imaginary).
    /// - Parameter realOnly: Real array.
    public init(realOnly: [Double]) {
        self.real = realOnly
        self.imag = [Double](repeating: 0, count: realOnly.count)
    }

    /// Initialize with a single complex value repeated.
    /// - Parameters:
    ///   - value: Real value.
    ///   - count: Number of elements.
    public init(repeating value: ComplexDouble, count: Int) {
        self.real = [Double](repeating: value.real, count: count)
        self.imag = [Double](repeating: value.imag, count: count)
    }

    /// Initialize a complex array of length count.
    /// - Parameter count: Number of elements.
    public init(count: Int) {
        self.real = [Double](repeating: 0, count: count)
        self.imag = [Double](repeating: 0, count: count)
    }

    /// Initialize a complex array from a collection.
    /// - Parameter elements: A complex array.
    public init(_ elements: ComplexDoubleArray) {
        self.real = elements.map { $0.real }
        self.imag = elements.map { $0.imag }
    }

    /// Provide convenience initializers for standard library sequence types.
    /// - Parameter array: An array of complex numbers.
    public init(array: [ComplexDouble]) {
        // Convert any sequence back to your collection type
        self.real = array.map { $0.real }
        self.imag = array.map { $0.imag }
    }

    /// Initialize a complex array as the same size as a complex array.
    /// - Parameter sized: A complex array.
    public init(sized: ComplexDoubleArray) {
        self = ComplexDoubleArray(count: sized.count)
    }
    
    /// Initialize a complex array as the same size as a real array.
    /// - Parameter sized: A real array.
    public init(sized: RealArray) {
        self = ComplexDoubleArray(count: sized.count)
    }
}
