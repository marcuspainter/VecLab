//
//  VectorDouble+Extensions.swift
//  VecLab
//
//  Created by Marcus Painter on 23/04/2025.
//

import Foundation
import Accelerate

/// A high-performance vector class for Double values using unsafe buffers
final public class VectorDouble {
    // MARK: - Properties
    
    /// The count of elements in the vector
    public internal(set) var count: Int
    
    /// The underlying unsafe buffer storing the vector data
    internal var buffer: UnsafeMutableBufferPointer<Double>
    
    // MARK: - Initialization
    
    /// Creates a new vector with specified size, initialized with zeros
    public init(count: Int) {
        self.count = count
        self.buffer = UnsafeMutableBufferPointer.allocate(capacity: count)
        self.buffer.initialize(repeating: 0.0)
    }
    
    /// Creates a new vector from an array of doubles
    public init(values: [Double]) {
        self.count = values.count
        self.buffer = UnsafeMutableBufferPointer.allocate(capacity: count)
        _ = self.buffer.initialize(from: values)
    }
    
    /// Creates a new vector with specified size, initialized with a single value
    public init(repeating value: Double, count: Int) {
        self.count = count
        self.buffer = UnsafeMutableBufferPointer.allocate(capacity: count)
        self.buffer.initialize(repeating: value)
    }
    
    /// Creates a new vector by copying another VectorDouble
    public init(copying other: VectorDouble) {
        self.count = other.count
        self.buffer = UnsafeMutableBufferPointer.allocate(capacity: count)
        _ = self.buffer.initialize(from: other.buffer)
    }
    
    // MARK: - Deinitialization
    
    deinit {
        buffer.deallocate()
    }
    
    // MARK: - Subscript Access
    
    // We'll keep the subscript in the base class since some compilers
    // have issues with protocol extensions providing this
    public subscript(position: Int) -> Double {
        get {
            precondition(position >= 0 && position < count, "Index out of bounds")
            return buffer[position]
        }
        set {
            precondition(position >= 0 && position < count, "Index out of bounds")
            buffer[position] = newValue
        }
    }
    
    // MARK: - Conversion
    
    /// Convert to Swift array
    public func asArray() -> [Double] {
        return Array(buffer)
    }
    
    // MARK: - Buffer Access
    
    /// Provides direct access to the underlying buffer
    public func withUnsafeBufferPointer<R>(_ body: (UnsafeBufferPointer<Double>) -> R) -> R {
        return body(UnsafeBufferPointer(buffer))
    }
    
    /// Provides direct mutable access to the underlying buffer
    public func withUnsafeMutableBufferPointer<R>(_ body: (UnsafeMutableBufferPointer<Double>) -> R) -> R {
        return body(buffer)
    }
}
