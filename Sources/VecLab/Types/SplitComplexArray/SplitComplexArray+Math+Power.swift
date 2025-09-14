//
//  SplitComplexArray+Math+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

/// Complex power.
extension SplitComplexArray {
    /// Power.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex array.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: SplitComplexArray, _ b: SplitComplexArray) -> SplitComplexArray {
        return pow(a, b)
    }

    /// Power.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: SplitComplexArray, _ b: Complex) -> SplitComplexArray {
        return a.map { pow($0, b) }
    }

    /// Power.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: Complex, _ b: SplitComplexArray) -> SplitComplexArray {
        return b.map { pow(a, $0) }
    }

    /// Power.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: SplitComplexArray, _ b: Double) -> SplitComplexArray {
        return pow(a, b)
    }

    /// Power.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: Double, _ b: SplitComplexArray) -> SplitComplexArray {
        return pow(a, b)
    }

    /// Power.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real array.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: SplitComplexArray, _ b: [Double]) -> SplitComplexArray {
        return pow(a, b)
    }

    /// Power.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: [Double], _ b: SplitComplexArray) -> SplitComplexArray {
        return pow(a, b)
    }
}
