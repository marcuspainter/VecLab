//
//  FloatArray+Init+Double.swift
//  VecLab
//
//  Created by Marcus Painter on 31/08/2025.
//

import Accelerate

/*
public extension Array where Element == Float {
    /// Initialize a Float array with a Double array.
    /// - Parameter array: Double  array.
    init(double array: [Double]) {
        self = array.map { Float($0) }
    }
}
*/

public extension Array where Element == Float {
    /// Initialize  Float array from Double array.
    /// - Parameter doubles: Double array.
    init(doubles: [Double]) {
        self = .init(repeating: 0.0, count: doubles.count)
        self.withUnsafeMutableBufferPointer { dst in
            doubles.withUnsafeBufferPointer { src in
                vDSP_vdpsp(src.baseAddress!, 1,
                           dst.baseAddress!, 1,
                           vDSP_Length(doubles.count))
            }
        }
    }
}
