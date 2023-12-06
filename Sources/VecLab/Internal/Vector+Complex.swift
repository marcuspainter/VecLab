//
//  Vector+Complex.swift
//
//
//  Created by Marcus Painter on 08/09/2023.
//

import Accelerate
import Foundation

// fileprivate typealias ComplexDoubleArray = ([Double], [Double])
// fileprivate typealias ComplexFloatArray = ([Float], [Float])
// fileprivate typealias RealDoubleArray = [Double]
// fileprivate typealias RealFloatArray = [Float]

func vectorComplexAngle(_ a: ([Double], [Double])) -> [Double] {
    var c = createRealArray(sized: a.0)
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvphasD(&A, 1, &C, 1, N)
    }
    return c
}

func vectorComplexAngle(_ a: ([Float], [Float])) -> [Float] {
    var c = createRealArray(sized: a.0)
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvphas(&A, 1, &C, 1, N)
    }
    return c
}

func vectorComplexAbs(_ a: ([Double], [Double])) -> [Double] {
    var c = createRealArray(sized: a.0)
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvabsD(&A, 1, &C, 1, N)
    }
    return c
}

func vectorComplexAbs(_ a: ([Float], [Float])) -> [Float] {
    var c = createRealArray(sized: a.0)
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvabs(&A, 1, &C, 1, N)
    }
    return c
}

func vectorComplexConjugate(_ a: ([Double], [Double])) -> ([Double], [Double]) {
    var c = createComplexArray(sized: a)
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvconjD(&A, 1, &C, 1, N)
    }
    return c
}

func vectorComplexConjugate(_ a: ([Float], [Float])) -> ([Float], [Float]) {
    var c = createComplexArray(sized: a)
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvconj(&A, 1, &C, 1, N)
    }
    return c
}

func vectorComplexAdd(_ a: ([Double], [Double]), _ b: ([Double], [Double])) -> ([Double], [Double]) {
    var c = createComplexArray(sized: a)
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvaddD(&A, 1, &B, 1, &C, 1, N)
    }
    return c
}

func vectorComplexAdd(_ a: ([Float], [Float]), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = createComplexArray(sized: a)
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvadd(&A, 1, &B, 1, &C, 1, N)
    }
    return c
}

func vectorComplexSubtract(_ a: ([Double], [Double]), _ b: ([Double], [Double])) -> ([Double], [Double]) {
    var c = createComplexArray(sized: a)
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvsubD(&A, 1, &B, 1, &C, 1, N)
    }
    return c
}

func vectorComplexSubtract(_ a: ([Float], [Float]), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = createComplexArray(sized: a)
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvsub(&A, 1, &B, 1, &C, 1, N)
    }
    return c
}

func vectorComplexMultiply(_ a: ([Double], [Double]), _ b: ([Double], [Double])) -> ([Double], [Double]) {
    var c = createComplexArray(sized: a)
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(1) // No conjugate multiply
        vDSP_zvmulD(&A, 1, &B, 1, &C, 1, N, conjugateFlag)
    }
    return c
}

func vectorComplexMultiply(_ a: ([Float], [Float]), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = createComplexArray(sized: a)
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(1) // No conjugate multiply: 1
        vDSP_zvmul(&A, 1, &B, 1, &C, 1, N, conjugateFlag)
    }
    return c
}

func vectorComplexConjugateMultiply(_ a: ([Double], [Double]), _ b: ([Double], [Double])) -> ([Double], [Double]) {
    var c = createComplexArray(sized: a)
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        // Conjugate multiply: -1
        let conjugateFlag = Int32(-1)
        vDSP_zvmulD(&A, 1, &B, 1, &C, 1, N, conjugateFlag)
    }
    return c
}

func vectorComplexConjugateMultiply(_ a: ([Float], [Float]), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = createComplexArray(sized: a)
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(-1) // Conjugate multiply: -1
        vDSP_zvmul(&A, 1, &B, 1, &C, 1, N, conjugateFlag)
    }
    return c
}

func vectorComplexDivide(_ a: ([Double], [Double]), _ b: ([Double], [Double])) -> ([Double], [Double]) {
    var c = createComplexArray(sized: a)
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvdivD(&A, 1, &B, 1, &C, 1, N)
    }
    return c
}

func vectorComplexDivide(_ a: ([Float], [Float]), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = createComplexArray(sized: a)
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvdiv(&A, 1, &B, 1, &C, 1, N)
    }
    return c
}

func vectorComplexLog(_ a: ([Double], [Double])) -> ([Double], [Double]) {
    var angle = createRealArray(sized: a.0)
    var mag = createRealArray(sized: a.0)
    var logMag = createRealArray(sized: a.0)
    withUnsafeParameters(a, &angle) { A, C, N in
        vDSP_zvphasD(&A, 1, &C, 1, N)
    }
    withUnsafeParameters(a, &mag) { A, C, N in
        vDSP_zvabsD(&A, 1, &C, 1, N)
    }

    var n = Int32(a.0.count)
    vvlog(&logMag, &mag, &n)

    return (logMag, angle)
}

func vectorComplexLog(_ a: ([Float], [Float])) -> ([Float], [Float]) {
    var angle = createRealArray(sized: a.0)
    var mag = createRealArray(sized: a.0)
    var logMag = createRealArray(sized: a.0)

    withUnsafeParameters(a, &angle) { A, C, N in
        vDSP_zvphas(&A, 1, &C, 1, N)
    }
    withUnsafeParameters(a, &mag) { A, C, N in
        vDSP_zvabs(&A, 1, &C, 1, N)
    }

    var n = Int32(a.0.count)
    vvlogf(&logMag, &mag, &n)

    return (logMag, angle)
}

func vectorComplexExp(_ a: ([Double], [Double])) -> ([Double], [Double]) {

    // 1. Calculate e^a for each real part
    let expReal = vForce.exp(a.0)

    // 2. Simultaneously calculate sine and cosine for each imaginary part
    var cosImag = createRealArray(sized: a.0)
    var sinImag = createRealArray(sized: a.0)
    vForce.sincos(a.1, sinResult: &sinImag, cosResult: &cosImag)

    // 3. Multiply results element-wise
    let resultReal = vDSP.multiply(expReal, cosImag)
    let resultImag = vDSP.multiply(expReal, sinImag)

    return (resultReal, resultImag)
}

func vectorComplexExp(_ a: ([Float], [Float])) -> ([Float], [Float]) {
    // 1. Calculate e^a for each real part
    let expReal = vForce.exp(a.0)

    // 2. Simultaneously calculate sine and cosine for each imaginary part
    var cosImag = createRealArray(sized: a.0)
    var sinImag = createRealArray(sized: a.0)
    vForce.sincos(a.1, sinResult: &sinImag, cosResult: &cosImag)

    // 3. Multiply results element-wise
    let resultReal = vDSP.multiply(expReal, cosImag)
    let resultImag = vDSP.multiply(expReal, sinImag)

    return (resultReal, resultImag)
}
