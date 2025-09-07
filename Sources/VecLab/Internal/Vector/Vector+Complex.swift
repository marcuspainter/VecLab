//
//  Vector+Complex.swift
//
//
//  Created by Marcus Painter on 08/09/2023.
//

import Accelerate
import Foundation

extension Array where Element == Double {

    fileprivate init(unsafeCount capacity: Int) {
        self = .init(unsafeUninitializedCapacity: capacity) { buffer, initializedCount in
            initializedCount = capacity
        }
    }
}

extension ComplexArray {

    fileprivate init(unsafeCount capacity: Int) {
        self.real = .init(unsafeUninitializedCapacity: capacity) { buffer, initializedCount in
            initializedCount = capacity
        }
        self.imag = .init(unsafeUninitializedCapacity: capacity) { buffer, initializedCount in
            initializedCount = capacity
        }
    }

    fileprivate init(unsafeCountX capacity: Int) {
        self.real = [Double](repeating: 0, count: capacity)
        self.imag = [Double](repeating: 0, count: capacity)
    }

    fileprivate init(
        unsafeUninitializedCapacity: Int,
        initializingWith initializer: (
            _ complex: inout ComplexArray
        ) throws -> Void
    ) rethrows {

        // Allocate uninitialized arrays
        self.real = .init(unsafeUninitializedCapacity: unsafeUninitializedCapacity) { _, initializedCount in
            initializedCount = unsafeUninitializedCapacity
        }
        self.imag = .init(unsafeUninitializedCapacity: unsafeUninitializedCapacity) { _, initializedCount in
            initializedCount = unsafeUninitializedCapacity
        }

        try initializer(&self)

    }
}

// MARK: Clear

func vectorClearRealArray(_ a: inout [Double]) {
    vDSP_vclrD(&a, 1, vDSP_Length(a.count))
}

// MARK: Fill

func vectorFillRealArray(_ a: Double, c: inout [Double]) {
    var aa = a  // Copy
    vDSP_vfillD(&aa, &c, 1, vDSP_Length(c.count))
}

/*
 func vectorFillComplexArray(_ a: Complex, c: inout ComplexArray) {
     ComplexDoubleArray.withUnsafeParameters(a, &c) { A, C, N in
         vDSP_zvfillD(A, C, 1, N)
     }
 }
 */

// MARK: Angle

func vectorAngleComplexArray(_ a: ComplexArray) -> RealArray {
    var c = RealArray(unsafeCount: a.count)
    ComplexDoubleArray.withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvphasD(A, 1, C, 1, N)
    }
    return c
}

// MARK: Abs

func vectorAbsComplexArray(_ a: ComplexArray) -> RealArray {
    var c = RealArray(unsafeCount: a.count)
    ComplexDoubleArray.withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvabsD(A, 1, C, 1, N)
    }
    return c
}

// MARK: Conjugate

func vectorConjugateComplexArray(_ a: ComplexArray) -> ComplexArray {
    var c = ComplexArray(unsafeCount: a.count)
    ComplexDoubleArray.withUnsafeParameters(a, &c) { A, C, N in
        vDSP_zvconjD(A, 1, C, 1, N)
    }
    return c
}

// MARK: Add

func vectorAddComplexArray(_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
    var c = ComplexDoubleArray(unsafeCount: a.count)
    ComplexDoubleArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvaddD(A, 1, B, 1, C, 1, N)
    }
    return c
}

// MARK: Subtract

func vectorSubtractComplexArray(_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
    var c = ComplexDoubleArray(unsafeCount: a.count)
    ComplexDoubleArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvsubD(A, 1, B, 1, C, 1, N)
    }
    return c
}

// MARK: Multiply

func vectorMultiplyComplexArray(_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
    var c = ComplexArray(unsafeCount: a.count)
    ComplexDoubleArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(1)  // No conjugate multiply
        vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

public func vectorMultiplyComplexArray2(_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
    var c = ComplexArray(unsafeCount: a.count)  // Uninitialized array
    ComplexDoubleArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(1)  // No conjugate multiply
        vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

public func vectorMultiplyComplexArray3(_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
    let x = ComplexArray(unsafeUninitializedCapacity: a.count) { c in
        ComplexDoubleArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
            let conjugateFlag = Int32(1)  // No conjugate multiply
            vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
        }
    }
    return x
}

func vectorMultiplyComplexArrayRealArray(_ a: ComplexArray, _ b: RealArray) -> ComplexArray {
    var c = ComplexArray(unsafeCount: a.count)
    ComplexDoubleArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zrvmulD(A, 1, B, 1, C, 1, N)
    }
    return c
}

