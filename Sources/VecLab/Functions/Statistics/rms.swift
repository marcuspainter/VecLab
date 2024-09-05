//
//  rms.swift
//  
//
//  Created by Marcus Painter on 11/09/2023.
//

import Foundation
import Accelerate

// VECTORIZED

/// Root-mean-square (RMS) value of a real  array.
///
/// The RMS is a statistical measure of the magnitude of a set of numbers.
///
/// - Parameter x: Input array of real numbers.
/// - Returns: The RMS value of the array.
public func rms(_ x: RealDoubleArray) -> RealDouble {
    return vDSP.rootMeanSquare(x)
}

/// Root-mean-square (RMS) value of a complex  array.
///
/// The RMS is a statistical measure of the magnitude of a set of numbers. For complex numbers, this function computes the RMS for both the real and imaginary parts.
///
/// - Parameter x: Input array of complex numbers, represented as `(real, imaginary)`.
/// - Returns: The RMS value of the complex array.
public func rms(_ x: ComplexDoubleArray) -> RealDouble {
    let r = vDSP.sumOfSquares(x.0)
    let i = vDSP.sumOfSquares(x.1)
    let sumOfSquares = (r + i)
    let meanSquare = sumOfSquares / RealDouble(x.0.count)
    return sqrt(meanSquare)
}

// MARK: Float

/// Root-mean-square (RMS) value of a real  array.
///
/// The RMS is a statistical measure of the magnitude of a set of numbers.
///
/// - Parameter x: Input array of real numbers.
/// - Returns: The RMS value of the array.
public func rms(_ x: RealFloatArray) -> RealFloat {
    return vDSP.rootMeanSquare(x)
}

/// Root-mean-square (RMS) value of a complex  array.
///
/// The RMS is a statistical measure of the magnitude of a set of numbers. For complex numbers, this function computes the RMS for both the real and imaginary parts.
///
/// - Parameter x: Input array of complex numbers, represented as `(real, imaginary)`.
/// - Returns: The RMS value of the complex array.
public func rms(_ x: ComplexFloatArray) -> RealFloat {
    let r = vDSP.sumOfSquares(x.0)
    let i = vDSP.sumOfSquares(x.1)
    let sumOfSquares = (r + i)
    let meanSquare = sumOfSquares / RealFloat(x.0.count)
    return sqrt(meanSquare)
}

