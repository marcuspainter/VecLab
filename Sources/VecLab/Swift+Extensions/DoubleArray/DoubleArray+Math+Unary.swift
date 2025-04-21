//
//  DoubleArray+Math+Unary.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

extension Array where Element == Double {

    /// Unary minus.
    /// - Parameter a: Real array.
    /// - Returns: The result of -a
    public static prefix func - (a: [Double]) -> [Double] {
        return vDSP.negative(a)
    }
}
