//
//  fminbnd.swift
//  
//
//  Created by Marcus Painter on 18/09/2023.
//

import Foundation

// https://en.wikipedia.org/wiki/Golden-section_search

/// Find minimum of single-variable function on fixed interval.
public func fminbnd(_ f: @escaping (RealDouble) -> RealDouble, x1: RealDouble, x2: RealDouble, tol: RealDouble = 1e-5) -> RealDouble {
    let (a, b) = gss(f: f, a: x1, b: x2, tol: tol)
    return (a + b) / 2
}

/// Golden section search.
func gss(f: @escaping (RealDouble) -> RealDouble, a: RealDouble, b: RealDouble, tol: RealDouble = 1e-5) -> (RealDouble, RealDouble) {

    let invphi: Double = (sqrt(5) - 1) / 2  // 1 / phi
    let invphi2: Double = (3 - sqrt(5)) / 2  // 1 / phi^2

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


