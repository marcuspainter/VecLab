//
//  DoubleArray+Init+Float.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

/*
 public extension Array where Element == Double {
     /// Initialize an array with a float array.
     /// - Parameter array: Float array.
     init(float array: [Float]) {
         self = array.map { Double($0) }
     }
 }
*/

public extension Array where Element == Double {
    /// Initialize  Double array from Float array.
    /// - Parameter floats: Float array.
    init(floats: [Float]) {
        self = .init(repeating: 0.0, count: floats.count)
        withUnsafeMutableBufferPointer { dst in
            floats.withUnsafeBufferPointer { src in
                vDSP_vspdp(src.baseAddress!, 1,
                           dst.baseAddress!, 1,
                           vDSP_Length(floats.count))
            }
        }
    }
}
