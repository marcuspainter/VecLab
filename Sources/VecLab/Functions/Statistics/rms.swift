//
//  rms.swift
//
//
//  Created by Marcus Painter on 11/09/2023.
//

import Accelerate
import Foundation

// VECTORIZED

/// Root-mean-square (RMS) value of a real  array.
///
/// The RMS is a statistical measure of the magnitude of a set of numbers.
///
/// - Parameter x: Input array of real numbers.
/// - Returns: The RMS value of the array.
///
/// # Example:
/// ```
/// let dataPoints: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0]
/// let rmsValue = rms(dataPoints)
/// print(rmsValue)  // Expected Output: Some RMS value
/// ```
///
public func rms(_ x: RealArray) -> Real {
    return vDSP.rootMeanSquare(x)
}

/// Root-mean-square (RMS) value of a complex  array.
///
/// The RMS is a statistical measure of the magnitude of a set of numbers.
/// For complex numbers, this function computes the RMS for both the real and imaginary parts.
///
/// - Parameter x: Input array of complex numbers, represented as `(real, imaginary)`.
/// - Returns: The RMS value of the complex array.
///
/// # Example:
/// ```
/// let complexData: ComplexArray = ([1.0, 2.0], [1.5, 2.5])
/// let rmsValue = rms(complexData)
/// print(rmsValue)  // Expected Output: Some RMS value
/// ```

public func rms(_ x: ComplexArray) -> Real {
    let real = vDSP.sumOfSquares(x.real)
    let imag = vDSP.sumOfSquares(x.imag)
    let sumOfSquares = (real + imag)
    let meanSquare = sumOfSquares / Real(x.count)
    return sqrt(meanSquare)
}
