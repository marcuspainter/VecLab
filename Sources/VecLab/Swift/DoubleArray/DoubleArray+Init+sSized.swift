//
//  DoubleArray+Init+sSized.swift
//  VecLab
//
//  Created by Marcus Painter on 02/09/2025.
//

public extension Array where Element == Double {
    /// Initalize an array with zeros with the size of another array.
    /// - Parameter sized: A collection with a count property.
    init(sized: any Collection) {
        self = [Element](repeating: 0, count: sized.count)
    }
}
