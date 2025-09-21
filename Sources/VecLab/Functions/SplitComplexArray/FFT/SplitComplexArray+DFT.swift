//
//  SplitComplexArray+DFT.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

// MARK: Classic DFT

/// DFT of complex array.
/// - Parameter x: Complex array.
/// - Returns: Complex array result.
public func dft(_ x: SplitComplexArray) -> SplitComplexArray {
    validateSize(x)
    let n = length(x)
    if n == 1 {
        return x
    }

    // Init by copy
    var y = SplitComplexArray(repeating: .zero, count: x.count)
    let q = vector(0..<n)
    let omega = -2 * Real.pi * Real.i * q / Real(n)
    for p in 0..<x.count {
        let w = exp(omega * Real(p))
        y[p] = sum(x * w)
    }
    return y
}

/// Inverse DFT of complex array.
/// - Parameter x:Complex array.
/// - Returns: Complex array result.
public func idft(_ x: SplitComplexArray) -> SplitComplexArray {
    validateSize(x)
    let n = length(x)
    if n == 1 {
        return x
    }

    // Init by copy
    var y = x
    let q = vector(0..<n)
    let omega = 2 * Real.pi * Real.i * q / Real(n)
    for p in 0..<x.count {
        let w = exp(omega * Real(p))
        y[p] = sum(x * w)
    }
    return y / Real(n)
}

/// DFT of real array.
/// - Parameter x: Real array.
/// - Returns: Complex array result.
public func dftr(_ x: RealArray) -> SplitComplexArray {
    let n = length(x)
    if n == 1 {
        return SplitComplexArray(x, [Real(0)])
    }

    var y = SplitComplexArray(count: x.count)
    let k = vector(0..<n)
    let omega = -2 * Real.pi * Real.i * k / Real(n)
    for i in 0..<x.count {
        let w = exp(omega * Real(i))
        y[i] = sum(x * w)
    }
    return y
}

/// Inverse DFT of complex array with real result.
/// - Parameter x: Complex array.
/// - Returns: Real array result.
public func idftr(_ x: SplitComplexArray) -> RealArray {
    validateSize(x)
    let n = length(x)

    // Init by copy
    var y = x
    let k = vector(0..<n)
    let omega = 2 * Real.pi * Real.i * k / Real(n)
    for k in 0..<x.count {
        let w = exp(omega * Real(k))
        y[k] = sum(x * w)
    }
    return y.real / Real(n)
}
