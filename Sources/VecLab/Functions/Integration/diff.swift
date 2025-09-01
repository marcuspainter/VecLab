//
//  diff.swift
//
//
//  Created by Marcus Painter on 03/09/2023.
//

import Accelerate

/// Differences and approximate derivatives.
///
/// - Note: The length of the returned array is (length - 1).
/// - Parameter x: Input array.
/// - Returns: Difference between elements as an array of (length - 1).
public func diff(_ x: RealArray) -> RealArray {
    guard x.count > 1 else { return [] }
    
    var result = RealArray(repeating: 0, count: x.count - 1)
    
    // Use vDSP_vsubD to compute x[1:] - x[0:-1]
    // vDSP_vsubD(A, strideA, B, strideB, C, strideC, N)
    // Computes C[i] = B[i] - A[i]
    x.withUnsafeBufferPointer { xPtr in
        result.withUnsafeMutableBufferPointer { resultPtr in
            vDSP_vsubD(
                xPtr.baseAddress!,           // A: starting from x[0]
                1,                          // stride for A
                xPtr.baseAddress!.advanced(by: 1),      // B: starting from x[1]
                1,                          // stride for B
                resultPtr.baseAddress!,     // C: output array
                1,                          // stride for C
                vDSP_Length(x.count - 1)   // number of operations
            )
        }
    }
    
    return result
}

/// Differences and approximate derivatives.
///
/// - Note: The length of the returned array is (length - 1).
/// - Parameter x: Input array.
/// - Returns: Difference between elements as an array of (length - 1).
func diff2(_ x: RealArray) -> RealArray {
    guard x.count > 1 else { return [] }

    var result = RealArray(repeating: 0, count: x.count - 1)
    for i in 1 ..< x.count {
        result[i-1] = (x[i] - x[i - 1])
    }
    return result
}
