//
//  Vector+Complex.swift
//
//
//  Created by Marcus Painter on 08/09/2023.
//

import Accelerate
import Foundation

// MARK: Clear

func vectorClearRealArray(_ a: inout [Double]) {
    vDSP_vclrD(&a, 1, vDSP_Length(a.count))
}

func vectorClearComplexArray(_ a: inout [Float]) {
    vDSP_vclr(&a, 1, vDSP_Length(a.count))
}

// MARK: Fill

func vectorFillRealArray(_ a: Double, c: inout [Double]) {
    var aa = a
    vDSP_vfillD(&aa, &c, 1, vDSP_Length(c.count))
}

func vectorFillRealArray(_ a: Float, c: inout [Float]) {
    var aa = a
    vDSP_vfill(&aa, &c, 1, vDSP_Length(c.count))
}

func vectorFillComplexArray(_ a: (Double, Double), c: inout ([Double], [Double])) {
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvfillD(A, C, 1, N)
    }
}

// MARK: Angle

func vectorAngleComplexArray(_ a: ComplexArray) -> RealArray {
    var c = a.real
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvphasD(A, 1, C, 1, N)
    }
    return c
}

func vectorAngleComplexArray(_ a: ([Float], [Float])) -> [Float] {
    var c = a.0
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvphas(A, 1, C, 1, N)
    }
    return c
}

// MARK: Abs

func vectorAbsComplexArray(_ a: ComplexArray) -> RealArray {
    var c = a.real
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvabsD(A, 1, C, 1, N)
    }
    return c
}

func vectorAbsComplexArray(_ a: ([Float], [Float])) -> [Float] {
    var c = a.0
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvabs(A, 1, C, 1, N)
    }
    return c
}

// MARK: Conjugate

func vectorConjugateComplexArray(_ a: ComplexArray) -> ComplexArray {
    var c = a
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvconjD(A, 1, C, 1, N)
    }
    return c
}

func vectorConjugateComplexArray(_ a: ([Float], [Float])) -> ([Float], [Float]) {
    var c = a
    withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvconj(A, 1, C, 1, N)
    }
    return c
}

// MARK: Add

func vectorAddComplexArray(_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvaddD(A, 1, B, 1, C, 1, N)
    }
    return c
}

func vectorAddComplexArray(_ a: ([Float], [Float]), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvadd(A, 1, B, 1, C, 1, N)
    }
    return c
}

// MARK: Subtract

func vectorSubtractComplexArray(_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvsubD(A, 1, B, 1, C, 1, N)
    }
    return c
}

func vectorSubtractComplexArray(_ a: ([Float], [Float]), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvsub(A, 1, B, 1, C, 1, N)
    }
    return c
}

// MARK: Multiply

