/**
 CoreComplex+Functions

 Complex complex-number functions used by VecLab.

 Design and behavior:
 - Principal branches are used throughout:
   - angle(z) returns arg(z) in (−π, π]
   - log(z) = ln|z| + i*arg(z) (principal value)
   - sqrt(z) returns the principal square root with Im >= 0 when Im(z) == 0
 - Numerical stability: magnitudes are computed with hypot to avoid overflow/underflow where possible.
 - MATLAB compatibility:
   - Functions mirror MATLAB’s principal-branch conventions for angle, log, and sqrt.
   - Power functions follow MATLAB semantics for zero and negative bases, using the principal complex logarithm for negative real bases and explicit handling of 0^b cases.

 Notes:
 - Complex exponentiation is multi-valued in theory; this implementation consistently returns the principal value.
 - Edge cases (e.g., 0^0, 0^negative) are handled to match MATLAB’s behavior.
 */

//
//  CoreComplex+Functions.swift
//  VecLab
//
//  Created by Marcus Painter on 19/09/2025.
//

import Foundation

extension CoreComplex {

    // MARK: Sqrt

    /// Returns the principal square root of a complex number.
    ///
    /// - Uses the principal branch where `Im(sqrt(z)) >= 0` when `Im(z) == 0`.
    /// - Computes magnitude via `hypot` for numerical stability.
    /// - MATLAB-compatible behavior for the principal square root.
    /// - Parameter x: The complex input.
    /// - Returns: `sqrt(x)` as a complex number on the principal branch.
    @inlinable
    public static func sqrt(_ x: Complex) -> Complex {
        let a = x.real
        let b = x.imag
        let mag = hypot(a, b)
        let r = Darwin.sqrt((mag + a) * 0.5)
        var i = Darwin.sqrt((mag - a) * 0.5)

        // Principal branch: sign(0) is treated as +1 so Im(sqrt) >= 0 when b == 0.
        i = b < 0.0 ? -i : i
        return Complex(r, i)
    }

    // MARK: Exp

    /// Complex exponential of `x`.
    ///
    /// Implements `exp(a+ib) = e^a (cos b + i sin b)`.
    /// MATLAB-compatible.
    @inlinable
    public static func exp(_ x: Complex) -> Complex {
        let r = Darwin.exp(x.real)
        let a = x.imag
        return Complex(r * Darwin.cos(a), r * Darwin.sin(a))
    }

    // MARK: Log

    /// Principal complex logarithm of `x`.
    ///
    /// Implements `log(z) = ln|z| + i*arg(z)` with `arg` in (−π, π].
    /// - Special case: `log(0) = (-Inf, 0)` consistent with MATLAB.
    /// - Returns the principal value.
    @inlinable
    public static func log(_ x: Complex) -> Complex {
        let r = Darwin.log(Darwin.hypot(x.real, x.imag))
        let i = Darwin.atan2(x.imag, x.real)
        return Complex(r, i)
    }

    // MARK: Abs

    /// Magnitude (modulus) of a complex number.
    ///
    /// Uses `hypot(Re, Im)` for stability. MATLAB-compatible.
    @inlinable
    public static func abs(_ x: Complex) -> Real {
        return Darwin.hypot(x.real, x.imag)
    }

    // MARK: Angle

    /// Principal argument (phase) of a complex number in radians.
    ///
    /// Returns a value in (−π, π] using `atan2(Im, Re)`. MATLAB-compatible with `angle`.
    @inlinable
    public static func angle(_ x: Complex) -> Real {
        return Darwin.atan2(x.imag, x.real)
    }

    // MARK: Pow

