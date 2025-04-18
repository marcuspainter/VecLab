//
//  ComplexDouble+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 18/04/2025.
//

/// Complex power.
extension ComplexDouble {
    
    /// Power.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: Complex, _ b: Complex) -> Complex {
        return pow(a, b)
    }
    
    /// Complex Power.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Integer.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: Complex, _ b: Int) -> Complex {
        return pow(a, b)
    }

    /// Complex Power.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: Complex, _ b: Double) -> Complex {
        return pow(a, b)
    }
    
    /// Complex Power.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: Double, _ b: Complex) -> Complex {
        return pow(a, b)
    }
    
    /// Complex Power.
    /// - Parameters:
    ///   - a: Complex number.
    ///   - b: Real array.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: Complex, _ b: [Double]) -> ComplexArray {
        return pow(a, b)
    }
    
    /// Complex Power.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: [Double], _ b: Complex) -> ComplexArray {
        return pow(a, b)
    }
    

}
