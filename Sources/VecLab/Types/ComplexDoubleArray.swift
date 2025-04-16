//
//  ComplexDoubleArray.swift
//  VecLab
//
//  Created by Marcus Painter on 09/04/2025.
//

// https://itwenty.me/posts/04-swift-collections/

/// Complex array implementation using split real/imaginary arrays
public struct ComplexDoubleArray: Collection, MutableCollection, RangeReplaceableCollection,
    BidirectionalCollection, RandomAccessCollection,
    Equatable, Hashable, Codable, CustomStringConvertible,
    ExpressibleByArrayLiteral, Sendable {
    // MARK: - Storage

    
    ///  Array of real values.
    public var real: [Double]
    /// Array of imaginmary values.
    public var imag: [Double]

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
    
    /// Initialize a complex array of length count.
    /// - Parameter count: Number of elements.
    public init(count: Int) {
        real = [Double](repeating: 0, count: count)
        imag = [Double](repeating: 0, count: count)
    }
    
    /// Initialize a complex array from a collection.
    public init<C: Collection>(_ elements: C) where C.Element == ComplexDouble {
        real = elements.map { $0.real }
        imag = elements.map { $0.imag }
    }

    /// Initialize a complex array from complex numbers..
    public init(arrayLiteral elements: ComplexDouble...) {
        self.init(elements)
    }

    // MARK: - Collection Protocol Requirements

    public typealias Element = ComplexDouble
    public typealias Index = Int
    public typealias SubSequence = ComplexDoubleArray
    public typealias Indices = Range<Int>

    /// Start index.
    public var startIndex: Int { return 0 }
    /// End index.
    public var endIndex: Int { return real.count }
    /// Array of indices.
    public var indices: Indices { return startIndex ..< endIndex }
    /// Number of elements.
    public var count: Int { return real.count }
    /// Tests if array is empty.
    public var isEmpty: Bool { return real.isEmpty }

    /// Index after.
    /// - Parameter i: An index.
    /// - Returns: The index after.
    public func index(after i: Int) -> Int { return i + 1 }
    /// Index before.
    /// - Parameter i: An Index.
    /// - Returns: The index before.
    public func index(before i: Int) -> Int { return i - 1 }
    public func formIndex(after i: inout Int) { i += 1 }
    public func formIndex(before i: inout Int) { i -= 1 }

    /// Distance between indices
    /// - Parameters:
    ///   - start: Start index.
    ///   - end: End Index.
    /// - Returns: The distance.
    public func distance(from start: Int, to end: Int) -> Int {
        return end - start
    }

    public func index(_ i: Int, offsetBy distance: Int) -> Int {
        return i + distance
    }

    public func index(_ i: Int, offsetBy distance: Int, limitedBy limit: Int) -> Int? {
        let n = i + distance
        return (distance > 0 && n > limit) || (distance < 0 && n < limit) ? nil : n
    }

    // MARK: - Sequence Protocol
    
    /// Iterator for ComplexDoubleArray.
    public struct Iterator: IteratorProtocol {
        private let array: ComplexDoubleArray
        private var currentIndex: Int
        
        /// Intialize with array.
        /// - Parameter array: A complex array to iterate.
        init(_ array: ComplexDoubleArray) {
            self.array = array
            currentIndex = array.startIndex
        }
        
        /// Gets the next complex number.
        /// - Returns: The next complex number.
        public mutating func next() -> ComplexDouble? {
            guard currentIndex < array.endIndex else { return nil }
            let element = array[currentIndex]
            currentIndex = array.index(after: currentIndex)
            return element
        }
    }

    /// Create an iterator..
    public func makeIterator() -> Iterator {
        return Iterator(self)
    }

    // MARK: - RangeReplaceableCollection
    
    /// Replace a subrange of a complex array.
    /// - Parameters:
    ///   - subrange: Index subrange.
    ///   - newElements: Replacement complex numbers.
    public mutating func replaceSubrange<C: Collection>(_ subrange: Range<Int>, with newElements: C)
        where C.Element == ComplexDouble {
            
        precondition(subrange.lowerBound >= 0 && subrange.upperBound <= count, "Range out of bounds")

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

    public subscript(bounds: Range<Int>) -> SubSequence {
        get {
            precondition(bounds.lowerBound >= 0 && bounds.upperBound <= count, "Range out of bounds")
            var slice = ComplexDoubleArray()
            slice.real = Array(real[bounds])
            slice.imag = Array(imag[bounds])
            return slice
        }
        set {
            precondition(bounds.lowerBound >= 0 && bounds.upperBound <= count, "Range out of bounds")
            precondition(newValue.count == bounds.count, "Replacement array must be same size as range")

            real.replaceSubrange(bounds, with: newValue.real)
            imag.replaceSubrange(bounds, with: newValue.imag)
        }
    }

    public subscript(bounds: ClosedRange<Int>) -> SubSequence {
        get {
            return self[bounds.lowerBound ..< (bounds.upperBound + 1)]
        }
        set {
            self[bounds.lowerBound ..< (bounds.upperBound + 1)] = newValue
        }
    }

    public subscript(bounds: PartialRangeFrom<Int>) -> SubSequence {
        get {
            return self[bounds.lowerBound ..< endIndex]
        }
        set {
            self[bounds.lowerBound ..< endIndex] = newValue
        }
    }

    public subscript(bounds: PartialRangeUpTo<Int>) -> SubSequence {
        get {
            return self[0 ..< bounds.upperBound]
        }
        set {
            self[0 ..< bounds.upperBound] = newValue
        }
    }

    public subscript(bounds: PartialRangeThrough<Int>) -> SubSequence {
        get {
            return self[0 ... bounds.upperBound]
        }
        set {
            self[0 ... bounds.upperBound] = newValue
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
    public mutating func append<S: Sequence>(contentsOf newElements: S) where S.Element == ComplexDouble {
        let newValues = Array(newElements)
        real.append(contentsOf: newValues.map { $0.real })
        imag.append(contentsOf: newValues.map { $0.imag })
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
