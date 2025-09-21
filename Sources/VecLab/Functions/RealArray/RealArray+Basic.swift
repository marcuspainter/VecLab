//
//  RealArray+Basic.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

import Accelerate
import Foundation

/// Absolute values of real array.
///
/// - Parameter x:Real array.
/// - Returns: Absolute values.
public func abs(_ x: RealArray) -> RealArray {
    return vDSP.absolute(x)
}

/// Clip data to range.
/// - Parameters:
///   - x: Input number.
///   - lower: Lower bound.
///   - upper: Upper bound.
/// - Returns: Clipped data.
public func clip(_ x: Real, lower: Real, upper: Real) -> Real {
    if x < lower {
        return lower
    } else if x < upper {
        return upper
    }
    return x
}

/// Clip data to range.
/// - Parameters:
///   - x: Input array.
///   - lower: Lower bound.
///   - upper: Upper bound.
/// - Returns: Clipped data.
public func clip(_ x: RealArray, lower: Real, upper: Real) -> RealArray {
    let range = (lower ... upper)
    return vDSP.clip(x, to: range)
}

/// Cumulative product.
/// - Parameter x: Real array.
/// - Returns: Real array.
public func cumprod(_ x: RealArray) -> RealArray {
    guard !x.isEmpty else { return [] }
    var result = [Double](repeating: 1.0, count: x.count)
    result[0] = x[0]
    for i in 1..<x.count {
        result[i] = result[i - 1] * x[i]
    }
    return result
}

/// Cumulative sum of array.
/// - Parameter x: Input array.
/// - Returns: The cumulative sum of the array.
public func cumsum(_ x: RealArray) -> RealArray {
    var result = RealArray(repeating: 0, count: x.count)
    var sum = Real(0)
    for k in 0..<x.count {
        sum += x[k]
        result[k] = sum
    }
    return result
}

/// Dot product.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: The complex dot product of a and b.
public func dot(_ a: RealArray, _ b: RealArray) -> Double {
    return vDSP.dot(a, b)
}

/// Real array iterator.
/// - Parameters:
///   - x: Real array.
///   - body: Closure to execute.
/// - Returns: Output array.
public func iterate(_ x: RealArray, _ body: (Real) -> Real) -> RealArray {
    var y = RealArray(repeating: 0, count: x.count)
    for index in 0..<x.count {
        y[index] = body(x[index])
    }
    return y
}

/// Real array iterator with index.
/// - Parameters:
///   - x: Real array.
///   - body: Closure to execute.
/// - Returns: Output array.
public func iterate(_ x: RealArray, _ body: (Int, Real) -> Real) -> RealArray {
    var y = RealArray(repeating: 0, count: x.count)
    for index in 0..<x.count {
        y[index] = body(index, x[index])
    }
    return y
}

/// Euclidean norm of array.
///
/// This norm is also called the 2-norm, vector magnitude, or Euclidean length.
/// - Parameter x: Input array.
/// - Returns: The 2-norm or magnitude of the array.
public func norm(_ x: RealArray) -> Real {
    let sum = vDSP.sumOfSquares(x)
    return Darwin.sqrt(sum)
}

/*
 norm(v,1) = sum(abs(v))
 norm(v,2) = sum(abs(v).^2)^(1/2)
 norm(v,p) = sum(abs(v).^p)^(1/p)
 norm(v,inf) = max(abs(v))
 norm(v,-inf) = min(abs(v))
 */

/// Product of an array.
/// - Parameter x: Real array.
/// - Returns: The product of the array.
public func prod(_ x: RealArray) -> Real {
    var product = x[0]
    for k in 1..<x.count {
        product *= x[k]
    }
    return product
}

/// Sign function (signum function) of a real number.
///
/// `sign(x)` returns a value of:
/// 1 if the corresponding element of x is greater than 0.
/// 0 if the corresponding element of x equals 0.
/// -1 if the corresponding element of x is less than 0.
/// x./abs(x) if x is complex.
/// - Parameter x: Real number.
/// - Returns: Sign of number.
public func sign(_ x: Real) -> Real {
    if x > 0 {
        return Real(1.0)
    }
    if x < 0 {
        return Real(-1.0)
    }
    // x == 0
    return Real(0.0)
}

/// Sign function (signum function) of a real number.
///
/// `sign(x)` returns a value of:
/// 1 if the corresponding element of x is greater than 0.
/// 0 if the corresponding element of x equals 0.
/// -1 if the corresponding element of x is less than 0.
/// x./abs(x) if x is complex.
/// - Parameter x: Real array.
/// - Returns: Sign of number.
public func sign(_ x: RealArray) -> RealArray {
    return x.map { sign($0) }
}

/// Sort array.
/// - Parameters:
///   - x: Real array.
///   - order: Sort order.
/// - Returns: A sorted array.
public func sort(_ x: RealArray, order: SortOder = .ascending) -> RealArray {
    switch order {
    case .ascending:
        return x.sorted()
    case .descending:
        return x.sorted(by: >)
    }
}

/// Sum of array.
/// - Parameter x: Input array.
/// - Returns: The sum of the array.
public func sum(_ x: RealArray) -> Real {
    return vDSP.sum(x)
}

/// Threshold value
/// - Parameters:
///   - x: Input number.
///   - lower: Threshold value.
/// - Returns: Thresholded value.
public func threshold(_ x: Real, lower: Real) -> Real {
    if x < lower {
        return lower
    }
    return x
}

/// Threshold value
/// - Parameters:
///   - x: Input array.
///   - lower: Threshold value.
/// - Returns: Thresholded values.
public func threshold(_ x: RealArray, lower: Real) -> RealArray {
    return vDSP.threshold(x, to: lower, with: .clampToThreshold)
}
