//
//  Matrix+ExpressibleByIntegerLiteral.swift
//  VecLab
//
//  Created by Marcus Painter on 15/09/2025.
//

extension ComplexMatrix: ExpressibleByArrayLiteral {
    //public typealias ArrayLiteralElement = [Double]

    public init(arrayLiteral elements: [Complex]...) {
        // Create matrix from rows
        self.init(elements)  // Uses [[Complex]] initializer
    }
}
