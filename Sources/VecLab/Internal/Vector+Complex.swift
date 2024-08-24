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

// MARK: Angle

func vectorAngleComplexArray(_ a: ([Double], [Double])) -> [Double] {
    var c = a.0
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvphasD(&A, 1, &C, 1, N)
    }
    return c
}

func vectorAngleComplexArray(_ a: ([Float], [Float])) -> [Float] {
    var c = a.0
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvphas(&A, 1, &C, 1, N)
    }
    return c
}

// MARK: Abs

func vectorAbsComplexArray(_ a: ([Double], [Double])) -> [Double] {
    var c = a.0
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvabsD(&A, 1, &C, 1, N)
    }
    return c
}

func vectorAbsComplexArray(_ a: ([Float], [Float])) -> [Float] {
    var c = a.0
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvabs(&A, 1, &C, 1, N)
    }
    return c
}

// MARK: Conjugate

func vectorConjugateComplexArray(_ a: ([Double], [Double])) -> ([Double], [Double]) {
    var c = a
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvconjD(&A, 1, &C, 1, N)
    }
    return c
}

func vectorConjugateComplexArray(_ a: ([Float], [Float])) -> ([Float], [Float]) {
    var c = a
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvconj(&A, 1, &C, 1, N)
    }
    return c
}

// MARK: Add

func vectorAddComplexArray(_ a: ([Double], [Double]), _ b: ([Double], [Double])) -> ([Double], [Double]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvaddD(&A, 1, &B, 1, &C, 1, N)
    }
    return c
}

func vectorAddComplexArray(_ a: ([Float], [Float]), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvadd(&A, 1, &B, 1, &C, 1, N)
    }
    return c
}

// MARK: Subtract

func vectorSubtractComplexArray(_ a: ([Double], [Double]), _ b: ([Double], [Double])) -> ([Double], [Double]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvsubD(&A, 1, &B, 1, &C, 1, N)
    }
    return c
}

func vectorSubtractComplexArray(_ a: ([Float], [Float]), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvsub(&A, 1, &B, 1, &C, 1, N)
    }
    return c
}

// MARK: Multiply

func vectorMultiplyComplexArray(_ a: ([Double], [Double]), _ b: ([Double], [Double])) -> ([Double], [Double]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(1) // No conjugate multiply
        vDSP_zvmulD(&A, 1, &B, 1, &C, 1, N, conjugateFlag)
    }
    return c
}

func vectorMultiplyComplexArray(_ a: ([Float], [Float]), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(1) // No conjugate multiply: 1
        vDSP_zvmul(&A, 1, &B, 1, &C, 1, N, conjugateFlag)
    }
    return c
}

// MARK: Conjugate Multiply

func vectorConjugateMultiplyComplexArray(_ a: ([Double], [Double]), _ b: ([Double], [Double])) -> ([Double], [Double]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        // Conjugate multiply: -1
        let conjugateFlag = Int32(-1)
        vDSP_zvmulD(&A, 1, &B, 1, &C, 1, N, conjugateFlag)
    }
    return c
}

func vectorConjugateMultiplyComplexArray(_ a: ([Float], [Float]), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(-1) // Conjugate multiply: -1
        vDSP_zvmul(&A, 1, &B, 1, &C, 1, N, conjugateFlag)
    }
    return c
}

// MARK: Divide

func vectorDivideComplexArrayComplexArray(_ a: ([Double], [Double]), _ b: ([Double], [Double])) -> ([Double], [Double]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvdivD(&B, 1, &A, 1, &C, 1, N)
    }
    return c
}

func vectorDivideComplexArrayComplexArray(_ a: ([Float], [Float]), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvdiv(&B, 1, &A, 1, &C, 1, N)
    }
    return c
}

func vectorDivideComplexArrayReal(_ a: ([Double], [Double]), _ b: Double) -> ([Double], [Double]) {
    let r = vDSP.divide(a.0, b)
    let i = vDSP.divide(a.1, b)
    return (r, i)
}

func vectorDivideComplexArrayReal(_ a: ([Float], [Float]), _ b: Float) -> ([Float], [Float]) {
    let r = vDSP.divide(a.0, b)
    let i = vDSP.divide(a.1, b)
    return (r, i)
}


func vectorDivideRealComplexArray(_ a: Double, _ b: ([Double], [Double])) -> ([Double], [Double]) {
    var c = b
    let a0 = [Double](repeating: a, count: b.0.count)
    let a1 = [Double](repeating: 0.0, count: b.0.count)
    let aa = (a0, a1)
    withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdivD(&B, 1, &A, 1, &C, 1, N)
    }
    return c
}

func vectorDivideRealComplexArray(_ a: Float, _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = b
    let a0 = [Float](repeating: a, count: b.0.count)
    let a1 = [Float](repeating: 0.0, count: b.0.count)
    let aa = (a0, a1)
    withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdiv(&B, 1, &A, 1, &C, 1, N)
    }
    return c
}

