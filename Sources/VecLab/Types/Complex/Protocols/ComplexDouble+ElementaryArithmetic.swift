//
//  ComplexDouble+ElementaryArithmetic.swift
//  VecLab
//
//  Created by Marcus Painter on 10/05/2025.
//

extension ComplexDouble: ElementaryArithmetic {
    
    /// Complex division.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the division.
    public static func / (a: ComplexDouble, b: ComplexDouble) -> ComplexDouble {
        return complexDivide(a, b)
    }
}
