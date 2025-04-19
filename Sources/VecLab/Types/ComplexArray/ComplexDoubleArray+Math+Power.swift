//
//  ComplexDoubleArray+<ath+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

/// Complex power.
extension ComplexDoubleArray {
    
    /// Power.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: ComplexDoubleArray, _ b: ComplexDoubleArray) -> ComplexDoubleArray {
        return pow(a, b)
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
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: ComplexDoubleArray, _ b: [Double]) -> ComplexDoubleArray {
        return pow(a, b)
    }
    
    /// Power.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: [Double], _ b: ComplexDoubleArray) -> ComplexDoubleArray {
        return pow(a, b)
    }
    
}
