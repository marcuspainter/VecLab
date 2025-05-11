//
//  ComplexDouble+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 18/04/2025.
//

//
// Complex power.
//

extension ComplexDouble {

    /// Power.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: ComplexDouble, _ b: Complex) -> ComplexDouble {
        return pow(a, b)
    }

    /// Complex Power.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Integer.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: ComplexDouble, _ b: Int) -> ComplexDouble {
        return pow(a, b)
    }

    /// Complex Power.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: ComplexDouble, _ b: Double) -> ComplexDouble {
        return pow(a, b)
    }

    /// Complex Power.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: Double, _ b: ComplexDouble) -> ComplexDouble {
        return pow(a, b)
    }

    /// Complex Power.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real array.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: ComplexDouble, _ b: [Double]) -> ComplexDoubleArray {
        return pow(a, b)
    }

    /// Complex Power.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: [Double], _ b: ComplexDouble) -> ComplexDoubleArray {
        return pow(a, b)
    }

}
