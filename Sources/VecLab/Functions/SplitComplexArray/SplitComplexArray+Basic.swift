//
//  SplitComplexArray+Basic.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

import Accelerate

/// Cumulative product.
/// - Parameter x: Complex array.
/// - Returns: Complex array.
public func cumprod(_ x: SplitComplexArray) -> SplitComplexArray {
    guard !x.isEmpty else { return [] }
    var result = SplitComplexArray(repeating: Complex(1, 0), count: x.count)
    result[0] = x[0]
    for i in 1..<x.count {
        result[i] = result[i - 1] * x[i]
    }
    return result
}

/// Cumulative sum of complex array.
/// - Parameter x: Complex array.
/// - Returns: The cumulative sum of the array.
public func cumsum(_ x: SplitComplexArray) -> SplitComplexArray {
    validateSize(x)
    var c = x
    var sum = Complex()
    for k in 0..<x.count {
        sum = sum + x[k]
        c[k] = sum
    }
    return c
}

/// Dot product.
///
/// The complex dot product is defined as:
///
/// dot(a,b) = sum( a \* conj(b))
///
/// - Parameters:
///   - a: Complex array.
///   - b: Complex array.
/// - Returns: The complex dot product of a and b.
public func dot(_ a: SplitComplexArray, _ b: SplitComplexArray) -> Complex {
    validateSize(a, b)
    let c = a *~ b
    let dotSum = sum(c)
    return dotSum
}

/// Dot product.
///
/// The complex dot product is defined as:
///
/// dot(a,b) = sum( a \* conj(b))
///
/// - Parameters:
///   - a: Real array.
///   - b: Complex array.
/// - Returns: The complex dot product of a and b.
public func dot(_ a: RealArray, _ b: SplitComplexArray) -> Complex {
    validateSize(a, b)
    let c = a * b
    let dotSum = sum(c)
    return dotSum
}

/// Dot product.
///
/// The complex dot product is defined as:
///
/// dot(a,b) = sum( a \* conj(b))
///
/// - Parameters:
///   - a: Complex array.
///   - b: Real array.
/// - Returns: The complex dot product of a and b.
public func dot(_ a: SplitComplexArray, _ b: RealArray) -> Complex {
    validateSize(a, b)
    let c = a ~* b
    let dotSum = sum(c)
    return dotSum
}

/// Complex array iterator.
/// - Parameters:
///   - x: Real array.
///   - body: Closure to execute.
/// - Returns: Output array.
public func iterate(_ x: SplitComplexArray, _ body: (Complex) -> Complex) -> SplitComplexArray {
    validateSize(x)
    var y = SplitComplexArray(count: x.count)
    for index in 0..<x.count {
        y[index] = body(x[index])
    }
    return y
}

/// Complex array iterator with index.
/// - Parameters:
///   - x: Complex array.
///   - body: Closure to execute.
/// - Returns: Output array.
public func iterate(_ x: SplitComplexArray, _ body: (Int, Complex) -> Complex) -> SplitComplexArray {
    validateSize(x)
    var y = SplitComplexArray(count: x.count)
    for index in 0..<x.count {
        y[index] = body(index, x[index])
    }
    return y
}

/// Product of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The product of the array.
public func prod(_ x: SplitComplexArray) -> Complex {
    validateSize(x)
    var product = x[0]
    for k in 1..<x.count {
        product = product * x[k]
    }
    return product
}

/// Sign function (signum function) of a complex array.
///
/// `sign(x)` returns a value of: x./abs(x) if x is complex.
/// - Parameter x: Complex array.
/// - Returns: Sign of number.
public func sign(_ x: SplitComplexArray) -> SplitComplexArray {
    validateSize(x)
    return x / abs(x)  // Overloaded
}

/// Sort complex array.
/// - Parameters:
///   - x: Complex array.
///   - order: Sort order.
/// - Returns: A sorted complex array.
public func sort(_ x: SplitComplexArray, order: SortOder = .ascending) -> SplitComplexArray {
    switch order {
    case .ascending:
        return x.sorted { a, b in
            let magA = hypot(a.real, a.imag)
            let magB = hypot(b.real, b.imag)
            if magA != magB {
                return magA < magB
            }
            // Tie-break by phase (atan2 returns (-π, π])
            let phaseA = wrapTo2Pi(angle(a))
            let phaseB = wrapTo2Pi(angle(b))
            return phaseA < phaseB
        }

    case .descending:
        return x.sorted { a, b in
            let magA = hypot(a.real, a.imag)
            let magB = hypot(b.real, b.imag)
            if magA != magB {
                return magA > magB
            }
            // Tie-break by phase (atan2 returns (-π, π])
            let phaseA = wrapTo2Pi(angle(a))
            let phaseB = wrapTo2Pi(angle(b))
            return phaseA > phaseB
        }
    }
}

private func matlabSort2(_ arr: SplitComplexArray) -> SplitComplexArray {
    return arr.sorted { a, b in
        let magA = hypot(a.real, a.imag)
        let magB = hypot(b.real, b.imag)
        if magA != magB {
            return magA < magB
        }
        // Tie-break by phase (atan2 returns (-π, π])
        let phaseA = wrapTo2Pi(angle(a))
        let phaseB = wrapTo2Pi(angle(b))
        return phaseA < phaseB
    }
}

/// Sum of a complex array.
/// - Parameter x: Complex array.
/// - Returns: The sum of the array.
public func sum(_ x: SplitComplexArray) -> Complex {
    validateSize(x)
    return Complex(vDSP.sum(x.real), vDSP.sum(x.imag))
}
