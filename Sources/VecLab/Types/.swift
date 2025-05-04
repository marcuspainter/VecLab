//
//  ComplexDoubleArray+Power\.swift
//  VecLab
//
//  Created by Marcus Painter on 18/04/2025.
//

extension ComplexDoubleArray {
    
    /// Power
    /// - Parameters:
    ///   - a: Complex array
    ///   - b: Complex array
    /// - Returns: Raises `a` to the power of 'b'
    public static func ** (_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
        assertSameSize(a, b)
        return pow(a, b)
    }
    
    /// Complex Power.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: ComplexArray, _ b: Double) -> ComplexArray {
        assertSameSize(a)
        return pow(a, b)
    }

    /// Complex Power.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Complex array.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: Double, _ b: ComplexArray) -> ComplexArray {
        assertSameSize(b)
        return pow(a, b)
    }
    
    /// Complex Power.
    /// - Parameters:
    ///   - a: Complex array.
    ///   - b: Real array.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: ComplexArray, _ b: [Double]) -> ComplexArray {
        assertSameSize(a, b)
        return pow(a, b)
    }

    /// Power.
    /// - Parameters:
    ///   - a: Real array.
    ///   - b: Complex array.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: [Double], _ b: ComplexArray) -> ComplexArray {
        assertSameSize(a, b)
        return pow(a, b)
    }
    
}
