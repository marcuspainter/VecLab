//
//  ComplexDouble+Math+.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

/// Complex unary
extension ComplexDouble {
    /// Unary minus.
    /// - Parameter a: Complex number.
    /// - Returns: The result of -a.
    public static prefix func - (a: Complex) -> Complex {
        return Complex(-a.real, -a.imag)
    }
}
