//
//  Array+Init+Count.swift
//
//  Created by Marcus Painter on 05/09/2023.
//

import Foundation

public extension Array where Element == Real {
    /// Initalize an array with zeros.
    /// - Parameter count: Number of elements
    init(count: Int) {
        self = [Element](repeating: 0, count: count)
    }
}
