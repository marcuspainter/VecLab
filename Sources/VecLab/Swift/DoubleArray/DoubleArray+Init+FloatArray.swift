//
//  DoubleArray+Init+FloatArray.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

extension Array where Element == Double {
    /// Initialize  a Double array from a Float array.
    /// - Parameter floatArray: Float array.
    public init(floatArray: [Float]) {
        guard !floatArray.isEmpty else {
            self = []
            return
        }

        self = Array(unsafeUninitializedCapacity: floatArray.count) { buffer, initializedCount in
            floatArray.withUnsafeBufferPointer { src in
                vDSP_vspdp(
                    src.baseAddress!,
                    1,
                    buffer.baseAddress!,
                    1,
                    vDSP_Length(floatArray.count)
                )
            }
            initializedCount = floatArray.count
        }
    }
}

/*
 public extension Array where Element == Double {
     /// Initialize an array with a float array.
     /// - Parameter floatArray: Float array.
     init(floatArray: [Float]) {
         self = floatArray.map { Double($0) }
     }
 }
*/
