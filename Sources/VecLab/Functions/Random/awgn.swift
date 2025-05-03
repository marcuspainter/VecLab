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
public func awgn(_ x: RealArray, snr: Real) -> (signal: RealArray, noise: RealArray) {
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
public func awgn(_ x: ComplexArray, snr: Real) -> (signal: ComplexArray, noise: ComplexArray) {
    validateSize(x)
    // Calculate the signal power.
    let P_signal_real = vDSP.sumOfSquares(x.real) / Real(x.count)
    let P_signal_imag = vDSP.sumOfSquares(x.imag) / Real(x.count)
    let P_signal = (P_signal_real + P_signal_imag) / 2.0

    // Calculate the noise power based on the desired SNR.
    let P_noise = P_signal / pow(10.0, snr / 10.0)

    // Generate the noise with the appropriate power for real and imag parts
    let noiseReal = vDSP.add(sqrt(P_noise), randn(count: x.count))
    let noiseImag = vDSP.add(sqrt(P_noise), randn(count: x.count))

    // Add the noise to the signal.
    let yReal = vDSP.add(x.real, noiseReal)
    let yImag = vDSP.add(x.imag, noiseImag)

    return (ComplexArray(yReal, yImag), ComplexArray(noiseReal, noiseImag))
}
