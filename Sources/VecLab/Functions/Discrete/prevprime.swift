//
//  prevprime.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Previous prime number.
///
/// The next prime number greater than or equal to`x`. less than or equal to `n`.
///
/// - Parameter n: Input number.
///
/// - Returns: The largest prime number smaller than or equal to `n`.
///
/// # Example
/// ```
/// let number: Real = 20.5
/// let previousPrime = prevprime(number)
/// print(previousPrime) // prints: 19.0
/// ```
public func prevprime(_ n: Real) -> Real {
    guard n >= 2 else { return Real.nan }
    var num = Int(n)
    while num >= 2 {
        if isprime(num) {
            return Real(num)
        }
        num -= 1
    }
    return 1.0
}
