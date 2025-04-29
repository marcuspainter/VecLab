//
//  ComplexDoubleArray+Math+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

/// Complex power.
extension ComplexDoubleArray {
    /// Power.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex array.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: ComplexDoubleArray, _ b: ComplexDoubleArray) -> ComplexDoubleArray {
        return pow(a, b)
    }

    /// Power.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: ComplexDoubleArray, _ b: ComplexDouble) -> ComplexDoubleArray {
        return a.map { pow($0, b) }
    }

    /// Power.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: ComplexDouble, _ b: ComplexDoubleArray) -> ComplexDoubleArray {
        return b.map { pow(a, $0) }
    }

    /// Power.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: ComplexDoubleArray, _ b: Double) -> ComplexDoubleArray {
        return pow(a, b)
    }

    /// Power.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: Double, _ b: ComplexDoubleArray) -> ComplexDoubleArray {
        return pow(a, b)
    }

    /// Power.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real array.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: ComplexDoubleArray, _ b: [Double]) -> ComplexDoubleArray {
        return pow(a, b)
    }

    /// Power.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: [Double], _ b: ComplexDoubleArray) -> ComplexDoubleArray {
        return pow(a, b)
    }
}