func vectorMultiplyComplexArrayComplex(_ a: ComplexArray, _ b: Complex) -> ComplexArray {
    var c = ComplexArray(unsafeCount: a.count)
    let bb = ComplexArray(repeating: b, count: a.count)
    ComplexDoubleArray.withUnsafeParameters(a, bb, &c) { A, B, C, N in
        let conjugateFlag = Int32(1)  // No conjugate multiply: 1
        vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

func vectorMultiplyComplexComplexArray(_ a: Complex, _ b: ComplexArray) -> ComplexArray {
    var c = ComplexArray(unsafeCount: b.count)
    let aa = ComplexArray(repeating: a, count: b.count)
    ComplexDoubleArray.withUnsafeParameters(aa, b, &c) { A, B, C, N in
        let conjugateFlag = Int32(1)  // No conjugate multiply: 1
        vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

// MARK: Conjugate Multiply

func vectorConjugateMultiplyComplexArray(_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
    var c = ComplexArray(unsafeCount: a.count)
    ComplexDoubleArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        // Conjugate multiply: -1
        let conjugateFlag = Int32(-1)
        vDSP_zvmulD(A, 1, B, 1, C, 1, N, conjugateFlag)
    }
    return c
}

// MARK: Divide

func vectorDivideComplexArray(_ a: ComplexArray, _ b: ComplexArray) -> ComplexArray {
    var c = ComplexArray(unsafeCount: a.count)
    ComplexDoubleArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideComplexArrayReal(_ a: ComplexArray, _ b: Real) -> ComplexArray {
    let real = vDSP.divide(a.real, b)
    let imag = vDSP.divide(a.imag, b)
    return ComplexArray(real, imag)
}

func vectorDivideRealComplexArray(_ a: Real, _ b: ComplexArray) -> ComplexArray {
    var c = ComplexArray(unsafeCount: b.count)
    let aa = ComplexArray(repeating: Complex(a, 0.0), count: b.count)
    ComplexDoubleArray.withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideComplexArrayRealArray(_ a: ComplexArray, _ b: RealArray) -> ComplexArray {
    var c = ComplexArray(unsafeCount: a.count)
    ComplexDoubleArray.withUnsafeParameters(a, b, &c) { A, B, C, N in
        vDSP_zrvdivD(A, 1, B, 1, C, 1, N)
    }
    return c
}

func vectorDivideRealArrayComplexArray(_ a: RealArray, _ b: ComplexArray) -> ComplexArray {
    var c = ComplexArray(unsafeCount: b.count)
    let aa = ComplexArray(realOnly: a)
    ComplexDoubleArray.withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideComplexRealArray(_ a: Complex, _ b: RealArray) -> ComplexArray {
    let real = vDSP.divide(a.real, b)
    let imag = vDSP.divide(a.imag, b)
    return ComplexArray(real, imag)
}

func vectorDivideRealArrayComplex(_ a: RealArray, _ b: Complex) -> ComplexArray {
    var c = ComplexArray(unsafeCount: a.count)
    let bb = ComplexArray(repeating: b, count: a.count)
    let aa = ComplexArray(realOnly: a)
    validateSize(aa, bb)
    validateSize(aa, c)
    ComplexDoubleArray.withUnsafeParameters(aa, bb, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideComplexArrayComplex(_ a: ComplexArray, _ b: Complex) -> ComplexArray {
    var c = ComplexArray(unsafeCount: a.count)
    let bb = ComplexArray(repeating: b, count: a.count)
    ComplexDoubleArray.withUnsafeParameters(a, bb, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

func vectorDivideComplexComplexArray(_ a: Complex, _ b: ComplexArray) -> ComplexArray {
    var c = ComplexArray(unsafeCount: b.count)
    let aa = ComplexArray(repeating: a, count: b.count)
    ComplexDoubleArray.withUnsafeParameters(aa, b, &c) { A, B, C, N in
        vDSP_zvdivD(B, 1, A, 1, C, 1, N)
    }
    return c
}

// MARK: Log

func vectorLogComplexArray(_ a: ComplexArray) -> ComplexArray {
    var angle = [Double](repeating: 0, count: a.count)
    var mag = [Double](repeating: 0, count: a.count)
    var logMag = [Double](repeating: 0, count: a.count)
    ComplexDoubleArray.withUnsafeParameters(a, &angle) { A, C, N in
        vDSP_zvphasD(A, 1, C, 1, N)
    }
    ComplexDoubleArray.withUnsafeParameters(a, &mag) { A, C, N in
        vDSP_zvabsD(A, 1, C, 1, N)
    }

    var n = Int32(a.count)
    vvlog(&logMag, &mag, &n)

    return ComplexArray(logMag, angle)
}

// MARK: Exp

func vectorExpComplexArray(_ a: ComplexArray) -> ComplexArray {
    // 1. Calculate e^a for each real part
    let expReal = vForce.exp(a.real)

    // 2. Simultaneously calculate sine and cosine for each imaginary part
    var cosImag = [Double](repeating: 0, count: a.count)
    var sinImag = [Double](repeating: 0, count: a.count)
    vForce.sincos(a.imag, sinResult: &sinImag, cosResult: &cosImag)

    // 3. Multiply results element-wise
    let resultReal = vDSP.multiply(expReal, cosImag)
    let resultImag = vDSP.multiply(expReal, sinImag)

    return ComplexArray(resultReal, resultImag)
}
