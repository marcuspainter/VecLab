//
//  CoreComplex.swift
//  VecLab
//
//  Created by Marcus Painter on 17/09/2025.
//

import Foundation

enum CoreComplex {

    @inlinable
    static func add(_ a: Complex, _ b: Complex) -> Complex {
        return Complex(a.real + b.real, a.imag + b.imag)
    }
    
    @inlinable
    static func add(_ a: Complex, _ b: Double) -> Complex {
        return Complex(a.real + b, a.imag)
    }
    
    @inlinable
    static func add(_ a: Double, _ b: Complex) -> Complex {
        return Complex(a + b.real, b.imag)
    }
    
    // MARK: Subtract

    @inlinable
    static func subtract(_ a: Complex, _ b: Complex) -> Complex {
        return Complex(a.real - b.real, a.imag - b.imag)
    }

    @inlinable
    static func subtract(_ a: Complex, _ b: Double) -> Complex {
        return Complex(a.real - b, a.imag)
    }

    @inlinable
    static func subtract(_ a: Double, _ b: Complex) -> Complex {
        return Complex(a - b.real, -b.imag)
    }

    // MARK: Multiply
    
    @inlinable
    static func multiply(_ a: Complex, _ b: Complex) -> Complex {
        return Complex(a.real * b.real - a.imag * b.imag, a.real * b.imag + a.imag * b.real)
    }
    
    @inlinable
    static func multiply(_ a: Complex, _ b: Double) -> Complex {
        return Complex(a.real * b, a.imag * b)
    }
    
    @inlinable
    static func multiply(_ a: Double, _ b: Complex) -> Complex {
        return Complex(a * b.real, a * b.imag)
    }
    
    // MARK: Divide

    @inlinable
    static func divide(_ a: Complex, _ b: Complex) -> Complex {
        let x = b.real
        let y = b.imag
        if Darwin.fabs(x) >= Darwin.fabs(y) {
            // r = y/x, denom = x + y*r
            let r = y / x
            let denom = x + y * r
            // (a+bi)/(x+yi) = ((a + b*r) + i(b - a*r)) / denom
            return Complex((a.real + a.imag * r) / denom, (a.imag - a.real * r) / denom)
        } else {
            // r = x/y, denom = y + x*r
            let r = x / y
            let denom = y + x * r
            // (a+bi)/(x+yi) = ((a.real*r + a.imag) + i(a.imag*r - a.real)) / denom
            return Complex((a.real * r + a.imag) / denom, (a.imag * r - a.real) / denom)
        }
    }
    
    @inlinable
    static func divide(_ a: Complex, _ b: Double) -> Complex {
        return Complex(a.real / b, a.imag / b)
    }

    @inlinable
    static func divide(_ a: Double, _ b: Complex) -> Complex {
        let x = b.real
        let y = b.imag
        if Darwin.fabs(x) >= Darwin.fabs(y) {
            let r = y / x
            let denom = x + y * r
            return Complex(a / denom, (-a * r) / denom)
        } else {
            let r = x / y
            let denom = y + x * r
            return Complex((a * r) / denom, -a / denom)
        }
    }

    @inlinable
    static func unaryMinus(_ a: Complex) -> Complex {
        return Complex(-a.real, -a.imag)
    }

    @inlinable
    static func conjugate(_ a: Complex) -> Complex {
        return Complex(a.real, -a.imag)
    }

    @inlinable
    // c = conj(a) * b
    static func leftConjugateMultiply(_ a: Complex, _ b: Complex) -> Complex {
        return Complex(a.real * b.real + a.imag * b.imag, a.real * b.imag - a.imag * b.real)
    }

    @inlinable
    // c = a * conj(b)
    static func rightConjugateMultiply(_ a: Complex, _ b: Complex) -> Complex {
        return Complex(a.real * b.real + a.imag * b.imag, a.imag * b.real - a.real * b.imag)
    }

}

/*
 
import simd
 
func complexMultiplyWithFMA(_ z1: SIMD2<Double>, _ z2: SIMD2<Double>) -> SIMD2<Double> {
    let a = z1.x
    let b = z1.y  // z1 = a + bi
    let c = z2.x
    let d = z2.y  // z2 = c + di

    // Real part: ac - bd = fma(-b, d, a * c)
    let real = fma(-b, d, a * c)

    // Imaginary part: ad + bc = fma(a, d, b * c)
    let imag = fma(a, d, b * c)

    return simd_double2(real, imag)
}

@inline(never)
public func complexMultiplyWithFMA(_ z1: Complex, _ z2: Complex) -> Complex {
    let a = z1.real
    let b = z1.imag  // z1 = a + bi
    let c = z2.real
    let d = z2.imag  // z2 = c + di

    // Real part: ac - bd = fma(-b, d, a * c)
    let real = fma(-b, d, a * c)

    // Imaginary part: ad + bc = fma(a, d, b * c)
    let imag = fma(a, d, b * c)

    return Complex(real, imag)
}
*/

import Testing

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
    func multiplyDivide() {
        let a = Complex(3, 4)
        let b = Complex(1, -2)
        let prod = CoreComplex.multiply(a, b)
        #expect(prod == Complex(11, -2)) // (3 + 4i)(1 - 2i) = 3 - 6i + 4i - 8i^2 = 11 - 2i

        // Round-trip: (a / b) * b ≈ a
        let q = CoreComplex.divide(a, b)
        let back = CoreComplex.multiply(q, b)
        #expect(abs(back.real - a.real) < 1e-12)
        #expect(abs(back.imag - a.imag) < 1e-12)
    }

    @Test
    func conjugates() {
        let a = Complex(3, 4)
        let b = Complex(1, 2)
        #expect(CoreComplex.conjugate(a) == Complex(3, -4))
        #expect(CoreComplex.leftConjugateMultiply(a,b) == CoreComplex.multiply(CoreComplex.conjugate(a), b))
        #expect(CoreComplex.rightConjugateMultiply(a,b) == CoreComplex.multiply(a, CoreComplex.conjugate(b)))
    }
}
