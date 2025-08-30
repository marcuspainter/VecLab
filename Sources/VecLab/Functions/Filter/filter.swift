//
//  filter.swift
//
//
//  Created by Marcus Painter on 17/09/2023.
//

import Foundation

/// Filter
///
/// Direct Form II IIR filter.
/// - Parameters:
///   - b: b coefficients.
///   - a: a coefficients.
///   - x: Real input signal.
/// - Returns: Filtered signal.
public func filter(b: RealArray, a: RealArray, x: RealArray) -> RealArray {
    let M = b.count
    let L = a.count
    let N = x.count

    var w = RealArray(count: max(M, L))
    var y = RealArray(count: N)

    for n in 0 ..< N {
        // Compute w[0]
        var wn = x[n]
        for i in 1 ..< L {
            wn -= a[i] * w[i - 1]
        }

        // Update output y[n]
        y[n] = b[0] * wn
        for i in 1 ..< M {
            y[n] += b[i] * w[i - 1]
        }

        // Shift state variables for the next iteration
        for j in (1 ..< M).reversed() {
            w[j] = w[j - 1]
        }
        w[0] = wn
    }

    return y
}

/// Direct Form II IIR filter.
/// - Parameters:
///   - b: b coefficients.
///   - a: a coefficients.
///   - x: Complex input signal.
/// - Returns: Filtered complex signal.
public func filter(b: RealArray, a: RealArray, x: ComplexArray) -> ComplexArray {
    validateSize(x)
    let yr = filter(b: b, a: a, x: x.real)
    let yi = filter(b: b, a: a, x: x.imag)
    return ComplexArray(yr, yi)
}

/// Filter with State
///
/// Direct Form II IIR filter that maintains the filter state between calls.
/// - Parameters:
///   - b: b coefficients.
///   - a: a coefficients.
///   - x: Real array input signal.
///   - state: Real filter state.
/// - Returns: Filtered signal and filter state arrays as a tuple.
public func filter(b: RealArray, a: RealArray, x: RealArray, state: RealArray) -> (y: RealArray, newState: RealArray) {
    precondition(!a.isEmpty && a[0] != 0, "a[0] must be nonzero")
    let na = a.count, nb = b.count
    let nfilt = max(na, nb)

    // Pure gain (no state)
    if nfilt == 1 {
        let g = b[0] / a[0]
        return (x.map { $0 * g }, [])
    }

    var y = RealArray(count: x.count)
    let stateLen = nfilt - 1
    var z = state
    if z.count < stateLen {
        z.append(contentsOf: repeatElement(0.0, count: stateLen - z.count))
    } else if z.count > stateLen {
        z.removeLast(z.count - stateLen)
    }

    let a0 = a[0]

    for n in 0 ..< x.count {
        let xn = x[n]
        let temp = (b[0] / a0) * xn + z[0]
        y[n] = temp

        // Middle states
        if stateLen > 1 {
            for i in 1 ..< (nfilt - 1) {
                let bi = (i < nb) ? b[i] : 0.0
                let ai = (i < na) ? a[i] : 0.0
                z[i - 1] = (bi / a0) * xn + z[i] - (ai / a0) * temp
            }
        }

        // Last state
        let bLast = (nb == nfilt) ? b[nb - 1] : 0.0
        let aLast = (na == nfilt) ? a[na - 1] : 0.0
        z[nfilt - 2] = (bLast / a0) * xn - (aLast / a0) * temp
    }

    return (y, z)
}
