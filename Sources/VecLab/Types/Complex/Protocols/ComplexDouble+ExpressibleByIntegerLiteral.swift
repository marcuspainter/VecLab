//
//  ComplexDouble+ExpressibleByIntegerLiteral.swift
//  VecLab
//
//  Created by Marcus Painter on 10/05/2025.
//

extension ComplexDouble: ExpressibleByIntegerLiteral {

    /// Initialize from an integer literal.
    /// - Parameter value: Integer literal.
    public init(integerLiteral value: Double.IntegerLiteralType) {
        self.init(Double(value), .zero)
    }

    /// Initialize from a binary integer literal.
    /// - Parameter source: Source.
    public init?<T>(exactly source: T) where T: BinaryInteger {
        self.init(Double(source), .zero)
   }

}
