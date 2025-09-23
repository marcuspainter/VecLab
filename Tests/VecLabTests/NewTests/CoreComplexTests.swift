//
//  CoreComplexTests.swift
//  VecLab
//
//  Created by Marcus Painter on 23/09/2025.
//

import Foundation
import Testing
@testable import VecLab

private func approxEqual(_ a: Complex, _ b: Complex, tol: Double = 1e-12) -> Bool {
    return abs(a.real - b.real) <= tol && abs(a.imag - b.imag) <= tol
}

@Suite("CoreComplex arithmetic")
struct CoreComplexTests {
    @Test
    func addSubtract() {
        let a = Complex(3, 4)
        let b = Complex(-2, 5)
        #expect(CoreComplex.add(a,b) == Complex(1, 9))
        #expect(CoreComplex.subtract(a,b) == Complex(5, -1))
        #expect(CoreComplex.add(a, 2.0) == Complex(5, 4))
        #expect(CoreComplex.subtract(2.0, a) == Complex(-1, -4))
    }

    @Test
    func addSubtractScalarVariants() {
        let a = Complex(3, 4)
        let two = 2.0
        // add(Double, Complex)
        #expect(CoreComplex.add(two, a) == Complex(5, 4))
        // subtract(Complex, Double)
        #expect(CoreComplex.subtract(a, two) == Complex(1, 4))
    }

    @Test
    func multiplyDivide() {
        let a = Complex(3, 4)
        let b = Complex(1, -2)
        let prod = CoreComplex.multiply(a, b)
        #expect(prod == Complex(11, -2)) // (3 + 4i)(1 - 2i) = 11 - 2i

        // Round-trip: (a / b) * b ≈ a
        let q = CoreComplex.divide(a, b)
        let back = CoreComplex.multiply(q, b)
        #expect(abs(back.real - a.real) < 1e-12)
        #expect(abs(back.imag - a.imag) < 1e-12)
    }

    @Test
    func multiplyDivideScalarVariants() {
        let a = Complex(3, 4)
        let two = 2.0
        // multiply by scalar
        #expect(CoreComplex.multiply(a, two) == Complex(6, 8))
        #expect(CoreComplex.multiply(two, a) == Complex(6, 8))
        // divide by scalar
        let d1 = CoreComplex.divide(a, two)
        #expect(approxEqual(d1, Complex(1.5, 2.0)))
        // Double / Complex
        let c = Complex(1, -2)
        let d2 = CoreComplex.divide(2.0, c) // 2/(1-2i) = 0.4 + 0.8i
        #expect(approxEqual(d2, Complex(0.4, 0.8)))
        // Branch where |x| >= |y|
        let d3 = CoreComplex.divide(Complex(5, 1), Complex(3, 0.5))
        let back = CoreComplex.multiply(d3, Complex(3, 0.5))
        #expect(approxEqual(back, Complex(5, 1), tol: 1e-12))
    }

    @Test
    func unaryAndConjugates() {
        let a = Complex(3, -4)
        #expect(CoreComplex.unaryMinus(a) == Complex(-3, 4))

        let x = Complex(3, 4)
        let y = Complex(1, 2)
        #expect(CoreComplex.conjugate(x) == Complex(3, -4))
        // Numeric checks for conjugate multiplies
        let left = CoreComplex.leftConjugateMultiply(x, y)    // conj(x) * y
        #expect(left == Complex(11, 2))
        let right = CoreComplex.rightConjugateMultiply(x, y)  // x * conj(y)
        // x * conj(y) = (3+4i)(1-2i) = 11 - 2i
        #expect(right == Complex(11, -2))
        // Consistency checks
        #expect(CoreComplex.leftConjugateMultiply(x,y) == CoreComplex.multiply(CoreComplex.conjugate(x), y))
        #expect(CoreComplex.rightConjugateMultiply(x,y) == CoreComplex.multiply(x, CoreComplex.conjugate(y)))
    }

