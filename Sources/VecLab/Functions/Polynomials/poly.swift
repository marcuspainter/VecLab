//
//  poly.swift
//  VecLab
//
//  Created by Marcus Painter on 05/09/2025.
//

/// Computes polynomial coefficients from roots (inverse of roots()).
/// - Parameter roots: Array of complex roots
/// - Returns: RealArray of polynomial coefficients in descending powers
public func polyX(roots: ComplexArray) -> ComplexArray {
    let n = roots.count
    var c = ComplexArray(count: n+1)
    c[0] = Complex(1.0, 0.0)

    for j in 0..<n {
        for k in (0...j).reversed() {
            c[k+1] = c[k+1] - roots[j] * c[k]
        }
    }

    // Find positive and negative imaginary roots
    let posImag = roots.filter { $0.imag > 0 }
    let negImag = roots.filter { $0.imag < 0 }.map { conj($0) }

    // Sort both arrays (define a sorting comparator)
    let sortedPos = posImag.sorted { $0.real != $1.real ? $0.real < $1.real : $0.imag < $1.imag }
    let sortedNeg = negImag.sorted { $0.real != $1.real ? $0.real < $1.real : $0.imag < $1.imag }

    // Check approximate equality
    let tol = 1e-12
    let areConjugates = zip(sortedPos, sortedNeg).allSatisfy { abs($0.real - $1.real) < tol && abs($0.imag - $1.imag) < tol }

    if areConjugates {
        c = c.map { Complex($0.real, 0.0) } // make real
    }

    return c
}

// Helpers — adjust names/types to match your Complex/ComplexArray API
func approxEqual(_ a: Complex, _ b: Complex, tol: Double = 1e-12) -> Bool {
    return abs(a.real - b.real) < tol && abs(a.imag - b.imag) < tol
}

func matlabSort(_ arr: ComplexArray) -> ComplexArray {
    return arr.sorted { a, b in
        if a.real != b.real { return a.real < b.real }
        return a.imag < b.imag
    }
}

// Fixed poly(roots:)
public func poly(roots: ComplexArray) -> ComplexArray {
    let n = roots.count
    var c = ComplexArray(count: n + 1)
    c[0] = Complex(1.0, 0.0)

    // Recurrence (same as MATLAB)
    for j in 0..<n {
        for k in (0...j).reversed() {
            c[k+1] = c[k+1] - roots[j] * c[k]
        }
    }

    // Conjugate-pair check (robust)
    let tol = 1e-12
    let pos = roots.filter { $0.imag > tol }            // treat tiny noise as zero
    let negConj = roots.filter { $0.imag < -tol }.map { conj($0) }

    // Only compare if counts match and non-empty
    if pos.count == negConj.count && pos.count > 0 {
        let sp = matlabSort(pos)
        let sn = matlabSort(negConj)
        var areConjugates = true
        for i in 0..<sp.count {
            if !approxEqual(sp[i], sn[i], tol: tol) {
                areConjugates = false
                break
            }
        }
        if areConjugates {
            c = ComplexArray(realOnly: c.real)
        }
    }

    return c
}
