//
//  ComplexDouble.swift
//  PhaseMeter
//
//  Created by Marcus Painter on 08/04/2025.
//

/// Complex number
public struct ComplexDouble:
        Equatable,
        Hashable,
        Codable,
        CustomStringConvertible,
        Sendable {
    
    /// Real part.
    public var real: Double
    
    /// Imaginary part.
    public var imag: Double
    
    /// Initialize a complex number with zero.
    public init() {
        self.real = 0
        self.imag = 0
    }
    
    /// Initialize a complex number.
    /// - Parameters:
    ///   - real: Real part.
    ///   - imag: Imaginary part.
    public init(_ real: Double, _ imag: Double) {
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
