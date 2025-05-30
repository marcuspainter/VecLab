//
//  ComplexDouble.swift
//  PhaseMeter
//
//  Created by Marcus Painter on 08/04/2025.
//

import Foundation

/// Complex number
public struct ComplexDouble:
    Equatable,  // Synthesized
    Hashable,   // Synthesized
    Codable,
    //CustomStringConvertible,
    //CustomDebugStringConvertible,
    //SignedNumeric,
    Sendable {
    
    /// Real part.
    public var real: Double

    /// Imaginary part.
    public var imag: Double

    /// Initialize a complex number with zero.
    public init() {
        real = 0
        imag = 0
    }

    /// Initialize a complex number.
    /// - Parameters:
    ///   - real: Real part.
    ///   - imag: Imaginary part.
    public init(_ real: Double, _ imag: Double) {
        self.real = real
        self.imag = imag
    }
}

