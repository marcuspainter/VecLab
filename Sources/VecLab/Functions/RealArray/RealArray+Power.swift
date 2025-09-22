//
//  RealArray+pow.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

import Accelerate
import Foundation

/// Power.
/// - Parameters:
///   - a: Integer number.
///   - b: Integer number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Int, _ b: Int) -> Real {
    return Darwin.pow(Real(a), Real(b))
}

/// Power.
/// - Parameters:
///   - a: Integer number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Int, _ b: Real) -> Real {
    return Darwin.pow(Real(a), b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Real, _ b: Int) -> Real {
    return Darwin.pow(a, Real(b))
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: RealArray, _ b: Int) -> RealArray {
    return pow(a, Real(b))
}

// MARK: Real Array

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`
public func pow(_ a: RealArray, _ b: RealArray) -> RealArray {
    validateSize(a, b)
    return vForce.pow(bases: a, exponents: b)
}

/// Power.
/// - Parameters:
///   - a: Real array.
///   - b: Real number.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: RealArray, _ b: Real) -> RealArray {
    return vectorPowReal(a, b)
}

/// Power.
/// - Parameters:
///   - a: Real number.
///   - b: Real array.
/// - Returns: Raises `a` to the power of `b`.
public func pow(_ a: Real, _ b: RealArray) -> RealArray {
    return vectorPowReal(a, b)
}

 private func vectorPowReal(_ a: [Double], _ b: Double) -> [Double] {
 let bb = [Double](repeating: b, count: a.count)
 return vForce.pow(bases: a, exponents: bb)
 }

 private func vectorPowReal(_ a: Double, _ b: [Double]) -> [Double] {
 let aa = [Double](repeating: a, count: b.count)
 return vForce.pow(bases: aa, exponents: b)
 }

