//
//  circshift.swift
//
//
//  Created by Marcus Painter on 11/09/2023.
//

import Accelerate

/// Circularly shift array.
/// - Parameters:
///   - x: Input array.
///   - k: Shift amount.
/// - Returns: Circularly shifted array
public func circshift(_ x: RealArray, _ k: Int) -> RealArray {
    let n = x.count
    if n == 0 { return x } // Edge case: empty array
    
    let shift = ((k % n) + n) % n
    if shift == 0 { return x } // Edge case: no effective shift
    
    // Create output array
    var result = RealArray(repeating: 0.0, count: n)
    
    // Use vDSP for efficient memory operations
    x.withUnsafeBufferPointer { xPtr in
        result.withUnsafeMutableBufferPointer { resultPtr in
            let basePtr = xPtr.baseAddress!
            let resultBasePtr = resultPtr.baseAddress!
            
            // Copy last 'shift' elements to the beginning
            vDSP_mmovD(basePtr + (n - shift),
                     resultBasePtr,
                     vDSP_Length(shift),
                     vDSP_Length(1),
                     vDSP_Length(1),
                     vDSP_Length(1))
            
            // Copy first 'n-shift' elements after the shifted portion
            vDSP_mmovD(basePtr,
                     resultBasePtr + shift,
                     vDSP_Length(n - shift),
                     vDSP_Length(1),
                     vDSP_Length(1),
                     vDSP_Length(1))
        }
    }
    
    return result
}

/// Circularly shift complex array.
/// - Parameters:
///   - x: Complex array.
///   - k: Shift amount.
/// - Returns: Circularly shifted array
public func circshift(_ x: ComplexArray, _ k: Int) -> ComplexArray {
    validateSize(x)
    let real = circshift(x.real, k)
    let imag = circshift(x.imag, k)
    return ComplexArray(real, imag)
}
