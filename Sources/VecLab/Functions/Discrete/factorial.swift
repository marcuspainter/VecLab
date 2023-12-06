//
//  factorial.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Factorial
///
/// This function returns the factorial of `n`, denoted as `n!`, which is the product of all positive integers less than or equal to `n`.
///
/// - Parameter n: The integer whose factorial is to be computed. If `n` is negative, the function returns NaN to indicate an error.
///
/// - Returns: The factorial of `n`. Returns  Nan for negative values of `n`.
///
/// - Note:
///   Factorial grows very quickly and can exceed the storage capacity for standard integer types even for relatively small values of `n`.
///
/// # Example
/// ```
/// let number = 5
/// let fact = factorial(number)
/// print(fact) // prints: 120
/// ```
public func factorial(_ n: Int) -> Real {
    if n < 0 { return Real.nan }  // Return NaN for negative numbers
    if n <= 1 { return 1.0 }        // Return 1.0 for 0! and 1!

    var product = 1
    for i in 2...n {
        product *= i
    }
    return Real(product)
}
