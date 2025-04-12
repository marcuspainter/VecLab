//
//  ComplexDouble 2.swift
//  VecLab
//
//  Created by Marcus Painter on 09/04/2025.
//

//
//  ComplexDouble.swift
//  PhaseMeter
//
//  Created by Marcus Painter on 08/04/2025.
//

/// Complex number
public struct ComplexFloat {

    var real: Float
    var imag: Float

    /// Initialize a complex number with zero.
    public init() {
        self.real = 0.0
        self.imag = 0.0
    }

    /// Initialize a complex number with real and imaginary parts.
    /// - Parameters:
    ///   - real: Real part.
    ///   - imag: Imaginary part.
    public init(_ real: Float, _ imag: Float) {
        self.real = real
        self.imag = imag
    }
}

extension ComplexFloat: CustomStringConvertible {

    /// Text of complex number.
    public var description: String {
        return "(\(real) \(imag)i)"
    }
}

extension ComplexFloat: Equatable {

    /// Tests for equality.
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    /// - Returns: Returns a Boolean value indicating whether two values are equal.
    static public func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.real == rhs.real && lhs.imag == rhs.imag
    }
}
