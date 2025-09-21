//
//  gradient.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Accelerate

public func gradient(_ x: RealArray) -> RealArray {
    guard !x.isEmpty else { return [] }

    // Handle single element case - MATLAB returns [0]
    guard x.count > 1 else { return [Real(0)] }

    var result = [Real](repeating: Real(0), count: x.count)

    // For the first element - forward difference
    result[0] = x[1] - x[0]

    // For the last element - backward difference
    result[x.count - 1] = x[x.count - 1] - x[x.count - 2]

    // For elements in between - use vDSP for central difference
    if x.count > 2 {
        x.withUnsafeBufferPointer { xPtr in
            result.withUnsafeMutableBufferPointer { resultPtr in
                // Compute (x[i+1] - x[i-1]) for i = 1...(count-2)
                vDSP_vsubD(
                    xPtr.baseAddress!,  // A: x[0], x[1], x[2], ...
                    1,  // stride for A
                    xPtr.baseAddress!.advanced(by: 2),  // B: x[2], x[3], x[4], ...
                    1,  // stride for B
                    resultPtr.baseAddress!.advanced(by: 1),  // C: result[1], result[2], ...
                    1,  // stride for C
                    vDSP_Length(x.count - 2)  // number of operations
                )

                // Multiply by 0.5 for central difference
                var halfValue = Real(0.5)
                vDSP_vsmulD(
                    resultPtr.baseAddress!.advanced(by: 1),  // input: result[1] onwards
                    1,  // stride
                    &halfValue,  // scalar 0.5
                    resultPtr.baseAddress!.advanced(by: 1),  // output: result[1] onwards
                    1,  // stride
                    vDSP_Length(x.count - 2)  // number of operations
                )
            }
        }
    }

    return result
}

/*
/// Numerical gradient.
/// - Parameter x: Input array.
/// - Returns: The numerical gradient.
func gradient2(_ x: RealArray) -> RealArray {
    guard !x.isEmpty else { return [] }

    var result = [Real](repeating: Real(0), count: x.count)

    // For the first element
    result[0] = x[1] - x[0]

    // For elements in between
    for i in 1..<x.count - 1 {
        result[i] = (x[i + 1] - x[i - 1]) * 0.5
    }

    // For the last element
    result[x.count - 1] = x[x.count - 1] - x[x.count - 2]

    return result
}
*/
