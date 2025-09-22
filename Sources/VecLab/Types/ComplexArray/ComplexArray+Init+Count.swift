//
//  Array+Complex.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

extension Array where Element == Complex {

    public init(count: Int) {
        self = Array(repeating: .zero, count: count)
    }
}
