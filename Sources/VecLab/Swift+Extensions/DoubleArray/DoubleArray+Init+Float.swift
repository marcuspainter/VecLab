//
//  DoubleArray+Init+Float.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import Foundation
import Accelerate

public extension Array where Element == Double {
    /// Initalize an array with a float array.
    /// - Parameter array: Float array.
    init(float array: [Float]) {
        self = array.map { Double($0) }
    }
}
