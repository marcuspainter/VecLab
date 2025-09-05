//
//  filtersate.swift
//  VecLab
//
//  Created by Marcus Painter on 05/09/2025.
//

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
