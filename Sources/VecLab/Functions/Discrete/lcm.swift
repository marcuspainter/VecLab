//
//  lcm.swift
//
//
//  Created by Marcus Painter on 07/09/2023.
//

import Foundation

/// Computes the least common multiple of two integers.
///
/// This function returns the least common multiple (LCM) of `a` and `b`.
///
/// - Parameters:
///   - a: The first integer.
///   - b: The second integer.
///
/// - Returns: The LCM of `a` and `b`.
///
/// # Example
/// ```
/// let a = 4
/// let b = 5
/// let leastCommonMultiple = lcm(a, b)
/// print(leastCommonMultiple) // prints: 20
/// ```
public func lcm(_ a: Int, _ b: Int) -> Int {
    guard a != 0 || b != 0 else { return 0 }
    return abs(a * b) / gcd(a, b)
}

/*
// Example:
let A = 56
let B = 98
let L = lcm(A, B)
print(L) // LCM of 56 and 98 is 392
*/

/*
 Your function calculates the least common multiple (LCM) of two integers,
 a
 a and
 b
 b. The formula you're using is:

 LCM
 (
 a
 ,
 b
 )
 =
 ∣
 a
 ×
 b
 ∣
 GCD
 (
 a
 ,
 b
 )
 LCM(a,b)=
 GCD(a,b)
 ∣a×b∣
 ​


 This formula is based on the relationship between the LCM and the greatest common divisor (GCD) of two numbers.

 Here's a breakdown of your code:

 If both
 a
 a and
 b
 b are zero, the function returns 0. This is a special case since the LCM is undefined for two zeros.
 You calculate the LCM using the formula above, making use of the gcd function to find the GCD.
 The use of abs(a * b) ensures that the LCM is always positive.
 Your lcm function looks correct and should return the expected results. Good implementation!
 */
