//
//  ComplexArray+Math+Unary.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

extension ComplexArray {
    /// Unary minus.
    /// - Parameter a: Complex array.
    /// - Returns: The result of -a.
    public static prefix func - (a: ComplexArray) -> ComplexArray {
        var c = ComplexArray(count: a.count)
        ComplexArray.withUnsafeParameters(a, &c) { A, C, N in
            vDSP_zvnegD(A, 1, C, 1, N)
        }
        return c
    }
}
