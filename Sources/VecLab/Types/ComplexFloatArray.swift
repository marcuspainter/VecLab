//
//  ComplexDoubleArray 2.swift
//  VecLab
//
//  Created by Marcus Painter on 12/04/2025.
//


//
//  ComplexDoubleArray.swift
//  VecLab
//
//  Created by Marcus Painter on 09/04/2025.
//

// https://itwenty.me/posts/04-swift-collections/

/// Array of complex numbers stored in split form
public struct ComplexFloatArray {
    public var real: [Float]
    public var imag: [Float]

    /// Initialize with empty arrays
    public init() {
        self.real = []
        self.imag = []
    }

    /// Initialize a complex array with zeros.
    /// - Parameters:
    ///   - count: Number of elements.
    public init(count: Int) {
        self.real = [Float](repeating: 0.0, count: count)
        self.imag = [Float](repeating: 0.0, count: count)
    }

    /// Initialize a complex array from real and imaginary arrays.
    /// - Parameters:
    ///   - real: Real array.
    ///   - imag: Imaginary array.
    public init(_ real: [Float], _ imag: [Float]) {
        guard real.count == imag.count else {
            fatalError("Real and imaginary arrays must have the same length")
        }
        self.real = real
        self.imag = imag
    }

    /// Initialize with array of complex numbers.
    /// - Parameter complexNumbers: An array of complex numbers.
    public init(_ complexNumbers: [ComplexFloat]) {
        self.real = complexNumbers.map { $0.real }
        self.imag = complexNumbers.map { $0.imag }
    }

    /// Initialize a complex array from a tuple of real and imaginary arrays.
    /// - Parameter tuple: Input tuple.
    public init(_ tuple: ([Float], [Float])) {
        assert(tuple.0.count == tuple.1.count, "Real and imaginary arrays must have the same length")
        self.real = tuple.0
        self.imag = tuple.1
    }

    /// Number of elements in the array
    public var count: Int {
        return real.count
    }

    /// Access a single complex element by index
    public subscript(index: Int) -> ComplexFloat {
        get {
            precondition(index >= 0 && index < count, "Index out of range")
            return ComplexFloat(real[index], imag[index])
        }
        set {
            precondition(index >= 0 && index < count, "Index out of range")
            real[index] = newValue.real
            imag[index] = newValue.imag
        }
    }

    /// Access a range of complex elements (like arr[1...5])
    public subscript(bounds: Range<Int>) -> ComplexFloatArray {
        get {
            precondition(bounds.lowerBound >= 0 && bounds.upperBound <= count, "Range out of bounds")
            return ComplexFloatArray(
            Array(real[bounds]),
            Array(imag[bounds])
            )
        }
        set {
            precondition(bounds.lowerBound >= 0 && bounds.upperBound <= count, "Range out of bounds")
            precondition(bounds.count == newValue.count, "Replacement array must have the same count as the range")

            for (offset, i) in bounds.enumerated() {
                real[i] = newValue.real[offset]
                imag[i] = newValue.imag[offset]
            }
        }
    }

    /// Access a range of complex elements with ClosedRange (like arr[1...5])
    public subscript(bounds: ClosedRange<Int>) -> ComplexFloatArray {
        get {
            return self[bounds.lowerBound..<(bounds.upperBound + 1)]
        }
        set {
            self[bounds.lowerBound..<(bounds.upperBound + 1)] = newValue
        }
    }

    /// Access complex elements using an array of indices (like arr[[1,3,5]])
    public subscript(indices: [Int]) -> ComplexFloatArray {
        get {
            // Verify all indices are in bounds
            for idx in indices {
                precondition(idx >= 0 && idx < count, "Index \(idx) out of range")
            }

            var resultReal: [Float] = []
            var resultImag: [Float] = []

            for idx in indices {
                resultReal.append(real[idx])
                resultImag.append(imag[idx])
            }

            return ComplexFloatArray(resultReal, resultImag)
        }
        set {
            // Verify all indices are in bounds
            for idx in indices {
                precondition(idx >= 0 && idx < count, "Index \(idx) out of range")
            }

            precondition(indices.count == newValue.count, "Replacement array must have the same count as the indices array")

            for (offset, idx) in indices.enumerated() {
                real[idx] = newValue.real[offset]
                imag[idx] = newValue.imag[offset]
            }
        }
    }

    /// Append a complex number to the array
    public mutating func append(_ complex: ComplexFloat) {
        real.append(complex.real)
        imag.append(complex.imag)
    }

    /// Append contents of another complex array
    public mutating func append(contentsOf array: ComplexFloatArray) {
        real.append(contentsOf: array.real)
        imag.append(contentsOf: array.imag)
    }

    /// Remove element at index
    @discardableResult
    public mutating func remove(at index: Int) -> ComplexFloat {
        precondition(index >= 0 && index < count, "Index out of range")
        let removed = ComplexFloat(real.remove(at: index), imag.remove(at: index))
        return removed
    }
}

// Make ComplexDoubleArray conform to Collection protocol
extension ComplexFloatArray: Collection {
    public typealias Index = Int
    public typealias Element = ComplexFloat

    public var startIndex: Int {
        return 0
    }

    public var endIndex: Int {
        return count
    }

    public func index(after i: Int) -> Int {
        return i + 1
    }
}

// Conforms to Equatable protocol
extension ComplexFloatArray: Equatable {
    /// Compares for equality.
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    /// - Returns: Returns a Boolean value indicating whether two values are equal.
    public static func == (lhs: Self, rhs: Self) -> Bool {
        guard lhs.count == rhs.count else {
            return false
        }

        var result = true
        for k in 0 ..< lhs.count {
            if lhs[k] != rhs[k] {
                result = false
                break
            }
        }
        return result
    }

}
