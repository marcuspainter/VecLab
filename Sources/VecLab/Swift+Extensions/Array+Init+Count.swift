//
//  Array+Init+Count.swift
//
//  Created by Marcus Painter on 05/09/2023.
//

import Foundation

public extension Array where Element == Double {

    /// Initalize an array with zeros.
    /// - Parameter count: Number of elements
    init(count: Int) {
        self = RealDoubleArray(repeating: Double(0), count: count)
    }
}

public extension Array where Element == Float {

    /// Initalize an array with zeros.
    /// - Parameter count: Number of elements
    init(count: Int) {
        self = RealFloatArray(repeating: Float(0), count: count)
    }
}
