//
//  DoubleArray+operators.swift
//  VecLab
//
//  Created by Marcus Painter on 16/04/2025.
//

public extension Array where Element == Double {
    
    // Defined elsewhere with other operators
    // public static func + (a: [Double], b: [Double]) -> [Double]
    
    /// Mathematical addition.
    ///
    ///- Note: This overrides the default Swift `Array` behaviour does not append arrays.
    ///  Use the `append()` or `cat()` functions.
    /// - Parameters:
    ///   - lhs:Array.
    ///   - rhs:Array.
    static func += (lhs: inout [Double], rhs: [Double]) {
        lhs = lhs + rhs
    }
}
