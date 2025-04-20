//
//  DoubleArray+operators.swift
//  VecLab
//
//  Created by Marcus Painter on 16/04/2025.
//

public extension Array where Element == Double {
    /// Mathematical addition of `Double` array.
    ///
    /// - Warning: This does not append arrays.
    ///  Use the `append()` or `cat()` functions.
    static func += (lhs: inout [Double], rhs: [Double]) {
        lhs = lhs + rhs
    }
}
