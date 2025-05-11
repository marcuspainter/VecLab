//
//  ComplexDoubleArray+ExpressibleByArrayLiteral.swift
//  VecLab
//
//  Created by Marcus Painter on 11/05/2025.
//

extension ComplexDoubleArray: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = ComplexDouble

    /// Initialize a complex array from complex numbers.
    /// - Parameter elements: Literal array of complex numbers.
    public init(arrayLiteral elements: ComplexDouble...) {
        self.init(elements)
    }
}
