//
//  complex.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Create a complex number.
/// - Returns: A complex number initialized to 0 + 0i.
public func complex() -> Complex {
    return (Real(0), Real(0))
}

/// Create a complex number.
/// - Parameters:
///   - a: Real part.
///   - b: Imaginary part.
/// - Returns: A complex number  a + bi.
public func complex(_ a: Real, _ b: Real) -> Complex {
    return (a, b)
}

/// Create a complex array.
/// - Parameter count: Number of elements in the array.
/// - Returns: A complex array of length `count`,  initialized to 0 + 0i.
public func complex(count: Int) -> ComplexArray {
    return createComplexArray(count: count)
}

/// Create a complex array from  real and imaginary arrays.
/// - Parameters:
///   - real: Real array.
///   - imag: Imaginary array.
/// - Returns: A complex array.
public func complex(_ real: RealArray, _ imag: RealArray) -> ComplexArray {
    assertSameSize(real, imag)
    return (real, imag)
}

/// Create a complex array of the same size of a complex array.
/// - Parameter sized: Complex array.
/// - Returns: A complex array the same size as the complex array.
public func complex(sized: ComplexArray) -> ComplexArray {
    return createComplexArray(count: sized.0.count)
}

/// Create a complex array of the same size of a real array.
/// - Parameter sized: Complex array.
/// - Returns: A complex array the same size as real  array.
public func complex(sized: RealArray) -> ComplexArray {
    return createComplexArray(count: sized.count)
}
