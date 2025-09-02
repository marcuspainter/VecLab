//
//  ComplexDoubleArray+CustomDebugStringConvertible.swift
//  VecLab
//
//  Created by Marcus Painter on 11/05/2025.
//

extension ComplexDoubleArray: CustomDebugStringConvertible {

    public var debugDescription: String {
        var result = "ComplexDoubleArray(["
        for i in 0..<count {
            if i > 0 { result += ", " }
            if imag[i] >= 0 {
                result += "\(real[i])+\(imag[i])i"
            } else {
                result += "\(real[i])-\(abs(imag[i]))i"
            }
        }
        result += "])"
        return result
    }

}
