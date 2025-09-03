//
//  FloatArray+Init+DoubleArray.swift
//  VecLab
//
//  Created by Marcus Painter on 31/08/2025.
//

import Accelerate

extension Array where Element == Float {
    /// Initialize  a Float array from a Double array.
    /// - Parameter doubleArray: Double array.
    public init(doubleArray: [Double]) {
        guard !doubleArray.isEmpty else {
            self = []
            return
        }

        self = Array(unsafeUninitializedCapacity: doubleArray.count) { buffer, initializedCount in
            doubleArray.withUnsafeBufferPointer { src in
                vDSP_vdpsp(
                    src.baseAddress!,
                    1,
                    buffer.baseAddress!,
                    1,
                    vDSP_Length(doubleArray.count)
                )
            }
            initializedCount = doubleArray.count
        }
    }
}

/*
public extension Array where Element == Float {
    /// Initialize a Float array with a Double array.
    /// - Parameter doubleArray: Double  array.
    init(doubleArray: [Double]) {
        self = doubleArray.map { Float($0) }
    }
}
*/
