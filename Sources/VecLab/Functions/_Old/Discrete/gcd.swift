//
//  gcd.swift
//
//
//  Created by Marcus Painter on 07/09/2023.
//

import Foundation

/// Computes the greatest common divisor of two integers.
///
/// This function returns the greatest common divisor (GCD) of `A` and `B` using the Euclidean algorithm.
///
/// - Parameters:
///   - A: The first integer.
///   - B: The second integer.
///
/// - Returns: The GCD of `A` and `B`.
///
/// # Example
/// ```
/// let a = 56
/// let b = 98
/// let greatestCommonDivisor = gcd(a, b)
/// print(greatestCommonDivisor) // prints: 14
/// ```
public func gcd(_ A: Int, _ B: Int) -> Int {
    var a = A
    var b = B
    while b != 0 {
        let remainder = a % b
        a = b
        b = remainder
    }
    return abs(a)
}

/*
// Example:
let A = 56
let B = 98
let G = gcd(A, B)
print(G) // GCD of 56 and 98 is 14
*/

/*
 Your gcd function implements the Euclidean algorithm, a classical algorithm for finding the greatest common divisor
 (GCD) of two numbers.

 Here's a quick breakdown:

 While b is not zero, repeatedly replace (a, b) with (b, a % b).
 When b becomes zero, a will contain the greatest common divisor of A and B.
 The function you've provided is correct. Additionally, the use of abs(a) at the end ensures that the returned GCD
 is always non-negative, regardless of the signs of the input numbers A and B.

 The Euclidean algorithm is an efficient way to calculate the GCD of two numbers, so your implementation is both
 correct and efficient.
 */
