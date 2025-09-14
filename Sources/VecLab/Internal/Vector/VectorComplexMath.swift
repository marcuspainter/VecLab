//
//  VectorComplexMath.swift
//
//
//  Created by Marcus Painter on 08/09/2023.
//

import Accelerate
import Foundation

extension SplitComplexArray {
    init(unsafeCount count: Int) {
        self.real = [Double](unsafeUninitializedCapacity: count) { buffer, initializedCount in
            initializedCount = count
        }
        self.imag = [Double](unsafeUninitializedCapacity: count) { buffer, initializedCount in
            initializedCount = count
        }
    }
}

// MARK: Clear

func vectorClearRealArray(_ a: inout [Double]) {
    vDSP_vclrD(&a, 1, vDSP_Length(a.count))
}

// MARK: Fill

func vectorFillRealArray(_ a: Double, c: inout [Double]) {
    var aa = a
    vDSP_vfillD(&aa, &c, 1, vDSP_Length(c.count))
}

/*
 func vectorFillSplitComplexArray(_ a: Complex, c: inout SplitComplexArray) {
     SplitComplexArray.withUnsafeParameters(a, &c) { A, C, N in
         vDSP_zvfillD(A, C, 1, N)
     }
 }
 */

// MARK: Angle

func vectorAngleSplitComplexArray(_ a: SplitComplexArray) -> RealArray {
    var c = a.real
    SplitComplexArray.withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvphasD(A, 1, C, 1, N)
    }
    return c
}

// MARK: Abs

func vectorAbsSplitComplexArray(_ a: SplitComplexArray) -> RealArray {
    var c = a.real
    SplitComplexArray.withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvabsD(A, 1, C, 1, N)
    }
    return c
}

// MARK: Conjugate

func vectorConjugateSplitComplexArray(_ a: SplitComplexArray) -> SplitComplexArray {
    var c = a
    SplitComplexArray.withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvconjD(A, 1, C, 1, N)
    }
    return c
}

// MARK: Add

func vectorAddSplitComplexArray(_ a: SplitComplexArray, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = a
    SplitComplexArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvaddD(A, 1, B, 1, C, 1, N)
    }
    return c
}

// MARK: Subtract

func vectorSubtractSplitComplexArray(_ a: SplitComplexArray, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = a
    SplitComplexArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvsubD(A, 1, B, 1, C, 1, N)
    }
    return c
}

// MARK: Multiply

func vectorMultiplySplitComplexArray(_ a: SplitComplexArray, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = a
    SplitComplexArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(1) // No conjugate multiply
        vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

func vectorMultiplySplitComplexArrayRealArray(_ a: SplitComplexArray, _ b: RealArray) -> SplitComplexArray {
    var c = a
    SplitComplexArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zrvmulD(A, 1, B, 1, C, 1, N)
    }
    return c
}

