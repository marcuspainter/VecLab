//
//  fminbnd.swift
//  
//
//  Created by Marcus Painter on 18/09/2023.
//

import Foundation

// https://en.wikipedia.org/wiki/Golden-section_search

/// Find minimum of single-variable function on fixed interval.
public func fminbnd(_ f: @escaping (Real) -> Real, x1: Real, x2: Real, tol: Real = 1e-5) -> Real {
    let (a, b) = gss(f: f, a: x1, b: x2, tol: tol)
    return (a + b) / 2
}

/// Golden section search.
func gss(f: @escaping (Real) -> Real, a: Real, b: Real, tol: Real = 1e-5) -> (Real, Real) {

    let invphi: Real = (sqrt(5) - 1) / 2  // 1 / phi
    let invphi2: Real = (3 - sqrt(5)) / 2  // 1 / phi^2

    var a = min(a, b)
    var b = max(a, b)
    var h = b - a

    if h <= tol {
        return (a, b)
    }

    // Required steps to achieve tolerance
    let n = Int(ceil(log(tol / h) / log(invphi)))

    var c = a + invphi2 * h
    var d = a + invphi * h
    var yc = f(c)
    var yd = f(d)

    for _ in 0..<n-1 {
        if yc < yd {
            b = d
            d = c
            yd = yc
            h *= invphi
            c = a + invphi2 * h
            yc = f(c)
        } else {
            a = c
            c = d
            yc = yd
            h *= invphi
            d = a + invphi * h
            yd = f(d)
        }
    }

    if yc < yd {
        return (a, d)
    } else {
        return (c, b)
    }
}

/*

// Binary
func binsearch(fun: @escaping (Real) -> Real, x1: Real, x2: Real, tolerance: Real = 1e-6) -> Real {
    var a = x1
    var b = x2
    while abs(b - a) > tolerance {
        let mid1 = a + (b - a) / 4
        let mid2 = b - (b - a) / 4

        let fmid1 = fun(mid1)
        let fmid2 = fun(mid2)

        if fmid1 < fmid2 {
            b = mid2
        } else {
            a = mid1
        }
    }
    return (a + b) / 2.0
}
*/
