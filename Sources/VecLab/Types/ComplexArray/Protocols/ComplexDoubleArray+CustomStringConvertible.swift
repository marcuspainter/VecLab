//
//  ComplexDoubleArray+CustomStringConvertible.swift
//  VecLab
//
//  Created by Marcus Painter on 11/05/2025.
//

extension ComplexDoubleArray: CustomStringConvertible {

    /// String of complex value
    public var description: String {
        var result = "["
        for i in 0..<count {
            if i > 0 { result += ", " }
            if imag[i] >= 0 {
                result += "\(real[i])+\(imag[i])i"
            } else {
                result += "\(real[i])-\(abs(imag[i]))i"
            }
        }
        result += "]"
        return result
    }
}
