//
//  SplitComplexArray+Equatable.swift
//  VecLab
//
//  Created by Marcus Painter on 11/05/2025.
//

extension SplitComplexArray: Equatable {

    /// Compares for equality.
    /// - Parameters:
    ///   - lhs: A complex array.
    ///   - rhs: Another complex array.
    /// - Returns: True or false.
    public static func == (lhs: SplitComplexArray, rhs: SplitComplexArray) -> Bool {
        return lhs.real == rhs.real && lhs.imag == rhs.imag
    }

}