    /// Complex power with complex base and real exponent: `a^b`.
    ///
    /// Computes the principal value via polar form: if `a = r*e^{iθ}`, returns `r^b * e^{i b θ}`.
    /// MATLAB-compatibility notes:
    /// - For `a = 0`:
    ///   - `0^0 = 1`
    ///   - `0^b` with `b < 0` returns `Inf + 0i`
    ///   - `0^b` with `b > 0` returns `0`
    @inlinable
    public static func pow(_ a: Complex, _ b: Real) -> Complex {
        // MATLAB compatibility for zero base:
        // 0^0 = 1, 0^negative = Inf + 0i, 0^positive = 0
        if a.real == 0 && a.imag == 0 {
            if b == 0 {
                return Complex(1, 0)
            } else if b < 0 {
                return Complex(Real.infinity, 0)
            } else {
                return Complex(0, 0)
            }
        }
        let r = abs(a)
        let angle = angle(a)
        let n = b
        let rn = Darwin.pow(r, n)
        return Complex(rn * Darwin.cos(n * angle), rn * Darwin.sin(n * angle))
    }

    // MARK: Pow

    /// Complex power with real base and complex exponent: `a^b`.
    ///
    /// Principal value defined as `exp(b * Log(a))`, where `Log` is the principal complex logarithm.
    /// MATLAB-compatibility notes:
    /// - `a > 0`: uses real `ln(a)`.
    /// - `a == 0`:
    ///   - `0^0 = 1`
    ///   - `0^b` with `Re(b) > 0` and `Im(b) = 0` returns `0`
    ///   - `0^b` with `Re(b) < 0` and `Im(b) = 0` returns `Inf + 0i`
    ///   - Complex `b`: returns `0` if `Re(b) > 0`, `Inf + 0i` if `Re(b) < 0`, and `NaN + NaN i` if `Re(b) == 0` (purely imaginary)
    /// - `a < 0`: principal branch uses `Log(a) = ln(|a|) + iπ` yielding complex results.
    @inlinable
    public static func pow(_ a: Real, _ b: Complex) -> Complex {
        // MATLAB-compatible principal value: a^b = exp(b * Log(a))
        // Handle a == 0 explicitly to mirror MATLAB behavior
        if a == 0 {
            if b.real == 0 && b.imag == 0 {  // 0^0
                return Complex(1, 0)
            }
            if b.real > 0 && b.imag == 0 {  // positive real exponent
                return Complex(0, 0)
            }
            if b.real < 0 && b.imag == 0 {  // negative real exponent
                return Complex(Real.infinity, 0)
            }
            // Complex exponent with a == 0:
            // MATLAB returns 0 when Re(b) > 0, Inf when Re(b) < 0, and NaN when Re(b) == 0 (purely imaginary)
            if b.real > 0 { return Complex(0, 0) }
            if b.real < 0 { return Complex(Real.infinity, 0) }
            // b.real == 0 here
            let nan = Real.nan
            return Complex(nan, nan)
        }

        if a > 0 {
            // Standard real-positive base path
            let ab = Darwin.pow(a, b.real)
            let c = b.imag
            let lnA = Darwin.log(a)
            return Complex(ab * Darwin.cos(c * lnA), ab * Darwin.sin(c * lnA))
        } else {
            // a < 0: principal branch using Log(a) = ln(|a|) + i*pi
            let absA = -a
            let lnA = Darwin.log(absA)
            let phi = Real.pi
            // b = x + i y
            let x = b.real
            let y = b.imag
            // magnitude = exp(x*lnA - y*phi)
            let mag = Darwin.exp(x * lnA - y * phi)
            // angle = y*lnA + x*phi
            let ang = y * lnA + x * phi
            return Complex(mag * Darwin.cos(ang), mag * Darwin.sin(ang))
        }
    }

    @inlinable
    public static func sin(_ x: Complex) -> Complex {
        let coshx = Darwin.cosh(x.imag)
        let sinhx = Darwin.sinh(x.imag)
        let sinx = Darwin.sin(x.real)
        let cosx = Darwin.cos(x.real)
        let real = sinx * coshx  // sinx0 * coshx1
        let imag = cosx * sinhx  // cosx0 * sinhx1
        return Complex(real, imag)
    }
}
