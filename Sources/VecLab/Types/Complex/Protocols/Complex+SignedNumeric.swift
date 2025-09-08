//
//  Complex+SignedNumeric.swift
//  VecLab
//
//  Created by Marcus Painter on 10/05/2025.
//

extension Complex: SignedNumeric {
    public typealias IntegerLiteralType = Double.IntegerLiteralType

    /// Unary minus.
    /// - Parameter a: Complex number.
    /// - Returns: The result of -a.
    @inlinable
    public static prefix func - (a: Complex) -> Complex {
        return Complex(-a.real, -a.imag)
    }

    /// Replaces this value with its additive inverse.
    mutating public func negate() {
        self.real = -self.real
        self.imag = -self.imag
    }

}
