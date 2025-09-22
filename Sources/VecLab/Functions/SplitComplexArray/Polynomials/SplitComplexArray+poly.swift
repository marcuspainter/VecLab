//
//  poly.swift
//  VecLab
//
//  Created by Marcus Painter on 05/09/2025.
//

import Foundation

/// Polynomial with specified roots.
/// - Parameter roots: Roots of polynomial.
/// - Returns: The coefficients of the polynomial whose roots are the elements of `roots`.
public func poly(roots: SplitComplexArray) -> SplitComplexArray {
    let n = roots.count
    var c = SplitComplexArray(count: n + 1)
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
            c = SplitComplexArray(realOnly: c.real)
        }
    }

    return c
}

// Helpers — adjust names/types to match your Complex/SplitComplexArray API
fileprivate func approxEqual(_ a: Complex, _ b: Complex, tol: Double = 1e-12) -> Bool {
    return abs(a.real - b.real) < tol && abs(a.imag - b.imag) < tol
}

fileprivate func matlabSortLex(_ array: SplitComplexArray) -> SplitComplexArray {
    return array.sorted { a, b in
        if a.real != b.real { return a.real < b.real }
        return a.imag < b.imag
    }
}

fileprivate func matlabSort(_ array: SplitComplexArray) -> SplitComplexArray {
    return array.sorted { a, b in
        let magA = Darwin.hypot(a.real, a.imag)
        let magB = Darwin.hypot(b.real, b.imag)
        if magA != magB {
            return magA < magB
        }
        // Tie-break by phase (atan2 returns (-π, π])
        let phaseA = wrapTo2Pi(angle(a))
        let phaseB = wrapTo2Pi(angle(b))
        return phaseA < phaseB
    }
}
