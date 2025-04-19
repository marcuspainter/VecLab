//
//  Int+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 18/04/2025.
//

extension Int {

    /// Power.
    /// - Parameters:
    ///   - a: Integer number.
    ///   - b: Integer number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: Int, _ b: Int) -> Double {
        return pow(a, b)
    }
}
