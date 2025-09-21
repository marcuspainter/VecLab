//
//  ComplexArray+Arrays.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

import Accelerate


/// Concatenate arrays.
///
/// - Parameter arrays:List of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: ComplexArray...) -> ComplexArray {
    let totalCount = arrays.reduce(0) { $0 + $1.count }
    var newArray = ComplexArray()
    newArray.reserveCapacity(totalCount)
    for array in arrays {
        newArray.append(contentsOf: array)
    }
    return newArray
}

public func circshift(_ x: [Complex], _ k: Int) -> [Complex] {
    let n = x.count
    if n == 0 { return x }

    let shift = ((k % n) + n) % n
    if shift == 0 { return x }

    let out = Array<Complex>(unsafeUninitializedCapacity: n) { buffer, initializedCount in
        x.withUnsafeBufferPointer { xPtr in
            buffer.withUnsafeMutableBufferPointer { outPtr in
                let xBase = xPtr.baseAddress!
                let outBase = outPtr.baseAddress!

                // Copy last `shift` elements to the beginning
                outBase.update(from: xBase + (n - shift), count: shift)

                // Copy first `n - shift` elements after the shifted portion
                (outBase + shift).update(from: xBase, count: n - shift)
            }
        }
        initializedCount = n
    }
    return out
}

/// Flip order of complex array.
/// - Parameter x: Complex array.
/// - Returns: Flipped array with elements reversed.
public func flip(_ x: [Complex]) -> [Complex] {
    return x.reversed()
}

/// Length of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The length of the array.
public func length(_ x: [Complex]) -> Int {
    return x.count
}

/// Resize data by adding or removing elements.
/// - Parameters:
///   - x: Input array
///   - m: Length.
/// - Returns: Array of new length m.
public func resize(_ x: ComplexArray, length m: Int) -> ComplexArray {
    let n = x.count
    guard m != n else { return x }
    var y = x
    if m < n {
        return Array(x[0..<m])
    } else {
        let zeroCount = m - n
        let zeros = ComplexArray(count: zeroCount)
        y.append(contentsOf: zeros)
    }
    return y
}

/// Trim data by removing elements.
/// - Parameters:
///   - x: Complex array.
///   - m: New size.
/// - Returns: Trimmed array.
public func trimdata(_ x: ComplexArray, length m: Int) -> ComplexArray {
    let n = x.count
    if m < n {
        return Array(x[0..<m])
    }
    return x
}
