//
//  Complex+Math+Int.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

extension Complex {

    /// Complex integer addition.
    ///
    /// Allow complex initialization with integer`1 + 2.i`.Right-hand side only. No other integer operations are supported.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: The result of the division.
    public static func + (a: Int, b: Complex) -> Complex {
        return Double(a) + b
    }

}
