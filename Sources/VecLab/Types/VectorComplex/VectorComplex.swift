//
//  VectorComplex.swift
//  VecLab
//
//  Created by Marcus Painter on 24/04/2025.
//

import Accelerate

final public class VectorComplex {
    public internal(set) var count: Int
    internal var real: UnsafeMutableBufferPointer<Double>
    internal var imag: UnsafeMutableBufferPointer<Double>
    
    public init(count: Int) {
        self.count = count
        self.real = UnsafeMutableBufferPointer.allocate(capacity: count)
        self.imag = UnsafeMutableBufferPointer.allocate(capacity: count)
        self.real.initialize(repeating: 0.0)
        self.imag.initialize(repeating: 0.0)
    }
    
    /// Creates a new vector from an array of doubles
    public init(real: [Double], imag: [Double]) {
        precondition(real.count == imag.count, "Real and imaginary parts must have the same length")
        self.count = real.count
        self.real = UnsafeMutableBufferPointer.allocate(capacity: count)
        self.imag = UnsafeMutableBufferPointer.allocate(capacity: count)
        _ = self.real.initialize(from: real)
        _ = self.imag.initialize(from: imag)
    }
    
    deinit {
        real.deallocate()
        imag.deallocate()
    }
    
    public var dspSplitComplex: DSPDoubleSplitComplex {
        return DSPDoubleSplitComplex(realp: real.baseAddress!, imagp: imag.baseAddress!)
    }
    
    public func asArray() -> [Double] {
        return Array(real)
    }

}
