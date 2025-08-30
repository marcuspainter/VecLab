//
//  perms.swift
//  
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// All possible permutations.
///
/// This function computes and returns all the possible permutations of the elements in the provided array.
///
/// - Parameter array: Input array.
///
/// - Returns: An array of arrays, where each inner array represents a distinct permutation of the elements in
/// the array.
///
/// - Note:
///   The number of permutations of an array of `n` elements is n! (n factorial). As a result, the output can
/// grow very large for relatively small input arrays.
///
/// # Example
/// ```
/// let array = [1, 2, 3]
/// let allPermutations = perms(array)
/// print(allPermutations)
/// // prints: [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
/// ```
public func perms<T>(_ array: [T]) -> [[T]] {
    if array.count == 0 { return [[]] }
    if array.count == 1 { return [array] }

    var result: [[T]] = []

    for (index, item) in array.enumerated() {
        let remaining = Array(array[..<index] + array[(index+1)...])
        for perm in perms(remaining) {
            result.append([item] + perm)
        }
    }

    return result
}

/*
let numbers = [1, 2, 3]
print(perms(numbers))
*/

// The algorithm to get the next lexicographic permutation is as follows:

// Find the largest index i such that array[i] < array[i+1]. If no such index exists, the permutation is the 
// last permutation. Find the largest index j greater than i such that array[i] < array[j]. Swap the value of array[i]
// with that of array[j]. Reverse the sub-array array[i+1 ... end].

/*
 
 public func perms<T: Comparable>(_ array: [T]) -> [[T]] {
     var array = array.sorted()
     var result: [[T]] = [array]
     
     while true {
         var i = array.count - 2
         while i >= 0 && array[i] >= array[i+1] {
             i -= 1
         }
         
         if i == -1 { break }
         
         var j = array.count - 1
         while array[j] <= array[i] {
             j -= 1
         }
         
         array.swapAt(i, j)
         array[(i+1)...].reverse()
         result.append(array)
     }
     
     return result
 }

 */
