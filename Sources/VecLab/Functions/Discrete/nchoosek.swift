//
//  nchoosek.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Binomial coefficient.
///
/// The function computes the binomial coefficient, often represented as \( \binom{n}{k} \), which signifies the
/// number of ways to choose `k` items from  a set of `n` items without repetition and without order.
///
/// - Parameters:
///   - n: The total number of items.
///   - k: The number of items to choose at a time.
///
/// - Returns: An integer representing the number of ways to choose `k` items from a set of `n` items.
/// If `k` is larger than `n`, the result is 0.
///
/// - Note:
///   The binomial coefficient is calculated using the formula: \( \binom{n}{k} = \frac{n!}{k! (n-k)!} \).
///
/// # Example
/// ```
/// let totalItems = 5
/// let itemsToChoose = 2
/// let coefficient = nchoosek(totalItems, itemsToChoose)
/// print(coefficient) // prints: 10
/// ```
public func nchoosek(_ n: Int, _ k: Int) -> Int {
    if k > n {
        return 0
    }
    if k == 0 || k == n {
        return 1
    }

    var result = 1
    var divisor = 1
    for i in 1...k {
        result *= (n - i + 1)
        divisor *= i
    }

    return result / divisor
}

/// All combinations of elements in array.
///
/// This function computes all the possible combinations of `k` elements from the array `v`.
/// The combinations are generated in a lexicographical order.
///
/// - Parameters:
///   - v: An array of elements from which to generate combinations.
///   - k: The number of elements in each combination.
///
/// - Returns: An array of arrays, where each inner array represents a distinct combination
///  of `k` elements from `v`.
///
/// - Note:
///   If `k` is larger than the number of elements in `v`, or if `k` is 0, an empty array is returned.
///
/// # Example
/// ```
/// let array = [1, 2, 3, 4]
/// let combinations = nchoosek(array, 2)
/// print(combinations) // prints: [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
/// ```
public func nchoosek<T>(_ v: [T], _ k: Int) -> [[T]] {
    if k == 0 { return [[]] }
    if v.isEmpty { return [] }

    if let first = v.first {
        let subArray = Array(v.dropFirst())
        let firstList = nchoosek(subArray, k - 1).map { [first] + $0 }
        let secondList = nchoosek(subArray, k)
        return firstList + secondList
    }

    return []
}

/*
 let coefficient = nchoosek(5, 2) // Returns 10
 print(coefficient)

 let combinations = nchoosek([1, 2, 3, 4], 2)
 // Returns [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
 print(combinations)

 */
