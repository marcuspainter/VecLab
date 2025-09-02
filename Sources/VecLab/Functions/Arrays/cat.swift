//
//  cat.swift
//
//
//  Created by Marcus Painter on 14/09/2023.
//

import Foundation

import Accelerate

/// Concatenate arrays.
///
/// - Parameter arrays: List of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: RealArray...) -> RealArray {
    let totalCount = arrays.reduce(0) { $0 + $1.count }

    return RealArray(unsafeUninitializedCapacity: totalCount) { buffer, initializedCount in
        var index = 0
        for array in arrays {
            let n = Int32(array.count)
            let destinationOffsetPtr = buffer.baseAddress!.advanced(by: index)

            // Get a read-only pointer to the source array's elements
            array.withUnsafeBufferPointer { sourceBuffer in
                guard let sourceBaseAddress = sourceBuffer.baseAddress else { return }

                // Direct vector copy
                cblas_dcopy(__LAPACK_int(n), sourceBaseAddress, 1, destinationOffsetPtr, 1)
            }

            index += array.count
        }
        initializedCount = totalCount
    }
}

/// Concatenate arrays.
///
/// - Parameter arrays: List of arrays.
/// - Returns: A single combined array.
func cat2(_ arrays: RealArray...) -> RealArray {
    let totalCount = arrays.reduce(0) { $0 + $1.count }
    var newArray = RealArray()
    newArray.reserveCapacity(totalCount)
    for array in arrays {
        newArray.append(contentsOf: array)
    }
    return newArray
}

/// Concatenate arrays.
///
/// - Parameter arrays: Array of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: [RealArray]) -> RealArray {
    let totalCount = arrays.reduce(0) { $0 + $1.count }
    var newArray = RealArray()
    newArray.reserveCapacity(totalCount)
    for array in arrays {
        newArray.append(contentsOf: array)
    }
    return newArray
}

/// Concatenate arrays.
///
/// - Parameter arrays: List of arrays.
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

/// Concatenate arrays.
///
/// - Parameter arrays: Array of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: [ComplexArray]) -> ComplexArray {
    let totalCount = arrays.reduce(0) { $0 + $1.count }
    var newArray = ComplexArray()
    newArray.reserveCapacity(totalCount)
    for array in arrays {
        newArray.append(contentsOf: array)
    }
    return newArray
}
