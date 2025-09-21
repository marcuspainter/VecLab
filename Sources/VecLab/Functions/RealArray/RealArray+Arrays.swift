//
//  RealArray+Arrays.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

import Accelerate

/// Concatenate arrays.
///
/// - Parameter arrays: List of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: RealArray...) -> RealArray {
    return cat(arrays)
}

/// Concatenate arrays.
///
/// - Parameter arrays:Array of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: [RealArray]) -> RealArray {
    let totalCount = arrays.reduce(0) { $0 + $1.count }

    return RealArray(unsafeUninitializedCapacity: totalCount) { buffer, initializedCount in
        var index = 0
        for array in arrays {
            let n = array.count
            let destinationOffsetPtr = buffer.baseAddress!.advanced(by: index)

            array.withUnsafeBufferPointer { sourceBuffer in
                // vDSP memory move (vector copy)
                vDSP_mmovD(
                    sourceBuffer.baseAddress!,   // source
                    destinationOffsetPtr,        // destination
                    vDSP_Length(n),              // number of columns
                    1,                           // number of rows
                    vDSP_Length(n),              // row stride in source
                    vDSP_Length(n)               // row stride in destination
                )
            }
            index += n
        }
        initializedCount = totalCount
    }
}

/// Circularly shift real array.
/// - Parameters:
///   - x: Real array.
///   - k: Shift amount.
/// - Returns: Circularly shifted array.
public func circshift(_ x: RealArray, _ k: Int) -> RealArray {
    let n = x.count
    if n == 0 { return x }

    let shift = ((k % n) + n) % n
    if shift == 0 { return x }

    return RealArray(unsafeUninitializedCapacity: n) { buffer, initializedCount in
        x.withUnsafeBufferPointer { xPtr in
            let xBase = xPtr.baseAddress!
            let outBase = buffer.baseAddress!

            // Copy last `shift` elements to the beginning
            vDSP_mmovD(
                xBase + (n - shift), // source
                outBase,             // destination
                vDSP_Length(shift),  // number of columns
                1,                   // number of rows
                vDSP_Length(shift),  // source row stride
                vDSP_Length(shift)   // destination row stride
            )

            // Copy first `n - shift` elements after the shifted portion
            vDSP_mmovD(
                xBase,                    // source
                outBase + shift,          // destination
                vDSP_Length(n - shift),   // number of columns
                1,                        // number of rows
                vDSP_Length(n - shift),   // source row stride
                vDSP_Length(n - shift)    // destination row stride
            )
        }
        initializedCount = n
    }
}

/// Fills a real array with a value in place.
/// - Parameters:
///   - c: Array.
///   - a: Value.
public func fill(_ c: RealArray, _ a: Real) {
    fillRealArray(c, a)
}

/// Flip order of array.
/// - Parameter x: Real array.
/// - Returns: Flipped array with elements reversed.
public func flip(_ x: RealArray) -> RealArray {
    // Copy
    var y = x
    // Inplace reverse
    vDSP.reverse(&y)
    return y
}

/// Length of a real array.
/// - Parameter x: Real array.
/// - Returns: The length of the array.
public func length(_ x: RealArray) -> Int {
    return x.count
}

/// Create an array of ones.
/// - Parameter count: Number of elements in the array.
/// - Returns: A real array of length `count`.
public func ones(_ count: Int) -> RealArray {
    return RealArray(repeating: 1.0, count: count)
}

/// Create an array of ones.
/// - Parameter count: Number of elements in the array.
/// - Returns: A real array of length `count`.
public func ones(_ count: Real) -> RealArray {
    return RealArray(repeating: 1.0, count: Int(count))
}

/// Pad real array with zeros.
/// - Parameters:
///   - x: Input array.
///   - m: Length..
/// - Returns: Array padded to length m.
public func paddata(_ x: RealArray, length m: Int) -> RealArray {
    let n = x.count
    if m > n {
        let zeroCount = m - n
        let zeros = RealArray(repeating: 0, count: zeroCount)
        return cat(x, zeros)
    }
    return x
}

/// Pad complex array with zeros.
/// - Parameters:
///   - x: Input array.
///   - m: Length.
/// - Returns: Array padded to length m.
public func paddata(_ x: ComplexArray, length m: Int) -> ComplexArray {
    let n = x.count
    if m > n {
        let zeroCount = m - n
        let zeros = ComplexArray(count: zeroCount)
        return cat(x, zeros)
    }
    return x
}

/// Repeat a real number.
/// - Parameters:
///   - x: A real number.
///   - n: Number of repetitions.
/// - Returns: Repeated array.
public func repelem(_ x: Real, _ n: Int) -> RealArray {
    let xarray = [x]
    guard n > 1 else {
        return xarray
    }

    var y = xarray
    for _ in 2...n {
        y.append(contentsOf: xarray)
    }
    return y
}

/// Repeat a real array.
/// - Parameters:
///   - x: A real array.
///   - n: Number of repetitions.
/// - Returns: Repeated array.
public func repelem(_ x: RealArray, _ n: Int) -> RealArray {
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
/// - Returns: Array of new length.
public func resize(_ x: RealArray, length m: Int) -> RealArray {
    let n = x.count
    guard m != n else { return x }
    var y = x
    if m < n {
        return x[0..<m]
    } else {
        let zeroCount = m - n
        let zeros = RealArray(repeating: 0, count: zeroCount)
        y.append(contentsOf: zeros)
    }
    return y
}

/// Trim data by removing elements.
/// - Parameters:
///   - x: Real array.
///   - m: New size.
/// - Returns: Trimmed array.
public func trimdata(_ x: RealArray, length m: Int) -> RealArray {
    let n = x.count
    if m < n {
        return x[0..<m]
    }
    return x
}

/// Create an array of zeros.
/// - Parameter count: Number of elements in the array.
/// - Returns: A real array of length `count`.
public func zeros(_ count: Int) -> RealArray {
    return RealArray(repeating: 0, count: count)
}

/// Create an array of zeros.
/// - Parameter count: Number of elements in the array.
/// - Returns: A real array of length `count`.
public func zeros(_ count: Real) -> RealArray {
    return RealArray(repeating: 0, count: Int(count))
}

/// Fills a real array with zeros in place.
/// - Parameters:
///   - c: Array.
public func clear(_ c: RealArray) {
    vectorClearRealArray(c)
}
