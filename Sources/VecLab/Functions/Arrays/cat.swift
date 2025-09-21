//
//  cat.swift
//
//
//  Created by Marcus Painter on 14/09/2023.
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
