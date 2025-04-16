//
//  ComplexDouble 2.swift
//  VecLab
//
//  Created by Marcus Painter on 09/04/2025.
//

/// Complex number
public struct ComplexFloat: Equatable, Hashable, Codable, CustomStringConvertible, Sendable {
    
    /// Real part.
    public var real: Float
    // Imaginary part.
    public var imag: Float
    
    /// Initialize a complex number with zero.
    public init() {
        self.real = 0
        self.imag = 0
    }
    
    /// Initialize a complex number.
    /// - Parameters:
    ///   - real: Real part.
    ///   - imag: Imaginary part.
    public init(_ real: Float, _ imag: Float) {
        self.real = real
        self.imag = imag
    }

    /// String of complex value.
    public var description: String {
        if imag >= 0 {
            return "\(real) + \(imag)i"
        } else {
            return "\(real) - \(abs(imag))i"
        }
    }
}
