//
//  d2f.swift
//
//
//  Created by Marcus Painter on 26/08/2024.
//

import Accelerate

/// Converts a double-precision array to a single-precision array.
/// - Parameter doubleArray: A Double array.
/// - Returns: A Float array.
public func double2float(_ doubleArray: [Double]) -> [Float] {
    guard !doubleArray.isEmpty else {
        return []
    }
    
    return Array(unsafeUninitializedCapacity: doubleArray.count) { buffer, initializedCount in
        doubleArray.withUnsafeBufferPointer { src in
            vDSP_vdpsp(src.baseAddress!, 1,
                       buffer.baseAddress!, 1,
                       vDSP_Length(doubleArray.count))
        }
        initializedCount = doubleArray.count
    }
}

@available(*, unavailable, renamed: "double2float", message: "[Double] to [Float] conversion.")
public func d2f(_ d: [Double]) -> [Float] {
    return []
}



