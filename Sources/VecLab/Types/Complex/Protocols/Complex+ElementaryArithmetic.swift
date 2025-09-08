//
//  Complex+ElementaryArithmetic.swift
//  VecLab
//
//  Created by Marcus Painter on 10/05/2025.
//

extension Complex: ElementaryArithmetic {

    /// Complex division.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the division.
    public static func / (a: Complex, b: Complex) -> Complex {
        return complexDivide(a, b)
    }
}
