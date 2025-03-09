//
//  gamma.swift
//  VecLab
//
//  Created by Marcus Painter on 08/03/2025.
//

import Foundation

/// Gamma function.
/// - Parameter x: Input value
/// - Returns: Returns the gamma function.
public func gamma(_ x: Double) -> Double {
    let a: [Double] = [
        1.00000000000000000000,
        0.57721566490153286061,
       -0.65587807152025388108,
       -0.04200263503409523553,
        0.16653861138291489500,
       -0.04219773455554433675,
       -0.00962197152787697356,
        0.00721894324666309954,
       -0.00116516759185906511,
       -0.00021524167411495097,
        0.00012805028238811619,
       -0.00002013485478078824,
       -0.00000125049348214267,
        0.00000113302723198170,
       -0.00000020563384169776,
        0.00000000611609510448,
        0.00000000500200764447,
       -0.00000000118127457049,
        0.00000000010434267117,
        0.00000000000778226344,
       -0.00000000000369680562,
        0.00000000000051003703,
       -0.00000000000002058326,
       -0.00000000000000534812,
        0.00000000000000122678,
       -0.00000000000000011813,
        0.00000000000000000119,
        0.00000000000000000141,
       -0.00000000000000000023,
        0.00000000000000000002
    ]

    let y = x - 1.0
    var sum = a.last!

    for n in (0..<(a.count - 1)).reversed() {
        sum = sum * y + a[n]
    }

    return 1.0 / sum
}

// https://rosettacode.org/wiki/Gamma_function#C#

/// Gamma function.
/// - Parameter z: Complex input value
/// - Returns: Returns the gamma function.
public func gamma(_ z: Complex) -> Complex {
    let g = 7
    let p: [Double] = [
        0.99999999999980993, 676.5203681218851, -1259.1392167224028,
        771.32342877765313, -176.61502916214059, 12.507343278686905,
        -0.13857109526572012, 9.9843695780195716e-6, 1.5056327351493116e-7
    ]

    // Reflection formula
    if z.0 < 0.5 {
        return (.pi, 0.0) / (sin((.pi, 0.0) * z) * gamma((1.0, 0.0) - z))
    } else {
        let zz: Complex = z - 1.0
        var x: Complex = (p[0], 0.0)
        for i in 1..<(g + 2) {
            x = x + p[i] / (zz + Real(i))
        }
        let t: Complex = zz + Real(g) + 0.5
        return sqrt((2 * .pi, 0.0)) * pow(t, zz + 0.5) * exp(-t) * x
    }
}

/// Gamma function.
/// - Parameter z: Complex input value
/// - Returns: Returns the gamma function evaluated at the elements of x.
public func gamma(_ z: RealArray) -> RealArray {
    return z.map { gamma($0) }
}

/// Gamma function.
/// - Parameter z: Complex input value
/// - Returns: Returns the gamma function evaluated at the elements of x.
public func gamma(_ z: ComplexArray) -> ComplexArray {
    assertSameSize(z)
    var result = z
    for k in 0..<result.0.count {
        (result.0[k], result.1[k]) = gamma((z.0[k], z.1[k]))
    }
    return result
}
