//
//  ComplexDoubleArray+Math+Unary.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Accelerate

/// Complex unary
extension ComplexDoubleArray {
    /// Unary minus.
    /// - Parameter a: Complex array.
    /// - Returns: The result of -a.
    // public static prefix func - (a: ComplexDoubleArray) -> ComplexDoubleArray {
    //    let real = vDSP.negative(a.real)
    //    let imag = vDSP.negative(a.imag)
    //    return ComplexDoubleArray(real, imag)
   // }

    public static prefix func - (a: ComplexDoubleArray) -> ComplexDoubleArray {
        var c = ComplexDoubleArray(count: a.count)
        ComplexDoubleArray.withUnsafeParameters(a, &c) { A, C, N in
            vDSP_zvnegD(A, 1, C, 1, N)
        }
        return c
    }
}
