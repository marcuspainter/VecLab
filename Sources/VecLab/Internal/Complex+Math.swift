//
//  Complex+Math.swift
//
//
//  Created by Marcus Painter on 08/09/2023.
//

import Foundation

// MARK: Multiply

func complexMultiply(_ x: (Double, Double), _ y: (Double, Double)) -> (Double, Double) {
    let a = x.0
    let b = x.1
    let c = y.0
    let d = y.1
    return (a * c - b * d, a * d + b * c)
}

func complexMultiply(_ x: (Float, Float), _ y: (Float, Float)) -> (Float, Float) {
    let a = x.0
    let b = x.1
    let c = y.0
    let d = y.1
    return (a * c - b * d, a * d + b * c)
}

func complexMultiply(_ a: Double, _ b: Double, _ c: Double, _ d: Double, _ r: inout Double, _ i: inout Double) {
    r = a * c - b * d
    i = a * d + b * c
}

// MARK: ConjugateMultiply

func complexConjugateMultiply(_ x: (Double, Double), _ y: (Double, Double)) -> (Double, Double) {
    let a = x.0
    let b = x.1
    let c = y.0
    let d = y.1
    return (a * c + b * d, a * d - b * c)
}

func complexConjugateMultiply(_ x: (Float, Float), _ y: (Float, Float)) -> (Float, Float) {
    let a = x.0
    let b = x.1
    let c = y.0
    let d = y.1
    return (a * c + b * d, a * d - b * c)
}

func complexConjugateMultiply(_ a: Double, _ b: Double, _ c: Double, _ d: Double, _ r: inout Double, _ i: inout Double) {
    r = a * c + b * d
    i = a * d - b * c
}

func complexConjugateMultiply(_ a: Float, _ b: Float, _ c: Float, _ d: Float, _ r: inout Float, _ i: inout Float) {
    r = a * c + b * d
    i = a * d - b * c
}

// MARK: Divide

/*
 For the if branch: (x, y) = ((3, 4), (5, 2))
 For the else branch: (x, y) = ((3, 4), (2, 5))
 */

