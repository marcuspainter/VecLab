//
//  Complex+ExpressibleByIntegerLiteral.swift
//  VecLab
//
//  Created by Marcus Painter on 10/05/2025.
//

extension Complex: ExpressibleByIntegerLiteral {

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

struct Quack: SignedNumeric {
    typealias Magnitude = Double
    typealias IntegerLiteralType = Int

    var magnitude: Double { 0 }

    static func *= (lhs: inout Quack, rhs: Quack) {

    }

    init() {

    }

    init(integerLiteral: Int) {

    }

    static func - (lhs: Quack, rhs: Quack) -> Quack {
        Quack()
    }

    init?<T>(exactly source: T) where T: BinaryInteger {
    }

    static func * (lhs: Quack, rhs: Quack) -> Quack {
        Quack()
    }

    static func + (lhs: Quack, rhs: Quack) -> Quack {
        Quack()
    }

}
