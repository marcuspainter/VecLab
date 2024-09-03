//
//  nextprime.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Next prime number.
///
/// This function returns the smallest prime number that's greater than or equal to `x`.
///
/// - Parameter x: Input number.
///
/// - Returns: The next prime number greater than or equal to`x`.
///
/// # Example
/// ```
/// let number = 20
/// let nextPrime = nextprime(number)
/// print(nextPrime) // prints: 23
/// ```
public func nextprime(_ x: Int) -> Int {
    let maxPrime = 2147483647
    var num = x
    while num < maxPrime {
        if isprime(num) {
            return num
        }
        num += 1
    }
    return maxPrime
}
