//
//  primes.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Prime numbers.
///
/// This function generates an array of prime numbers that are less than or equal to `x`.
///
/// - Parameter x: The upper limit for prime numbers. If `x` is less than 2, the function returns an empty array.
///
/// - Returns: An array containing all prime numbers ≤ `x`.
///
/// # Example
/// ```
/// let limit: Real = 10.0
/// let primeNumbers = primes(limit)
/// print(primeNumbers) // prints: [2.0, 3.0, 5.0, 7.0]
/// ```
public func primes(_ x: Real) -> RealArray {
    let n = floor(x)
    let intN = Int(n)

    if n < 2 { return [] }

    var isPrime = [Bool](repeating: true, count: intN + 1)
    isPrime[0] = false
    isPrime[1] = false

    for i in 2...Int(sqrt(Real(n))) {
        if isPrime[i] {
            for j in stride(from: i * i, to: intN + 1, by: i) {
                isPrime[j] = false
            }
        }
    }

    let primesList = isPrime.enumerated().compactMap { $1 ? Real($0) : nil }
    return primesList
}
