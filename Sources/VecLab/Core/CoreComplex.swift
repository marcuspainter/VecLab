//
//  CoreComplex.swift
//  VecLab
//
//  Created by Marcus Painter on 17/09/2025.
//

import Foundation
import simd

enum CoreComplex {

    @inlinable
    static func add(_ a: Complex, _ b: Complex) -> Complex {
        return Complex(a.real + b.real, a.imag + b.imag)
    }

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

    @inlinable
    static func multiply(_ a: Complex, _ b: Double) -> Complex {
        return Complex(a.real * b, a.imag * b)
    }

    @inlinable
    static func multiply(_ a: Complex, _ b: Complex) -> Complex {
        return Complex(a.real * b.real - a.imag * b.imag, a.real * b.imag + a.imag * b.real)
    }

    @inlinable
    static func divide(_ a: Complex, _ b: Double) -> Complex {
        return Complex(a.real / b, a.imag / b)
    }

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
