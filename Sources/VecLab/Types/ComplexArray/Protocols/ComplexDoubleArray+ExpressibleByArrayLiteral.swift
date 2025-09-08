//
//  ComplexArray+ExpressibleByArrayLiteral.swift
//  VecLab
//
//  Created by Marcus Painter on 11/05/2025.
//

extension ComplexArray: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Complex

    /// Initialize a complex array from complex numbers.
    /// - Parameter elements: Literal array of complex numbers.
    public init(arrayLiteral elements: Complex...) {
        self.init(elements)
    }
}
