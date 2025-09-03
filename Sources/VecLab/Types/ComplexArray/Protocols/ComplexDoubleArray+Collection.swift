//
//  ComplexDoubleArray+Collection.swift
//  VecLab
//
//  Created by Marcus Painter on 11/05/2025.
//

extension ComplexDoubleArray:
    MutableCollection,
    BidirectionalCollection,
    RandomAccessCollection,
    RangeReplaceableCollection
{

    /// Reserve storage capacity of array.
    /// - Parameter minimumCapacity: The minimum capacity.
    public mutating func reserveCapacity(_ minimumCapacity: Int) {
        self.real.reserveCapacity(minimumCapacity)
        self.imag.reserveCapacity(minimumCapacity)
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
        precondition(
            subrange.count == newElements.count,
            "Replacement size must match range size: \(subrange.count) vs \(newElements.count)"
        )

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
                return  // Exit without making changes
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
                return  // Exit without making changes
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
                return  // Exit without making changes
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
                return  // Exit without making changes
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
                print(
                    "ERROR: Replacement size must match range size: \((fullRange.upperBound - fullRange.lowerBound + 1)) vs \(newValue.count)"
                )
                return  // Exit without making changes
            }

            self[fullRange] = newValue
        }
    }

    // Function to assert that two arrays have the same size
    private func assertSameSize<T, U>(_ lhs: [T], _ rhs: [U]) {
        precondition(lhs.count == rhs.count, "Arrays must have the same size: \(lhs.count) vs \(rhs.count)")
    }
}