func vectorMultiplySplitComplexArrayComplex(_ a: SplitComplexArray, _ b: Complex) -> SplitComplexArray {
    var c = a
    let bb = SplitComplexArray(repeating: b, count: a.count)
    SplitComplexArray.withUnsafeParameters(a, bb, &c) { A, B, C, N in
        let conjugateFlag = Int32(1) // No conjugate multiply: 1
        vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

func vectorMultiplyComplexSplitComplexArray(_ a: Complex, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = b
    let aa = SplitComplexArray(repeating: a, count: b.count)
    SplitComplexArray.withUnsafeParameters(aa, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(1) // No conjugate multiply: 1
        vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

// MARK: Conjugate Multiply

func vectorConjugateMultiplySplitComplexArray(_ a: SplitComplexArray, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = a
    SplitComplexArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        // Conjugate multiply: -1
        let conjugateFlag = Int32(-1)
        vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

// MARK: Divide

func vectorDivideSplitComplexArray(_ a: SplitComplexArray, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = a
    SplitComplexArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideSplitComplexArrayReal(_ a: SplitComplexArray, _ b: Real) -> SplitComplexArray {
    let real = vDSP.divide(a.real, b)
    let imag = vDSP.divide(a.imag, b)
    return SplitComplexArray(real, imag)
}

func vectorDivideRealSplitComplexArray(_ a: Real, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = b
    let a0 = [Double](repeating: a, count: b.count)
    let a1 = [Double](repeating: 0.0, count: b.count)
    let aa = SplitComplexArray(a0, a1)
    SplitComplexArray.withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideSplitComplexArrayRealArray(_ a: SplitComplexArray, _ b: RealArray) -> SplitComplexArray {
    var c = a
    SplitComplexArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zrvdivD(A, 1, B, 1, C, 1, N)
    }
    return c
}

func vectorDivideRealArraySplitComplexArray(_ a: RealArray, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = b
    let a1 = [Double](repeating: 0.0, count: a.count)
    let aa = SplitComplexArray(a, a1)
    SplitComplexArray.withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideComplexRealArray(_ a: Complex, _ b: RealArray) -> SplitComplexArray {
    let real = vDSP.divide(a.real, b)
    let imag = vDSP.divide(a.imag, b)
    return SplitComplexArray(real, imag)
}

func vectorDivideRealArrayComplex(_ a: RealArray, _ b: Complex) -> SplitComplexArray {
    var c = SplitComplexArray(count: a.count)
    let b0 = [Double](repeating: b.real, count: a.count)
    let b1 = [Double](repeating: b.imag, count: a.count)
    let bb = SplitComplexArray(b0, b1)
    let a0 = a
    let a1 = [Double](repeating: 0.0, count: a.count)
    let aa = SplitComplexArray(a0, a1)
    validateSize(aa, bb)
    validateSize(aa, c)
    SplitComplexArray.withUnsafeParameters(aa, bb, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideSplitComplexArrayComplex(_ a: SplitComplexArray, _ b: Complex) -> SplitComplexArray {
    var c = a
    let b0 = [Double](repeating: b.real, count: a.count)
    let b1 = [Double](repeating: b.imag, count: a.count)
    let bb = SplitComplexArray(b0, b1)
    SplitComplexArray.withUnsafeParameters(a, bb, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideComplexSplitComplexArray(_ a: Complex, _ b: SplitComplexArray) -> SplitComplexArray {
    var c = b
    let a0 = [Double](repeating: a.real, count: b.count)
    let a1 = [Double](repeating: a.imag, count: b.count)
    let aa = SplitComplexArray(a0, a1)
    SplitComplexArray.withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

// MARK: Log

func vectorLogSplitComplexArray(_ a: SplitComplexArray) -> SplitComplexArray {
    var angle = [Double](repeating: 0, count: a.count)
    var mag = [Double](repeating: 0, count: a.count)
    var logMag = [Double](repeating: 0, count: a.count)
    SplitComplexArray.withUnsafeParameters(a, &angle) { A, C, N in
        vDSP_zvphasD(A, 1, C, 1, N)
    }
    SplitComplexArray.withUnsafeParameters(a, &mag) { A, C, N in
        vDSP_zvabsD(A, 1, C, 1, N)
    }

    var n = Int32(a.count)
    vvlog(&logMag, &mag, &n)

    return SplitComplexArray(logMag, angle)
}

// MARK: Exp

func vectorExpSplitComplexArray(_ a: SplitComplexArray) -> SplitComplexArray {
    // 1. Calculate e^a for each real part
    let expReal = vForce.exp(a.real)

    // 2. Simultaneously calculate sine and cosine for each imaginary part
    var cosImag = [Double](repeating: 0, count: a.count)
    var sinImag = [Double](repeating: 0, count: a.count)
    vForce.sincos(a.imag, sinResult: &sinImag, cosResult: &cosImag)

    // 3. Multiply results element-wise
    let resultReal = vDSP.multiply(expReal, cosImag)
    let resultImag = vDSP.multiply(expReal, sinImag)

    return SplitComplexArray(resultReal, resultImag)
}
