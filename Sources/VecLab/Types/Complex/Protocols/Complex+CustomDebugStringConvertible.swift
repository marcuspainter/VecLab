//
//  Complex+CustomDebugStringConvertible.swift
//  VecLab
//
//  Created by Marcus Painter on 10/05/2025.
//

extension Complex: CustomDebugStringConvertible {

    /// Provides a more detailed debug representation of the complex number.
    public var debugDescription: String {
        return "Complex(\(real), \(imag))"

    }

}
