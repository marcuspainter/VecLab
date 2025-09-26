//
//  SplitComplexArray+Collection.swift
//  VecLab
//
//  Created by Marcus Painter on 11/05/2025.
//

extension SplitComplexArray:
    MutableCollection,
    BidirectionalCollection,
    RandomAccessCollection,
    RangeReplaceableCollection {
    
    /// Reserve storage capacity of array.
    /// - Parameter minimumCapacity: The minimum capacity.
    public mutating func reserveCapacity(_ minimumCapacity: Int) {
        self.real.reserveCapacity(minimumCapacity)
        self.imag.reserveCapacity(minimumCapacity)
    }
    
    // MARK: - Collection Protocol Requirements
    
    public typealias Element = Complex
    public typealias Index = Int
    public typealias SubSequence = SplitComplexArray
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
    where C.Element == Complex {
        
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
    
    public subscript(position: Int) -> Complex {
        get {
            precondition(position >= 0 && position < count, "Index out of range")
            return Complex(real[position], imag[position])
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
    public mutating func append(_ element: Complex) {
        real.append(element.real)
        imag.append(element.imag)
    }
    
    /// Append a complex array.
    /// - Parameter newElements: A complex array.
    public mutating func append(contentsOf newElements: SplitComplexArray) {
        real.append(contentsOf: newElements.real)
        imag.append(contentsOf: newElements.imag)
    }
    
    /// Insert a complex array.
    /// - Parameters:
    ///   - element: A complex number.
    ///   - index: Index insertion point.
    public mutating func insert(_ element: Complex, at index: Int) {
        precondition(index >= 0 && index <= count, "Index out of range for insertion")
        real.insert(element.real, at: index)
        imag.insert(element.imag, at: index)
    }
    
    /// Removes a complex number.
    /// - Parameter index: Index of item.
    /// - Returns: Removed item.
    public mutating func remove(at index: Int) -> Complex {
        precondition(index >= 0 && index < count, "Index out of range for removal")
        let complexValue = Complex(real[index], imag[index])
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
    
}
