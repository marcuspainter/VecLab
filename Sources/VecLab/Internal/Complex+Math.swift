//
//  Complex+Math.swift
//
//
//  Created by Marcus Painter on 08/09/2023.
//

import Foundation

// MARK: Multiply

func complexMultiply(_ x: Complex, _ y: Complex) -> Complex {
    let a = x.real
    let b = x.imag
    let c = y.real
    let d = y.imag
    return Complex(a * c - b * d, a * d + b * c)
}

// MARK: ConjugateMultiply

func complexConjugateMultiply(_ x: Complex, _ y: Complex) -> Complex {
    let a = x.real
    let b = x.imag
    let c = y.real
    let d = y.imag
    return Complex(a * c + b * d, a * d - b * c)
}

// MARK: Divide

/*
 For the if branch: (x, y) = ((3, 4), (5, 2))
 For the else branch: (x, y) = ((3, 4), (2, 5))
 */

func complexDivide(_ x: Complex, _ y: Complex) -> Complex {
    let a = x.real
    let b = x.imag
    let c = y.real
    let d = y.imag
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
    return Complex(e, f)
}

// MARK: Sqrt

func complexSqrt(_ x: Complex) -> Complex {
    let a = x.real
    let b = x.imag
    let mag = Darwin.sqrt(a * a + b * b)
    let r = Darwin.sqrt((mag + a) * 0.5)
    var i = Darwin.sqrt((mag - a) * 0.5)

    // Note: sgn(0) = +1 This is non-standard.
    i = b < 0.0 ? -i : i
    return Complex(r, i)
}

func complexSqrt(_ a: Real, _ b: Real, _ r: inout Real, i: inout Real) {
    let mag = Darwin.sqrt(a * a + b * b)
    r = Darwin.sqrt((mag + a) * 0.5)
    i = Darwin.sqrt((mag - a) * 0.5)

    // Note: sgn(0) = +1 This is non-standard.
    i = b < 0.0 ? -i : i
}

// MARK: Exp

func complexExp(_ x: Complex) -> Complex {
    let r = Darwin.exp(x.real)
    let angle = x.imag
    return Complex(r * Darwin.cos(angle), r * Darwin.sin(angle))
}

// MARK: Log

func complexLog(_ x: Complex) -> Complex {
    let r = Darwin.log(complexAbs(x))
    let i = complexAngle(x)
    return Complex(r, i)
}

// MARK: Abs

func complexAbs(_ x: Complex) -> Real {
    return Darwin.sqrt(x.real * x.real + x.imag * x.imag)
}

func complexAbs(_ a: Real, _ b: Real) -> Real {
    return Darwin.sqrt(a * a + b * b)
}

// MARK: Angle

func complexAngle(_ x: Complex) -> Real {
    return Darwin.atan2(x.imag, x.real)
}

func complexAngle(_ a: Real, _ b: Real) -> Real {
    return Darwin.atan2(a, b)
}

// MARK: Pow

func complexComplexRealPow(_ a: Complex, _ b: Real) -> Complex {
    let r = complexAbs(a)
    let angle = complexAngle(a)
    let n = b
    let rn = Darwin.pow(r, n)
    return Complex(rn * Darwin.cos(n * angle), rn * Darwin.sin(n * angle))
}

func complexRealPow(_ a: Real, _ b: Real, _ x: Real, _ e: inout Real, f: inout Real) {
    let r = complexAbs(a, b)
    let angle = complexAngle(a, b)
    let rn = Darwin.pow(r, x)
    e = rn * Darwin.cos(x * angle)
    f = rn * Darwin.sin(x * angle)
}

// MARK: Pow

func complexRealComplexPow(_ a: Real, _ b: Complex) -> Complex {
    let ab = Darwin.pow(a, b.real)
    let c = b.imag
    return Complex(ab * cos(c * log(a)), ab * sin(c * log(a)))
}

func complexRealComplexPow(_ x: Real, _ a: Real, _ b: Real, _ r: inout Real, _ i: inout Real) {
    let ab = Darwin.pow(x, a)
    r = ab * Darwin.cos(b * Darwin.log(x))
    i = ab * Darwin.sin(b * Darwin.log(x))
}