func vectorDivideComplexArrayRealArray(_ a: ([Double], [Double]), _ b: [Double]) -> ([Double], [Double]) {
    var c = a
    let b1 = [Double](repeating: 0.0, count: b.count)
    let bb = (b, b1)
    withUnsafeParameters(a, bb, &c) { A, B, C, N in
        vDSP_zvdivD(&B, 1, &A, 1, &C, 1, N)
    }
    return c
}

func vectorDivideRealArrayComplexArray(_ a: [Double], _ b: ([Double], [Double])) -> ([Double], [Double]) {
    var c = b
    let a1 = [Double](repeating: 0.0, count: a.count)
    let aa = (a, a1)
    withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdivD(&B, 1, &A, 1, &C, 1, N)
    }
    return c
}

func vectorDivideRealArrayComplexArray(_ a: [Float], _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = b
    let a1 = [Float](repeating: 0.0, count: a.count)
    let aa = (a, a1)
    withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdiv(&B, 1, &A, 1, &C, 1, N)
    }
    return c
}

func vectorDivideComplexRealArray(_ a: (Double, Double), _ b: [Double]) -> ([Double], [Double]) {
    //var c = (b, b)
    //let b1 = [Double](repeating: 0.0, count: b.count)
    //let bb = (b, b1)
    //withUnsafeParameters(a, bb, &c) { A, B, C, N in
    //    vDSP_zvdivD(&B, 1, &A, 1, &C, 1, N)
    //}
    //return c
    
    let r = vDSP.divide(a.0, b)
    let i = vDSP.divide(a.1, b)
    return (r, i)
}

func vectorDivideComplexRealArray(_ a: (Float, Float), _ b: [Float]) -> ([Float], [Float]) {
    //var c = (b, b)
    //let b1 = [Double](repeating: 0.0, count: b.count)
    //let bb = (b, b1)
    //withUnsafeParameters(a, bb, &c) { A, B, C, N in
    //    vDSP_zvdivD(&B, 1, &A, 1, &C, 1, N)
    //}
    //return c
    
    let r = vDSP.divide(a.0, b)
    let i = vDSP.divide(a.1, b)
    return (r, i)
}

func vectorDivideRealArrayComplex(_ a: [Double], _ b: (Double, Double)) -> ([Double], [Double]) {
    var c = (a, a)
    let b0 = [Double](repeating: b.0, count: a.count)
    let b1 = [Double](repeating: b.1, count: a.count)
    let bb = (b0, b1)
    let a0 = a
    let a1 = [Double](repeating: 0.0, count: a.count)
    let aa = (a0, a1)
    withUnsafeParameters(aa, bb, &c) { A, B, C, N in
        vDSP_zvdivD(&B, 1, &A, 1, &C, 1, N)
    }
    return c
}

func vectorDivideRealArrayComplex(_ a: [Float], _ b: (Float, Float)) -> ([Float], [Float]) {
    var c = (a, a)
    let b0 = [Float](repeating: b.0, count: a.count)
    let b1 = [Float](repeating: b.1, count: a.count)
    let bb = (b0, b1)
    let a0 = a
    let a1 = [Float](repeating: 0.0, count: a.count)
    let aa = (a0, a1)
    withUnsafeParameters(aa, bb, &c) { A, B, C, N in
        vDSP_zvdiv(&B, 1, &A, 1, &C, 1, N)
    }
    return c
}

// MARK: Log

func vectorLogComplexArray(_ a: ([Double], [Double])) -> ([Double], [Double]) {
    var angle = a.0
    var mag = a.0
    var logMag = a.0
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

func vectorLogComplexArray(_ a: ([Float], [Float])) -> ([Float], [Float]) {
    var angle = a.0
    var mag = a.0
    var logMag = a.0

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

// MARK: Exp

func vectorExpComplexArray(_ a: ([Double], [Double])) -> ([Double], [Double]) {

    // 1. Calculate e^a for each real part
    let expReal = vForce.exp(a.0)

    // 2. Simultaneously calculate sine and cosine for each imaginary part
    var cosImag = a.0
    var sinImag = a.0
    vForce.sincos(a.1, sinResult: &sinImag, cosResult: &cosImag)

    // 3. Multiply results element-wise
    let resultReal = vDSP.multiply(expReal, cosImag)
    let resultImag = vDSP.multiply(expReal, sinImag)

    return (resultReal, resultImag)
}

func vectorExpComplexArray(_ a: ([Float], [Float])) -> ([Float], [Float]) {
    // 1. Calculate e^a for each real part
    let expReal = vForce.exp(a.0)

    // 2. Simultaneously calculate sine and cosine for each imaginary part
    var cosImag = a.0
    var sinImag = a.0
    vForce.sincos(a.1, sinResult: &sinImag, cosResult: &cosImag)

    // 3. Multiply results element-wise
    let resultReal = vDSP.multiply(expReal, cosImag)
    let resultImag = vDSP.multiply(expReal, sinImag)

    return (resultReal, resultImag)
}