func complexDivide(_ x: (Double, Double), _ y: (Double, Double)) -> (Double, Double) {
    let a = x.0
    let b = x.1
    let c = y.0
    let d = y.1
    var e = Double(0)
    var f = Double(0)

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

func complexDivide(_ x: (Float, Float), _ y: (Float, Float)) -> (Float, Float) {
    let a = x.0
    let b = x.1
    let c = y.0
    let d = y.1
    var e = Float(0)
    var f = Float(0)

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

func complexDivide(_ a: Double, _ b: Double, _ c: Double, _ d: Double, _ e: inout Double, _ f: inout Double) {
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
}

func complexDivide(_ a: Float, _ b: Float, _ c: Float, _ d: Float, _ e: inout Float, _ f: inout Float) {
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
}


// MARK: Sqrt

func complexSqrt(_ x: (Double, Double)) -> (Double, Double) {
    let a = x.0
    let b = x.1
    let mag = Darwin.sqrt(a * a + b * b)
    let r = Darwin.sqrt((mag + a) * 0.5)
    var i = Darwin.sqrt((mag - a) * 0.5)

    // Note: sgn(0) = +1 This is non-standard.
    i = b < 0.0 ? -i : i
    return (r, i)
}

func complexSqrt(_ x: (Float, Float)) -> (Float, Float) {
    let a = x.0
    let b = x.1
    let mag = Darwin.sqrt(a * a + b * b)
    let r = Darwin.sqrt((mag + a) * 0.5)
    var i = Darwin.sqrt((mag - a) * 0.5)

    // Note: sgn(0) = +1 This is non-standard.
    i = b < 0.0 ? -i : i
    return (r, i)
}

func complexSqrt(_ a: Double, _ b: Double, _ r: inout Double, i: inout Double) {
    let mag = Darwin.sqrt(a * a + b * b)
    r = Darwin.sqrt((mag + a) * 0.5)
    i = Darwin.sqrt((mag - a) * 0.5)

    // Note: sgn(0) = +1 This is non-standard.
    i = b < 0.0 ? -i : i
}

func complexSqrt(_ a: Float, _ b: Float, _ r: inout Float, i: inout Float) {
    let mag = Darwin.sqrt(a * a + b * b)
    r = Darwin.sqrt((mag + a) * 0.5)
    i = Darwin.sqrt((mag - a) * 0.5)

    // Note: sgn(0) = +1 This is non-standard.
    i = b < 0.0 ? -i : i
}

// MARK: Exp

func complexExp(_ x: (Double, Double)) -> (Double, Double) {
    let r = Darwin.exp(x.0)
    let angle = x.1
    return (r * Darwin.cos(angle), r * Darwin.sin(angle))
}

func complexExp(_ x: (Float, Float)) -> (Float, Float) {
    let r = Darwin.exp(x.0)
    let angle = x.1
    return (r * Darwin.cos(angle), r * Darwin.sin(angle))
}


func complexExp(_ a: Double, _ b: Double, _ e: inout Double, _ f: inout Double) {
    let r = Darwin.exp(a)
    let angle = b
    e = r * Darwin.cos(angle)
    f = r * Darwin.sin(angle)
}

// MARK: Log

func complexLog(_ x: (Double, Double)) -> (Double, Double) {
    let r = Darwin.log(complexAbs(x))
    let i = complexAngle(x)
    return (r, i)
}

func complexLog(_ x: (Float, Float)) -> (Float, Float) {
    let r = Darwin.log(complexAbs(x))
    let i = complexAngle(x)
    return (r, i)
}


func complexLog(_ a: Double, _ b: Double, _ r: inout Double, _ i: inout Double) {
    r = Darwin.log(complexAbs(a, b))
    i = complexAngle(a, b)
}

// MARK: Abs

func complexAbs(_ x: (Double, Double)) -> Double {
    return Darwin.sqrt(x.0 * x.0 + x.1 * x.1)
}

func complexAbs(_ x: (Float, Float)) -> Float {
    return Darwin.sqrt(x.0 * x.0 + x.1 * x.1)
}

func complexAbs(_ a: Double, _ b: Double) -> Double {
    return Darwin.sqrt(a * a + b * b)
}

func complexAbs(_ a: Float, _ b: Float) -> Float {
    return Darwin.sqrt(a * a + b * b)
}

// MARK: Angle

func complexAngle(_ x: (Double, Double)) -> Double {
    return Darwin.atan2(x.1, x.0)
}

func complexAngle(_ x: (Float, Float)) -> Float {
    return Darwin.atan2(x.1, x.0)
}

func complexAngle(_ a: Double, _ b: Double) -> Double {
    return Darwin.atan2(a, b)
}

func complexAngle(_ a: Float, _ b: Float) -> Float {
    return Darwin.atan2(a, b)
}

// MARK: Pow

func complexComplexRealPow(_ a: (Double, Double), _ b: Double) -> (Double, Double) {
    let r = complexAbs(a)
    let angle = complexAngle(a)
    let n = b
    let rn = Darwin.pow(r, n)
    return (rn * Darwin.cos(n * angle), rn * Darwin.sin(n * angle))
}

func complexComplexRealPow(_ a: (Float, Float), _ b: Float) -> (Float, Float) {
    let r = complexAbs(a)
    let angle = complexAngle(a)
    let n = b
    let rn = Darwin.pow(r, n)
    return (rn * Darwin.cos(n * angle), rn * Darwin.sin(n * angle))
}

func complexRealPow(_ a: Double, _ b: Double, _ x: Double, _ e: inout Double, f: inout Double) {
    let r = complexAbs(a, b)
    let angle = complexAngle(a, b)
    let rn = Darwin.pow(r, x)
    e = rn * Darwin.cos(x * angle)
    f = rn * Darwin.sin(x * angle)
}

func complexRealPow(_ a: Float, _ b: Float, _ x: Float, _ e: inout Float, f: inout Float) {
    let r = complexAbs(a, b)
    let angle = complexAngle(a, b)
    let rn = Darwin.pow(r, x)
    e = rn * Darwin.cos(x * angle)
    f = rn * Darwin.sin(x * angle)
}

// MARK: Pow

func complexRealComplexPow(_ a: Double, _ b: (Double, Double)) -> (Double, Double) {
    let ab = Darwin.pow(a, b.0)
    let c = b.1
    return (ab * cos(c * log(a)), ab * sin(c * log(a)))
}

func complexRealComplexPow(_ a: Float, _ b: (Float, Float)) -> (Float, Float) {
    let ab = Darwin.pow(a, b.0)
    let c = b.1
    return (ab * cos(c * log(a)), ab * sin(c * log(a)))
}

func complexRealComplexPow(_ x: Double, _ a: Double, _ b: Double, _ r: inout Double, _ i: inout Double) {
    let ab = Darwin.pow(x, a)
    r = ab * Darwin.cos(b * Darwin.log(x))
    i = ab * Darwin.sin(b * Darwin.log(x))
}
