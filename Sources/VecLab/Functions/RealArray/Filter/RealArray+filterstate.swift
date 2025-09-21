//
//  RealArray+filterstate.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

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
    let na = a.count
    let nb = b.count
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

    for n in 0..<x.count {
        let xn = x[n]
        let temp = (b[0] / a0) * xn + z[0]
        y[n] = temp

        // Middle states
        if stateLen > 1 {
            for i in 1..<(nfilt - 1) {
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

public func filterstate(b: RealArray, a: RealArray, x: RealArray) -> RealArray {
    let filterOrder = max(a.count, b.count) - 1
    var zi = RealArray(repeating: 0.0, count: filterOrder)
    return filterstate(b: b, a: a, x: x, zi: &zi)
}

// Example usage:
// var state = RealArray()  // Empty array for initial state
// let result1 = filterstate(b: b, a: a, x: block1, zi: &state)
// let result2 = filterstate(b: b, a: a, x: block2, zi: &state)  // Continues from previous state

public func filterstate(b: RealArray, a: RealArray, x: RealArray, zi: inout RealArray) -> RealArray {
    let n = x.count
    let filterOrder = max(a.count, b.count) - 1

    // Normalize by a[0] if needed (should be 1.0 for your coefficients)
    let a0 = a[0]
    let aNorm = a / a0
    let bNorm = b / a0

    var y = RealArray(repeating: 0.0, count: n)

    // Initialize delay line (internal state)
    var delayLine = zi.isEmpty ? RealArray(repeating: 0.0, count: filterOrder) : zi
    delayLine = paddata(delayLine, length: filterOrder)  // Ensure correct size

    for i in 0..<n {
        // Direct Form II Transposed: y[n] = b[0]*x[n] + w[0]
        y[i] = bNorm[0] * x[i] + delayLine[0]

        // Update delay line: shift and compute new values
        for j in 0..<filterOrder - 1 {
            delayLine[j] = delayLine[j + 1] + bNorm[j + 1] * x[i] - aNorm[j + 1] * y[i]
        }

        // Last delay element
        delayLine[filterOrder - 1] = bNorm[filterOrder] * x[i] - aNorm[filterOrder] * y[i]
    }

    zi = delayLine
    return y
}

public func filterstateMatlab(b: RealArray, a: RealArray, x: RealArray, zi: inout RealArray) -> RealArray {
    let n = x.count
    let filterOrder = max(a.count, b.count) - 1

    // Normalize and pad coefficients like MATLAB
    let a0 = a.first ?? 1.0
    let aNorm = paddata(a / a0, length: filterOrder + 1)
    let bNorm = paddata(b / a0, length: filterOrder + 1)

    var y = RealArray(repeating: 0.0, count: n)

    // Initialize delay line
    var delayLine = paddata(zi, length: filterOrder)

    for i in 0..<n {
        y[i] = bNorm[0] * x[i] + delayLine[0]
        for j in 0..<(filterOrder - 1) {
            delayLine[j] = delayLine[j + 1] + bNorm[j + 1] * x[i] - aNorm[j + 1] * y[i]
        }
        delayLine[filterOrder - 1] = bNorm[filterOrder] * x[i] - aNorm[filterOrder] * y[i]
    }

    zi = delayLine
    return y
}
