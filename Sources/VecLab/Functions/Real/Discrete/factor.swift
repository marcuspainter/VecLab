//
//  factor.swift
//
//
//  Created by Marcus Painter on 12/09/2023.
//

import Foundation

/// Returns the prime factors of the given integer.
///
/// This function computes the prime factorization of `n` using the method of trial division.
/// Each prime factor is listed as many times as it appears in the prime factorization.
///
/// - Parameter n: The integer to factorize. It must be greater than 1.
///
/// - Returns: An array of prime factors of `n`. Returns an empty array if `n` is 0 or 1.
///
/// - Note:
///   The returned factors are in ascending order.
///
/// # Example
/// ```
/// let number = 56
/// let primeFactors = factor(number)
/// print(primeFactors) // prints: [2, 2, 2, 7]
/// ```
public func factor(_ n: Int) -> [Int] {
    if n <= 1 {
        return []
    }

    var n = n
    var factors: [Int] = []
    var divisor = 2

    while n > 1 {
        while n % divisor == 0 {
            factors.append(divisor)
            n /= divisor
        }
        divisor += 1
    }

    return factors
}
