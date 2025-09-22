//
//  SplitComplexArray+Arrays.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

import Accelerate

/// Concatenate arrays.
///
/// - Parameter arrays:List of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: SplitComplexArray...) -> SplitComplexArray {
    let totalCount = arrays.reduce(0) { $0 + $1.count }
    var newArray = SplitComplexArray()
    newArray.reserveCapacity(totalCount)
    for array in arrays {
        newArray.append(contentsOf: array)
    }
    return newArray
}

// Concatenate arrays.
///
/// - Parameter arrays:List of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: [SplitComplexArray]) -> SplitComplexArray {
    let totalCount = arrays.reduce(0) { $0 + $1.count }
    var newArray = SplitComplexArray()
    newArray.reserveCapacity(totalCount)
    for array in arrays {
        newArray.append(contentsOf: array)
    }
    return newArray
}

/// Circularly shift complex array.
/// - Parameters:
///   - x: Complex array.
///   - k: Shift amount.
/// - Returns: Circularly shifted array
public func circshift(_ x: SplitComplexArray, _ k: Int) -> SplitComplexArray {
    validateSize(x)
    return SplitComplexArray(circshift(x.real, k), circshift(x.imag, k))
}

/// Flip order of complex array.
/// - Parameter x:Complex array.
/// - Returns: Flipped array with elements reversed.
public func flip(_ x: SplitComplexArray) -> SplitComplexArray {
    validateSize(x)
    // Copy
    var c = x
    // Inplace reverse
    vDSP.reverse(&c.real)
    vDSP.reverse(&c.imag)
    return c
}

/// Length of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The length of the array.
public func length(_ x: SplitComplexArray) -> Int {
    validateSize(x)
    return x.count
}

/// Pad complex array with zeros.
/// - Parameters:
///   - x: Input array.
///   - m: Length.
/// - Returns: Array padded to length m.
public func paddata(_ x: SplitComplexArray, length m: Int) -> SplitComplexArray {
    validateSize(x)
    let n = x.count
    if m > n {
        let zeroCount = m - n
        let zeros = SplitComplexArray(count: zeroCount)
        return cat(x, zeros)
    }
    return x
}

/// Repeat a complex number.
/// - Parameters:
///   - x:A complex number.
///   - n:Number of repetitions.
/// - Returns: Repeated array.
public func repelem(_ x: Complex, _ n: Int) -> SplitComplexArray {
    let xarray = SplitComplexArray([x.real], [x.imag])
    guard n > 1 else {
        return xarray
    }

    var y = xarray
    for _ in 2...n {
        y.append(contentsOf: xarray)
    }
    return y
}

/// Repeat a complex array.
/// - Parameters:
///   - x: A complex array.
///   - n:Number of repetitions.
/// - Returns: Repeated array.
public func repelem(_ x: SplitComplexArray, _ n: Int) -> SplitComplexArray {
    validateSize(x)
    guard n > 1 else {
        return x
    }
    var y = x
    for _ in 2...n {
        y.append(contentsOf: x)
    }
    return y
}

/// Resize data by adding or removing elements.
/// - Parameters:
///   - x: Input array
///   - m: Length.
/// - Returns: Array of new length m.
public func resize(_ x: SplitComplexArray, length m: Int) -> SplitComplexArray {
    validateSize(x)
    let n = x.count
    guard m != n else { return x }
    var y = x
    if m < n {
        return x[0..<m]
    } else {
        let zeroCount = m - n
        let zeros = SplitComplexArray(count: zeroCount)
        y.append(contentsOf: zeros)
    }
    return y
}

/// Trim data by removing elements.
/// - Parameters:
///   - x: Complex array.
///   - m: New size.
/// - Returns: Trimmed array.
public func trimdata(_ x: SplitComplexArray, length m: Int) -> SplitComplexArray {
    validateSize(x)
    let n = x.count
    if m < n {
        return x[0..<m]
    }
    return x
}
