//
//  awgn.swift
//
//
//  Created by Marcus Painter on 11/09/2023.
//

import Accelerate
import Foundation

/// Add white Gaussian noise to a real signal.
///
/// This function uses the gaussian distributed random numbers using ``randn()``. For repeatable results,
/// set the seed of the random number generator using ``rng(seed:generator:)``.
/// - Parameters:
///   - x: Real signal.
///   - snr: SNR is decibels (dB).
/// - Returns: The noisy signal and noise as a tuple.
public func awgn(_ x: RealArray, _ snr: Real) -> (y: RealArray, noise: RealArray) {
    // Calculate the signal power.
    let P_signal = vDSP.sumOfSquares(x) / Real(x.count)

    // Calculate the noise power based on the desired SNR.
    let P_noise = P_signal / pow(10.0, snr / 10.0)

    // Generate the noise with the appropriate power.
    let noise = vDSP.add(sqrt(P_noise), randn(count: x.count))

    // Add the noise to the signal.
    let y = vDSP.add(x, noise)

    return (y, noise)
}

/// Add white Gaussian noise to a complex signal.
///
/// This function uses the gaussian distributed random numbers using ``randn()``. For repeatable results,
/// set the seed of the random number generator using ``rng(seed:generator:)``.
/// - Parameters:
///   - x: Complex signal
///   - snr: SNR is decibels (dB)
/// - Returns: The noisy signal and noise as a tuple of complex arrays
public func awgn(_ x: ComplexArray, _ snr: Real) -> (y: ComplexArray, noise: ComplexArray) {
    assertSameSize(x)
    // Calculate the signal power.
    let P_signal_real = vDSP.sumOfSquares(x.0) / Real(x.0.count)
    let P_signal_imag = vDSP.sumOfSquares(x.1) / Real(x.1.count)
    let P_signal = (P_signal_real + P_signal_imag) / 2.0

    // Calculate the noise power based on the desired SNR.
    let P_noise = P_signal / pow(10.0, snr / 10.0)

    // Generate the noise with the appropriate power for real and imag parts
    let noiseReal = vDSP.add(sqrt(P_noise), randn(count: x.0.count))
    let noiseImag = vDSP.add(sqrt(P_noise), randn(count: x.1.count))

    // Add the noise to the signal.
    let yReal = vDSP.add(x.0, noiseReal)
    let yImag = vDSP.add(x.1, noiseImag)

    return ((yReal, yImag), (noiseReal, noiseImag))
}
