//
//  Matrix+ExpressibleByIntegerLiteral.swift
//  VecLab
//
//  Created by Marcus Painter on 15/09/2025.
//

extension Matrix: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = [Double]

    public init(arrayLiteral elements: [Double]...) {
        // Create matrix from rows
        self.init(elements)  // Uses [[Double]] initializer
    }
}
