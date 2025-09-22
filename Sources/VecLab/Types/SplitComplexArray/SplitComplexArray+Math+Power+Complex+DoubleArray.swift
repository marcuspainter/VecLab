//
//  SplitComplexArray+Math+Power+Complex+DoubleArray.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

import Accelerate

/// Complex addition.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the addition.
public func + (a: Complex, b: [Double]) -> SplitComplexArray {
    let real = vDSP.add(a.real, b)
    let imag = [Double](repeating: a.imag, count: b.count)
    return SplitComplexArray(real, imag)
}

/// Complex addition.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the addition.
public func + (a: [Double], b: Complex) -> SplitComplexArray {
    let real = vDSP.add(b.real, a)
    let imag = [Double](repeating: b.imag, count: a.count)
    return SplitComplexArray(real, imag)
}

/// Complex subtraction.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the subtraction.
public func - (a: Complex, b: [Double]) -> SplitComplexArray {
    let real = a.real - b
    let imag = RealArray(repeating: Real(a.imag), count: b.count)
    return SplitComplexArray(real, imag)
}

/// Complex subtraction.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the subtraction.
public func - (a: [Double], b: Complex) -> SplitComplexArray {
    let real = a - b.real
    let imag = RealArray(repeating: -Real(b.imag), count: a.count)
    return SplitComplexArray(real, imag)
}

/// Complex multiplication.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the multiplication.
public func * (a: Complex, b: [Double]) -> SplitComplexArray {
    let real = vDSP.multiply(a.real, b)
    let imag = vDSP.multiply(a.imag, b)
    return SplitComplexArray(real, imag)
}

/// Complex multiplication.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the multiplication.
public func * (a: [Double], b: Complex) -> SplitComplexArray {
    let real = vDSP.multiply(b.real, a)
    let imag = vDSP.multiply(b.imag, a)
    return SplitComplexArray(real, imag)
}

/// Complex division.
/// - Parameters:
///   - a: Complex number.
///   - b: Real number.
/// - Returns: The result of the division.
public func / (a: Complex, b: [Double]) -> SplitComplexArray {
    // return vectorDivideComplexRealArray(a, b)
    let real = vDSP.divide(a.real, b)
    let imag = vDSP.divide(a.imag, b)
    return SplitComplexArray(real, imag)
}

/// Complex division.
/// - Parameters:
///   - a: Real number.
///   - b: Complex number.
/// - Returns: The result of the division.
public func / (a: [Double], b: Complex) -> SplitComplexArray {
    var c = SplitComplexArray(count: a.count)
    let b0 = [Double](repeating: b.real, count: a.count)
    let b1 = [Double](repeating: b.imag, count: a.count)
    let bb = SplitComplexArray(b0, b1)
    let a0 = a
    let a1 = [Double](repeating: 0.0, count: a.count)
    let aa = SplitComplexArray(a0, a1)
    validateSize(aa, bb)
    validateSize(aa, c)
    SplitComplexArray.withUnsafeParameters(aa, bb, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

/// Complex Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: Complex, _ b: [Double]) -> SplitComplexArray {
    return pow(a, b)
}

/// Complex Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of `b`.
@inlinable
public func ** (_ a: [Double], _ b: Complex) -> SplitComplexArray {
    return pow(a, b)
}

/// Left conjugate multiply.
/// - Parameters:
///   - a: Complex number.
///   - b: Real  array.
/// - Returns: The result of the conjugate multiplication `conj(a) * b`.
@inlinable
public func ~* (a: Complex, b: RealArray) -> SplitComplexArray {
    return conj(a) * b
}

/// Right conjugate multiply.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: The result of the conjugate multiplication `a * conj(b)`.
@inlinable
public func *~ (a: RealArray, b: Complex) -> SplitComplexArray {
    return a * conj(b)  // Overloaded
}
