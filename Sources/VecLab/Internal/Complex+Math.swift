//
//  Complex+Math.swift
//
//
//  Created by Marcus Painter on 08/09/2023.
//

import Foundation

func complexMultiply(_ x: (Real, Real), _ y: (Real, Real)) -> (Real, Real) {
    let a = x.0
    let b = x.1
    let c = y.0
    let d = y.1
    return ( a * c - b * d, a * d + b * c )
}

func complexConjugateMultiply(_ x: (Real, Real), _ y: (Real, Real)) -> (Real, Real) {
    let a = x.0
    let b = x.1
    let c = y.0
    let d = y.1
    return ( a * c + b * d, a * d - b * c )
}

/*
 For the if branch: (x, y) = ((3, 4), (5, 2))
 For the else branch: (x, y) = ((3, 4), (2, 5))
 */

func complexDivide(_ x: (Real, Real), _ y: (Real, Real)) -> (Real, Real) {
    let a = x.0
    let b = x.1
    let c = y.0
    let d = y.1
    var e = Real(0)
    var f = Real(0)

    if abs(d) <= abs(c) {
        let r = d / c
        let den = c + d * r
        e = (a + b * r) / den
        f = (b - a * r) / den
    } else {
        let r = c / d
        let den = c * r + d
        e = (a * r + b) / den
        f = (b * r - a) / den
    }
    return (e, f)
}

func complexSqrt(_ x: (Real, Real)) -> (Real, Real) {
    let a = x.0
    let b = x.1
    let mag = Darwin.sqrt(a * a + b * b)
    let r = Darwin.sqrt((mag + a) * 0.5)
    var i = Darwin.sqrt((mag - a) * 0.5)

    // Note: sgn(0) = +1 This is non-standard.
    i = b < 0.0 ? -i : i
    return (r, i)
}

func complexExp(_ x: (Real, Real)) -> (Real, Real) {
    let r = Darwin.exp(x.0)
    let angle = x.1
    return (r * Darwin.cos(angle), r * Darwin.sin(angle))
}

func complexLog(_ x: (Real, Real)) -> (Real, Real) {
    let r = Darwin.log(complexAbs(x))
    let i = complexAngle(x)
    return (r, i)
}

func complexAbs(_ x: (Real, Real)) -> Real {
    return Darwin.sqrt(x.0*x.0 + x.1*x.1)
}

func complexAngle(_ x: (Real, Real)) -> Real {
    return Darwin.atan2(x.1, x.0)
}

func complexRealPow(_ a: (Real, Real), _ b: Real ) -> (Real, Real) {
    let r = abs(a)
    let angle = angle(a)
    let n = b
    let rn = pow(r, n)
    return (rn * cos(n * angle), rn * sin(n * angle))
}

func complexRealPow(_ a: Real, _ b: (Real, Real) ) -> (Real, Real) {
    let ab = pow(a, b.0)
    let c = b.1
    return (ab * cos(c * log(a)), ab * sin(c * log(a)))
}
