//
//  Double+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 18/04/2025.
//

import Accelerate
import Foundation

extension Double {
    
    /// Power.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Real number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: Double, _ b: Double) -> Double {
        return pow(a, b)
    }
    
    /// Power.
    /// - Parameters:
    ///   - a: Real number.
    ///   - b: Integer number.
    /// - Returns: Raises `a` to the power of `b`.
    @inlinable
    public static func ** (_ a: Double, _ b: Int) -> Double {
        return pow(a, b)
    }

    /// Power.
    /// - Parameters:
    ///   - a: Integer number.
    ///   - b: Real number.
    /// - Returns: Raises `a` to the power of `b`.
    public static func ** (_ a: Int, _ b: Double) -> Double {
        return pow(a, b)
    }
}
