//
//  find.swift
//  VecLab
//
//  Created by Marcus Painter on 08/03/2025.
//

public func find(_ x: RealArray, predicate: (Real) -> Bool) -> RealArray {
    return x.filter { predicate($0) }
}

public func find(_ x: ComplexArray, predicate: (Complex) -> Bool) -> ComplexArray {
    var result = ComplexArray()
    for k in 0 ..< x.count {
        let z = Complex(x.real[k], x.imag[k])
        if predicate(z) {
            result.real.append(z.real)
            result.imag.append(z.imag)
        }
    }
    return result
}
