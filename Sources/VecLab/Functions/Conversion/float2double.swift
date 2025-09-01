//
//  f2d.swift
//
//
//  Created by Marcus Painter on 26/08/2024.
//

import Accelerate

/// Converts a single-precision array to a double-precision array.
/// - Parameter floatArray: A  Float array.
/// - Returns: A Double array.
func float2double(_ floatArray: [Float]) -> [Double] {
    guard !floatArray.isEmpty else {
        return []
    }
    
    return Array(unsafeUninitializedCapacity: floatArray.count) { buffer, initializedCount in
        floatArray.withUnsafeBufferPointer { src in
            vDSP_vspdp(src.baseAddress!, 1,
                       buffer.baseAddress!, 1,
                       vDSP_Length(floatArray.count))
        }
        initializedCount = floatArray.count
    }
}

@available(*, unavailable, renamed: "double2float", message: "[Float] to [Double] conversion.")
public func f2d(_ f: [Float]) -> [Double] {
    return []
}




