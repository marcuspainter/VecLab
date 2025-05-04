//
//  hypot.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Foundation

/// Square root of sum of squares (hypotenuse).
/// - Parameters:
///   - a: Real number.
///   - b: Real number.
/// - Returns: Returns the hypotenuse of a right triangle with side lengths of  `a`and `b`.
public func hypot(_ a: Real, _ b: Real) -> Real {
    var r: Real
    var result: Real
    if abs(a) > abs(b) {
        r = b / a
        result = abs(a) * Darwin.sqrt(1.0 + r*r)
    } else {
        r = a / b
        result = abs(b) * Darwin.sqrt(1.0 + r*r)
    }
    return result
}

/// Square root of sum of squares (hypotenuse).
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: Returns the hypotenuse of a right triangle with side lengths of  `a`and `b`.
public func hypot(_ a: RealArray, _ b: RealArray) -> RealArray {
    validateSize(a, b)
    let result = zip(a, b).map { hypot($0, $1) }
    return result
}

/// Square root of sum of squares (hypotenuse).
/// - Parameters:
///   - a: Real number.
///   - b: Real number.
/// - Returns: Returns the hypotenuse of a right triangle with side lengths of  `a`and `b`.
public func hypot(_ a: Complex, _ b: Complex) -> Complex {
    var r: Complex
    var result: Complex
    if abs(a) > abs(b) {
        r = b / a
        result = abs(a) * sqrt(1.0 + r*r)
    } else {
        r = a / b
        result = abs(b) * sqrt(1.0 + r*r)
    }
    return result
}

/// Square root of sum of squares (hypotenuse)
/// - Parameters:
///   - a: Complex  array.
///   - b: Complex array.
/// - Returns: Returns the hypotenuse of a right triangle with side lengths of  `a`and `b`.
public func hypot(_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
    validateSize(a, b)
    let result = zip(a, b).map { hypot($0, $1) }
    return ComplexArray(result)
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
