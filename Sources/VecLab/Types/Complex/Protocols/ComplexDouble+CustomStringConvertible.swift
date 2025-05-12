//
//  ComplexDouble+CustomStringConvertible.swift
//  VecLab
//
//  Created by Marcus Painter on 10/05/2025.
//

extension ComplexDouble: CustomStringConvertible {
    
    /// String of complex value.
    public var description: String {
        if imag >= 0 {
            return "\(real)+\(imag)i"
        } else {
            return "\(real)-\(abs(imag))i"
        }
    }
}
