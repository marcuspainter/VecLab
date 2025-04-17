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
    return x.filter { predicate($0) }
}
