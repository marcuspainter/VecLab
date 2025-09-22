//
//  SplitComplexArray+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

// MARK: Complex Array

/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: SplitComplexArray, _ b: RealArray) -> SplitComplexArray {
    validateSize(a, b)
    var c: SplitComplexArray = a
    for k in 0 ..< a.count {
        c[k] = pow(a[k], b[k])
    }
    return c
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealArray, _ b: SplitComplexArray) -> SplitComplexArray {
    validateSize(a, b)
    var c: SplitComplexArray = b
    for k in 0 ..< b.count {
        c[k] = pow(a[k], b[k])
    }
    return c
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Complex number.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealArray, _ b: Complex) -> SplitComplexArray {
    var c: SplitComplexArray = SplitComplexArray(count: a.count)
    for k in 0 ..< a.count {
        c[k] = pow(a[k], b)
    }
    return c
}

/// Power.
/// - Parameters:
///   - a: Complex number.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: Complex, _ b: RealArray) -> SplitComplexArray {
    var c: SplitComplexArray = SplitComplexArray(count: b.count)
    for k in 0 ..< b.count {
        c[k] = pow(a, b[k])
    }
    return c
}

/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: SplitComplexArray, _ b: Real) -> SplitComplexArray {
    validateSize(a)
    var c: SplitComplexArray = SplitComplexArray(count: a.count)
    for k in 0 ..< a.count {
        c[k] = pow(a[k], b)
    }
    return c
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: Real, _ b: SplitComplexArray) -> SplitComplexArray {
    validateSize(b)
    var c: SplitComplexArray = SplitComplexArray(count: b.count)
    for k in 0 ..< b.count {
        c[k] = pow(a, b[k])
    }
    return c
}

/// Power.
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: Raises `a` to the power of `b
public func pow(_ a: SplitComplexArray, _ b: SplitComplexArray) -> SplitComplexArray {
    validateSize(a, b)
    var c: SplitComplexArray = SplitComplexArray(count: a.count)
    for k in 0 ..< a.count {
        c[k] = pow(a[k], b[k])
    }

    return c
}
