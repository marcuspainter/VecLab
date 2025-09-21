//
//  SplitComplexArray+Exponents.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

import Accelerate

/// Exponential of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The exponential of `x`.
public func exp(_ x: SplitComplexArray) -> SplitComplexArray {
    validateSize(x)
    return vectorExpSplitComplexArray(x)
}

/// Returns a complex array from angles by Euler
/// - Parameter x: Angles in radians
/// - Returns: Complex array of (cos(x),  sin(x)) equivalent to exp(i \* x) by Euler's formula.
public func expi(_ x: RealArray) -> SplitComplexArray {
    var cosines = RealArray(repeating: 0.0, count: x.count)
    var sines = RealArray(repeating: 0.0, count: x.count)
    var n = Int32(x.count)
    vvsincos(&sines, &cosines, x, &n)
    return SplitComplexArray(cosines, sines)
}

/// Returns a complex array from angles by Euler
/// - Parameter x: Angles in radians
/// - Returns: Complex array of (cos(x),  sin(x)) equivalent to exp(j \* x) by Euler's formula.
public func expj(_ x: RealArray) -> SplitComplexArray {
    return expi(x)
}

/// Square root of sum of squares (hypotenuse)
/// - Parameters:
///   - a: Complex  array.
///   - b: Complex array.
/// - Returns: Returns the hypotenuse of a right triangle with side lengths of  `a`and `b`.
public func hypot(_ a: SplitComplexArray, _ b: SplitComplexArray) -> SplitComplexArray {
    validateSize(a, b)
    let result = zip(a, b).map { hypot($0, $1) }
    return SplitComplexArray(result)
}

/*
C = hypot(A,B) returns the hypotenuse of a right triangle with side lengths of A and B.
This function computes C = sqrt(abs(A).^2 + abs(B).^2) by avoiding underflow and overflow.

Pseudocode:

if abs(A) > abs(B)
    r = B / A;
    result = abs(A) * sqrt(1 + r^2);
else
    r = A / B;
    result = abs(B) * sqrt(1 + r^2);
end
*/

/// Natural logarithm of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The natural logarithm of `x`.
public func log(_ x: SplitComplexArray) -> SplitComplexArray {
    validateSize(x)
    return vectorLogSplitComplexArray(x)
}

/// Base 2 logarithm of a complex array.
/// - Returns: The base 2 logarithm of `x`.
/// - Parameter x: Complex array.
/// - Returns: The base 2 logarithm of `x`.
public func log2(_ x: SplitComplexArray) -> SplitComplexArray {
    validateSize(x)
    var c = SplitComplexArray(count: x.count)
    for k in 0..<x.count {
        c[k] = log2(x[k])
    }
    return c
}

/// Base 10 logarithm of a complex array.
public func log10(_ x: SplitComplexArray) -> SplitComplexArray {
    validateSize(x)
    var c = SplitComplexArray(count: x.count)
    for k in 0..<x.count {
        c[k] = log10(x[k])
    }
    return c
}

/// Square root of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The complex square roots.
public func sqrt(_ x: SplitComplexArray) -> SplitComplexArray {
    validateSize(x)
    var c = SplitComplexArray(count: x.count)
    for k in 0..<x.count {
        c[k] = sqrt(x[k])
    }
    return c
}
