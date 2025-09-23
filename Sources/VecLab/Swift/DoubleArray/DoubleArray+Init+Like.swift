//
//  DoubleArray+Init+Like.swift
//  VecLab
//
//  Created by Marcus Painter on 02/09/2025.
//

extension Array where Element == Double {
    /// Initalize an array with zeros with the size of another array.
    /// - Parameter like: A collection with a count property.
    public init(like: any Collection) {
        self = [Element](repeating: 0, count: like.count)
    }
}
