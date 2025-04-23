//
//  Complex.swift
//  VecLab
//
//  Created by Marcus Painter on 22/04/2025.
//

import Foundation

public struct ComplexNumber<T> where T: FloatingPoint {
    var real: T
    var imag: T

    // Zero initializer
    public init() {
        real = .zero
        imag = .zero
    }

    // Full initializer
    public init(_ real: T, _ imag: T) {
        self.real = real
        self.imag = imag
    }

    public static var i: Self {
        Self(.zero, 1)
    }

}

extension ComplexNumber: AdditiveArithmetic {
    public static var zero: Self {
        Self(.zero, .zero)
    }

    public static func + (lhs: Self, rhs: Self) -> Self {
        Self(lhs.real + rhs.real, lhs.imag + rhs.imag)
    }

    public static func - (lhs: Self, rhs: Self) -> Self {
        Self(lhs.real - rhs.real, lhs.imag - rhs.imag)
    }

    public static func += (lhs: inout Self, rhs: Self) {
        lhs = lhs + rhs
    }

    public static func -= (lhs: inout Self, rhs: Self) {
        lhs = lhs - rhs
    }
}

extension ComplexNumber: Numeric {

    public init?<Other>(exactly source: Other) where Other: BinaryInteger {
        self.init(T(source), 0)
    }

    public static func * (lhs: Self, rhs: Self) -> Self {
        Self(
            lhs.real * rhs.real - lhs.imag * rhs.imag,
            lhs.real * rhs.imag + lhs.imag * rhs.real
        )
    }

    public static func *= (lhs: inout Self, rhs: Self) {
        lhs = lhs * rhs
    }

    public var magnitude: T {
        (real * real + imag * imag).squareRoot()
    }
}

extension ComplexNumber: SignedNumeric {
    public static prefix func - (x: Self) -> Self {
        Self(-x.real, -x.imag)
    }
}

// Division
extension ComplexNumber {
    public static func / (lhs: Self, rhs: Self) -> Self {
        let denom = rhs.real * rhs.real + rhs.imag * rhs.imag
        return Self(
            (lhs.real * rhs.real + lhs.imag * rhs.imag) / denom,
            (lhs.imag * rhs.real - lhs.real * rhs.imag) / denom
        )
    }

    public static func /= (lhs: inout Self, rhs: Self) {
        lhs = lhs / rhs
    }
}

extension ComplexNumber: ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = T.IntegerLiteralType

    public init(integerLiteral value: IntegerLiteralType) {
        self.init(T(integerLiteral: value), .zero)
    }
}

extension ComplexNumber: Equatable {
    // Equatable
    public static func == (a: Self, b: Self) -> Bool {
        return a.real == b.real && a.imag == b.imag
    }
}

extension ComplexNumber: Hashable {
    // Hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(real)
        hasher.combine(imag)
    }
}

extension ComplexNumber: CustomStringConvertible {
  public var description: String {
    //guard isFinite else { return "inf" }
    return "(\(real), \(imag))"
  }
}

extension ComplexNumber: CustomDebugStringConvertible {
  public var debugDescription: String {
    "Complex<\(T.self)>(\(String(reflecting: real)), \(String(reflecting: imag)))"
  }
}

extension ComplexNumber {
    @available(*, renamed: "hello", message: "Integer literals are not supported. Use ComplexNumber(T(value), 0) instead.")
    public init?(integerLiteral value: Int) {
        fatalError("This initializer will never be called due to @available(unavailable)")
    }
}

/*
 1.    AdditiveArithmetic
 •    +, -, .zero
 2.    Numeric (inherits from AdditiveArithmetic)
 •    *, init?<U: BinaryInteger>(exactly:), magnitude
 3.    SignedNumeric (inherits from Numeric)
 •    - unary negation
 4.    BinaryInteger (for integer types)
 •    Integer division: /, %, etc.
 5.    FloatingPoint (for floating-point types like Float, Double)
 •    Floating-point division: /
 •    isNaN, isInfinite, .zero, .pi, .sqrt(), etc.

 */
