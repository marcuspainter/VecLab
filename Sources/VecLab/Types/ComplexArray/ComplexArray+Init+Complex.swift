//
//  ComplexArray+Init+Complex.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

extension Array where Element == Complex {

    public init(real: [Double], imag: [Double]) {
        precondition(real.count == imag.count, "Lengths must match")
        self = .init(unsafeUninitializedCapacity: real.count) { buffer, initializedCount in
            for i in 0..<real.count {
                buffer[i].real = real[i]
                buffer[i].imag = imag[i]
            }
            initializedCount = real.count
        }
    }
}
