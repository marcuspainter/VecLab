//
//  hypot.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Foundation

/// Hypotenuse of a right triangle.
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

/// Hypotenuse of a right triangle.
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

