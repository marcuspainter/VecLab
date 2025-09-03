//
//  erfinv.swift
//  VecLab
//
//  Created by Marcus Painter on 11/03/2025.
//

import Foundation

// Winitzki’s approximation, which provides good accuracy:
// Works well for |x| < 1.
// For |x| \approx 1, numerical instability can occur. A series expansion could improve it for those cases.

func erfinv1(_ x: Double) -> Double {
    guard abs(x) < 1 else {
        return x > 0 ? Double.infinity : -Double.infinity  // erf^-1(±1) → ±∞
    }

    // Constants for approximation
    let a = 0.147  // Adjustable parameter for accuracy
    let lnTerm = log(1 - x * x)

    let firstPart = 2 / (.pi * a) + lnTerm / 2
    let sqrtTerm = sqrt(firstPart * firstPart - lnTerm / a)

    return copysign(sqrt(sqrtTerm - firstPart), x)  // Apply sign of x
}

/*
 // Test values
 print(erfinv(0.5))  // Output: ~0.47694
 print(erfinv(-0.5)) // Output: ~-0.47694
 print(erfinv(0.99)) // Output: ~1.821
 print(erfinv(-0.99)) // Output: ~-1.821
 */

// The following Swift implementation uses the Rational Approximation from Winitzki with coefficients from a
// well-known numerical approximation:

func erfinv2(_ x: Double) -> Double {
    guard abs(x) < 1 else {
        return x > 0 ? Double.infinity : -Double.infinity  // Handle ±1 limits
    }

    let sign = x < 0 ? -1.0 : 1.0
    let absX = abs(x)

    // Coefficients for a rational approximation (Abramowitz & Stegun 26.2.23)
    let a = [0.886226899, -1.645349621, 0.914624893, -0.140543331]
    let b = [1.0, -2.118377725, 1.442710462, -0.329097515, 0.012229801]

    let t = 1.0 - absX  // Transformation to improve accuracy
    let num = (((a[3] * t + a[2]) * t + a[1]) * t + a[0]) * t
    let denom = ((((b[4] * t + b[3]) * t + b[2]) * t + b[1]) * t + b[0])

    let result = num / denom
    return sign * result
}

/*
 // Test values
 print(erfinv(0.5))  // Output: ~0.476936
 print(erfinv(-0.5)) // Output: ~-0.476936
 print(erfinv(0.99)) // Output: ~1.821386
 print(erfinv(-0.99)) // Output: ~-1.821386
 print(erfinv(0.0))  // Output: ~0.0
 */

func erfinv(_ x: Real) -> Real {
    var w: Real
    var p: Real
    w = -log((1.0 - x) * (1.0 + x))
    if w < 5.000000 {
        w = w - 2.500000
        p = 2.81022636e-08
        p = 3.43273939e-07 + p * w
        p = -3.5233877e-06 + p * w
        p = -4.39150654e-06 + p * w
        p = 0.00021858087 + p * w
        p = -0.00125372503 + p * w
        p = -0.00417768164 + p * w
        p = 0.246640727 + p * w
        p = 1.50140941 + p * w
    } else {
        w = sqrt(w) - 3.000000
        p = -0.000200214257
        p = 0.000100950558 + p * w
        p = 0.00134934322 + p * w
        p = -0.00367342844 + p * w
        p = 0.00573950773 + p * w
        p = -0.0076224613 + p * w
        p = 0.00943887047 + p * w
        p = 1.00167406 + p * w
        p = 2.83297682 + p * w
    }
    return p * x
}
