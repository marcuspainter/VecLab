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
    var result: ComplexArray = ([], [])
    for k in 0 ..< x.0.count {
        let z = (x.0[k], x.1[k])
        if predicate(z) {
            result.0.append(z.0)
            result.1.append(z.1)
        }
    }
    return result
}

/*
 
 b = [1,2,3]
 a = a[b]
 
 a[b] = b
 
 a = getindex(a, indices)
 
 a = setindex(a, indices, b)
 
 */

func getindex(a: RealArray, indices: Real) -> RealArray {
    return []
}

func getindex(a: RealArray, indices: RealArray) -> RealArray {
    return []
}

func settindex(a: RealArray, indices: Real, b: Real) -> RealArray {
    return []
}

func setindex(a: RealArray, indices: RealArray, b: RealArray) -> RealArray {
    return []
}
