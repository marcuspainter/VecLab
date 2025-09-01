//
//  DoubleArray+Init+sSized.swift
//  VecLab
//
//  Created by Marcus Painter on 02/09/2025.
//

public extension Array where Element == Double {
    /// Initalize an array with zeros with the size of another rray.
    /// - Parameter sized: Number of elements
    init(sized: [Double]) {
        self = [Element](repeating: 0, count: sized.count)
    }
}