func vectorMultiplyComplexArray(_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(1) // No conjugate multiply
        vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

func vectorMultiplyComplexArray(_ a: ([Float], [Float]), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(1) // No conjugate multiply: 1
        vDSP_zvmul(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

func vectorMultiplyComplexArrayRealArray(_ a: ComplexArray, _ b: RealArray) -> ComplexArray {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zrvmulD(A, 1, B, 1, C, 1, N)
    }
    return c
}

func vectorMultiplyComplexArrayRealArray(_ a: ([Float], [Float]), _ b: [Float]) -> ([Float], [Float]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zrvmul(A, 1, B, 1, C, 1, N)
    }
    return c
}

func vectorMultiplyComplexArrayComplex(_ a: ComplexArray, _ b: Complex) -> ComplexArray {
    var c = a
    var b0 = a.real
    var b1 = a.real

    // Copy to var
    var br = b.real
    var bi = b.imag

    let n = vDSP_Length(a.count)
    vDSP_vfillD(&br, &b0, 1, n)
    vDSP_vfillD(&bi, &b1, 1, n)

    let bb = ComplexArray(b0, b1)
    withUnsafeParameters(a, bb, &c) { A, B, C, N in
        let conjugateFlag = Int32(1) // No conjugate multiply: 1
        vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

func vectorMultiplyComplexArrayComplex(_ a: ([Float], [Float]), _ b: (Float, Float)) -> ([Float], [Float]) {
    var c = a
    var b0 = a.1
    var b1 = a.0

    // Copy to var
    var br = b.0
    var bi = b.1

    let n = vDSP_Length(a.0.count)
    vDSP_vfill(&br, &b0, 1, n)
    vDSP_vfill(&bi, &b1, 1, n)
    let bb = (b0, b1)
    withUnsafeParameters(a, bb, &c) { A, B, C, N in
        let conjugateFlag = Int32(1) // No conjugate multiply: 1
        vDSP_zvmul(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

func vectorMultiplyComplexComplexArray(_ a: Complex, _ b: ComplexArray) -> ComplexArray {
    var c = b
    let a0 = [Double](repeating: a.real, count: b.count)
    let a1 = [Double](repeating: a.imag, count: b.count)
    let aa = ComplexArray(a0, a1)
    withUnsafeParameters(aa, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(1) // No conjugate multiply: 1
        vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

func vectorMultiplyComplexComplexArray(_ a: (Float, Float), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = b
    let a0 = [Float](repeating: a.0, count: b.0.count)
    let a1 = [Float](repeating: a.1, count: b.0.count)
    let aa = (a0, a1)
    withUnsafeParameters(aa, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(1) // No conjugate multiply: 1
        vDSP_zvmul(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

// MARK: Conjugate Multiply

func vectorConjugateMultiplyComplexArray(_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        // Conjugate multiply: -1
        let conjugateFlag = Int32(-1)
        vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

func vectorConjugateMultiplyComplexArray(_ a: ([Float], [Float]), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(-1) // Conjugate multiply: -1
        vDSP_zvmul(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

// MARK: Divide

func vectorDivideComplexArray(_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideComplexArray(_ a: ([Float], [Float]), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvdiv(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideComplexArrayReal(_ a: ComplexArray, _ b: Real) -> ComplexArray {
    let real = vDSP.divide(a.real, b)
    let imag = vDSP.divide(a.imag, b)
    return ComplexArray(real, imag)
}

func vectorDivideComplexArrayReal(_ a: ([Float], [Float]), _ b: Float) -> ([Float], [Float]) {
    let r = vDSP.divide(a.0, b)
    let i = vDSP.divide(a.1, b)
    return (r, i)
}

func vectorDivideRealComplexArray(_ a: Real, _ b: ComplexArray) -> ComplexArray {
    var c = b
    let a0 = [Double](repeating: a, count: b.count)
    let a1 = [Double](repeating: 0.0, count: b.count)
    let aa = ComplexArray(a0, a1)
    withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideRealComplexArray(_ a: Float, _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = b
    let a0 = [Float](repeating: a, count: b.0.count)
    let a1 = [Float](repeating: 0.0, count: b.0.count)
    let aa = (a0, a1)
    withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdiv(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideComplexArrayRealArray(_ a: ComplexArray, _ b: RealArray) -> ComplexArray {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zrvdivD(A, 1, B, 1, C, 1, N)
    }
    return c
}

func vectorDivideComplexArrayRealArray(_ a: ([Float], [Float]), _ b: [Float]) -> ([Float], [Float]) {
    var c = a
    withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zrvdiv(A, 1, B, 1, C, 1, N)
    }
    return c
}

func vectorDivideRealArrayComplexArray(_ a: RealArray, _ b: ComplexArray) -> ComplexArray {
    var c = b
    let a1 = [Double](repeating: 0.0, count: a.count)
    let aa = ComplexArray(a, a1)
    withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideRealArrayComplexArray(_ a: [Float], _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = b
    let a1 = [Float](repeating: 0.0, count: a.count)
    let aa = (a, a1)
    withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdiv(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideComplexRealArray(_ a: Complex, _ b: RealArray) -> ComplexArray {
    let real = vDSP.divide(a.real, b)
    let imag = vDSP.divide(a.imag, b)
    return ComplexArray(real, imag)
}

func vectorDivideComplexRealArray(_ a: (Float, Float), _ b: [Float]) -> ([Float], [Float]) {
    // var c = (b, b)
    // let b1 = [Double](repeating: 0.0, count: b.count)
    // let bb = (b, b1)
    // withUnsafeParameters(a, bb, &c) { A, B, C, N in
    //    vDSP_zvdivD(&B, 1, &A, 1, &C, 1, N)
    // }
    // return c

    let r = vDSP.divide(a.0, b)
    let i = vDSP.divide(a.1, b)
    return (r, i)
}

func vectorDivideRealArrayComplex(_ a: RealArray, _ b: Complex) -> ComplexArray {
    var c = ComplexArray(a, a)
    let b0 = [Double](repeating: b.real, count: a.count)
    let b1 = [Double](repeating: b.imag, count: a.count)
    let bb = ComplexArray(b0, b1)
    let a0 = a
    let a1 = [Double](repeating: 0.0, count: a.count)
    let aa = ComplexArray(a0, a1)
    withUnsafeParameters(aa, bb, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
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
        vDSP_zvdiv(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideComplexArrayComplex(_ a: ComplexArray, _ b: Complex) ->  ComplexArray {
    var c = a
    let b0 = [Double](repeating: b.real, count: a.count)
    let b1 = [Double](repeating: b.imag, count: a.count)
    let bb = ComplexArray(b0, b1)
    withUnsafeParameters(a, bb, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideComplexArrayComplex(_ a: ([Float], [Float]), _ b: (Float, Float)) -> ([Float], [Float]) {
    var c = a
    let b0 = [Float](repeating: b.0, count: a.0.count)
    let b1 = [Float](repeating: b.1, count: a.1.count)
    let bb = (b0, b1)
    withUnsafeParameters(a, bb, &c) { A, B, C, N in
        vDSP_zvdiv(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideComplexComplexArray(_ a: Complex, _ b: ComplexArray) -> ComplexArray {
    var c = b
    let a0 = [Double](repeating: a.real, count: b.count)
    let a1 = [Double](repeating: a.imag, count: b.count)
    let aa = ComplexArray(a0, a1)
    withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideComplexComplexArray(_ a: (Float, Float), _ b: ([Float], [Float])) -> ([Float], [Float]) {
    var c = b
    let a0 = [Float](repeating: a.0, count: b.0.count)
    let a1 = [Float](repeating: a.1, count: b.1.count)
    let aa = (a0, a1)
    withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdiv(B, 1, A, 1, C, 1, N)
    }
    return c
}

// MARK: Log

func vectorLogComplexArray(_ a: ComplexArray) -> ComplexArray {
    var angle = a.real
    var mag = a.real
    var logMag = a.real
    withUnsafeParameters(a, &angle) { A, C, N in
        vDSP_zvphasD(A, 1, C, 1, N)
    }
    withUnsafeParameters(a, &mag) { A, C, N in
        vDSP_zvabsD(A, 1, C, 1, N)
    }

    var n = Int32(a.count)
    vvlog(&logMag, &mag, &n)

    return ComplexArray(logMag, angle)
}

func vectorLogComplexArray(_ a: ([Float], [Float])) -> ([Float], [Float]) {
    var angle = a.0
    var mag = a.0
    var logMag = a.0

    withUnsafeParameters(a, &angle) { A, C, N in
        vDSP_zvphas(A, 1, C, 1, N)
    }
    withUnsafeParameters(a, &mag) { A, C, N in
        vDSP_zvabs(A, 1, C, 1, N)
    }

    var n = Int32(a.0.count)
    vvlogf(&logMag, &mag, &n)

    return (logMag, angle)
}

// MARK: Exp

func vectorExpComplexArray(_ a: ComplexArray) -> ComplexArray {
    // 1. Calculate e^a for each real part
    let expReal = vForce.exp(a.real)

    // 2. Simultaneously calculate sine and cosine for each imaginary part
    var cosImag = a.real
    var sinImag = a.real
    vForce.sincos(a.imag, sinResult: &sinImag, cosResult: &cosImag)

    // 3. Multiply results element-wise
    let resultReal = vDSP.multiply(expReal, cosImag)
    let resultImag = vDSP.multiply(expReal, sinImag)

    return ComplexArray(resultReal, resultImag)
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
