//
//  isprime.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Determines if a given integer is prime.
///
/// This function checks if `n` is a prime number using a deterministic method.
///
///  All prime numbers are of the form 6k±1, except for 2 and 3. Any prime greater than 3 can't be divisible by 2 or 3.
///  This means, after checking for the base cases, you only need to test factors of the form 6k±1.
///
/// - Parameter n: The integer to check.
///
/// - Returns: `true` if `n` is prime, `false` otherwise.
///
/// # Example
/// ```
/// let number = 17
/// let isNumberPrime = isprime(number)
/// print(isNumberPrime) // prints: true
/// ```
public func isprime(_ n: Int) -> Bool {
    if n <= 1 { return false }
    if n <= 3 { return true }

    // Eliminate numbers divisible by 2 or 3
    if n % 2 == 0 || n % 3 == 0 { return false }

    // Test for primes of the form 6k±1
    var i = 5
    while i * i <= n {
        if n % i == 0 || n % (i + 2) == 0 {
            return false
        }
        i += 6
    }
    return true
}

/*

 Your isprime function is a well-known optimized check for determining if a number is prime. The logic behind
 this optimization is based on the following observations:

 All prime numbers are of the form 6k±1, except for 2 and 3.
 Any prime greater than 3 can't be divisible by 2 or 3.
 This means, after checking for the base cases, you only need to test factors of the form
 6k±1.

 Here's a quick breakdown of your function:

 Numbers less than or equal to 1 are not prime.
 Numbers 2 and 3 are prime.
 If a number is divisible by 2 or 3, it's not prime.
 For all other numbers, check divisibility for numbers of the form 6k±1.

*/