    @Test
    func sqrtExpLog() {
        // sqrt principal branch
        #expect(CoreComplex.sqrt(Complex(4, 0)) == Complex(2, 0))
        #expect(CoreComplex.sqrt(Complex(-4, 0)) == Complex(0, 2))
        #expect(CoreComplex.sqrt(Complex(0, 0)) == Complex(0, 0))

        // exp
        #expect(approxEqual(CoreComplex.exp(Complex(0, 0)), Complex(1, 0)))
        let expPiI = CoreComplex.exp(Complex(0, .pi)) // e^{iπ} = -1 + 0i
        #expect(abs(expPiI.real + 1) < 1e-12)
        #expect(abs(expPiI.imag - 0) < 1e-12)

        // log principal
        #expect(approxEqual(CoreComplex.log(Complex(1, 0)), Complex(0, 0)))
        let logMinusOne = CoreComplex.log(Complex(-1, 0))
        #expect(abs(logMinusOne.real - 0) < 1e-12)
        #expect(abs(logMinusOne.imag - .pi) < 1e-12)
        let logZero = CoreComplex.log(Complex(0, 0))
        #expect(logZero.real.isInfinite && logZero.real < 0)
        #expect(logZero.imag == 0)
    }

    @Test
    func logBases() {
        let l2 = CoreComplex.log2(Complex(8, 0))
        #expect(abs(l2.real - 3.0) < 1e-12 && abs(l2.imag) < 1e-12)
        let l10 = CoreComplex.log10(Complex(100, 0))
        #expect(abs(l10.real - 2.0) < 1e-12 && abs(l10.imag) < 1e-12)
    }

    @Test
    func absAndAngle() {
        let z = Complex(3, 4)
        #expect(abs(CoreComplex.abs(z) - 5.0) < 1e-12)
        #expect(abs(CoreComplex.angle(Complex(1, 0)) - 0.0) < 1e-12)
        #expect(abs(CoreComplex.angle(Complex(0, 1)) - (.pi/2)) < 1e-12)
        #expect(abs(CoreComplex.angle(Complex(-1, 0)) - .pi) < 1e-12)
    }

    @Test
    func powComplexRealEdgeCases() {
        // 0^0 = 1
        #expect(CoreComplex.pow(Complex(0,0), 0.0) == Complex(1,0))
        // 0^positive = 0
        #expect(CoreComplex.pow(Complex(0,0), 2.0) == Complex(0,0))
        // 0^negative = Inf + 0i
        let zneg = CoreComplex.pow(Complex(0,0), -2.0)
        #expect(zneg.real.isInfinite && zneg.imag == 0)
        // (-1)^(1/2) = i (principal)
        let root = CoreComplex.pow(Complex(-1, 0), 0.5)
        #expect(abs(root.real) < 1e-12 && abs(root.imag - 1.0) < 1e-12)
        // real positive base
        let rp = CoreComplex.pow(Complex(2, 0), 3.0)
        #expect(approxEqual(rp, Complex(8, 0)))
    }

    @Test
    func powRealComplexEdgeCases() {
        // 0^0 = 1
        #expect(CoreComplex.pow(0.0, Complex(0,0)) == Complex(1,0))
        // 0^positive real = 0
        #expect(CoreComplex.pow(0.0, Complex(2,0)) == Complex(0,0))
        // 0^negative real = Inf + 0i
        let zneg = CoreComplex.pow(0.0, Complex(-2,0))
        #expect(zneg.real.isInfinite && zneg.imag == 0)
        // 0^pure imaginary = NaN + NaN i (MATLAB-compatible behavior)
        let zpi = CoreComplex.pow(0.0, Complex(0,1))
        #expect(zpi.real.isNaN && zpi.imag.isNaN)
        // (-1)^(1/2) = i (principal)
        let i1 = CoreComplex.pow(-1.0, Complex(0.5, 0.0))
        #expect(abs(i1.real) < 1e-12 && abs(i1.imag - 1.0) < 1e-12)
    }

    @Test
    func powComplexComplexMatchesExpLog() {
        let a = Complex(2.0, 3.0)
        let b = Complex(1.1, -0.7)
        let p = CoreComplex.pow(a, b)
        // Expected via principal: exp(b * Log(a))
        let expected = CoreComplex.exp(CoreComplex.multiply(b, CoreComplex.log(a)))
        #expect(approxEqual(p, expected, tol: 1e-10))
    }

    @Test
    func sinComplex() {
        // sin(i) = i*sinh(1)
        let s = CoreComplex.sin(Complex(0, 1))
        #expect(abs(s.real - 0.0) < 1e-12)
        #expect(abs(s.imag - Darwin.sinh(1.0)) < 1e-12)
        // General sanity: sin(0) = 0
        let s0 = CoreComplex.sin(Complex(0, 0))
        #expect(s0 == Complex(0, 0))
    }
}
