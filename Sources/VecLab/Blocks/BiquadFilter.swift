//
//  BiquadFilter.swift
//  VecLab
//
//  Created by Marcus Painter on 25/08/2025.
//

import Accelerate

/*
 Delay:

 An array of single-precision values initialized with direct-form 1 “past” state data for each section of the biquad.
 The length of the array should be (2 * M) + 2, where M is the number of sections.
 For each section m, Delay[2*m:2*m+1] represent the two delayed input values for section m
 and Delay[2*M:2*M+1] represent the two delayed output values of the filter. After this function executes,
 this array contains the final state data of the filters.
 */

public enum BiquadFilterError: Error {
    case setupFailed

    var localizedDescription: String {
        switch self {
        case .setupFailed:
            return "Failed to create vDSP biquad setup."
        }
    }
}

/// Biquadratic IIR digital filter.
public final class BiquadFilter {
    private let biquadSetup: vDSP_biquad_SetupD
    // Filter state
    private var delay: [Double]
    private let sectionCount: Int

    /// Initialize BiquadFilter with coefficients.
    /// - Parameters:
    ///   - b: b coefficients.
    ///   - a: a coefficients.
    public init(b: [Double], a: [Double]) throws {
        precondition(b.count == 3, "Coefficients must be [b0, b1, b2].")
        precondition(a.count == 3, "Coefficients must be [a0, a1, a2].")
        precondition(a[0] == 1.0, "Coefficient a0 must be 1.")
        var coefficients: [Double] = b
        coefficients.append(contentsOf: a.suffix(from: 1))  // Ignore a0
        self.sectionCount = 1  // Single section for now
        guard let setup = vDSP_biquad_CreateSetupD(coefficients, vDSP_Length(sectionCount)) else {
            throw BiquadFilterError.setupFailed
        }

        self.biquadSetup = setup

        // Initialize delay buffer (this can't fail, so no cleanup needed)
        let delayCount = (sectionCount * 2) + 2
        self.delay = [Double](repeating: 0, count: delayCount)
    }

    /// Initialize BiquadFilter with coefficients.
    /// - Parameters:
    ///   - coefficients: Coefficients array.
    public init(coefficients: [Double]) throws {
        precondition(coefficients.count == 6, "Coefficients must be [b0, b1, b2, a0, a1, a2].")
        precondition(coefficients[3] == 1.0, "Coefficient a0 must be 1.")
        var coeffientsArray: [Double] = coefficients
        coeffientsArray.remove(at: 3)
        self.sectionCount = 1  // Single section for now

        guard let setup = vDSP_biquad_CreateSetupD(coeffientsArray, vDSP_Length(sectionCount)) else {
            throw BiquadFilterError.setupFailed
        }
        self.biquadSetup = setup

        // Initialize delay buffer (this can't fail, so no cleanup needed)
        let delayCount = (sectionCount * 2) + 2
        self.delay = [Double](repeating: 0, count: delayCount)
    }

    deinit {
        vDSP_biquad_DestroySetupD(biquadSetup)
    }

    /// Replace the filter coefficients without resetting state.
    /// - Parameter coefficients: Coefficients array.
    public func updateCoefficients(_ coefficients: [Double]) {
        precondition(coefficients.count == 6, "Coefficients must be [b0, b1, b2, a0, a1, a2].")
        precondition(coefficients[3] == 1.0, "Coefficient a0 must be 1.")
        var coeffientsArray: [Double] = coefficients
        coeffientsArray.remove(at: 3)
        let sectionStart: vDSP_Length = 0
        let sectionCountLength: vDSP_Length = vDSP_Length(sectionCount)

        vDSP_biquad_SetCoefficientsDouble(biquadSetup, coeffientsArray, sectionStart, sectionCountLength)

        // Reset delay line if sections count changes
    }

    public func updateCoefficients(b: [Double], a: [Double]) {
        precondition(b.count == 3, "Coefficients must be [b0, b1, b2].")
        precondition(a.count == 3, "Coefficients must be [a0, a1, a2].")
        precondition(a[0] == 1.0, "Coefficient a0 must be 1.")

        let sectionStart: vDSP_Length = 0
        let sectionCountLength: vDSP_Length = vDSP_Length(sectionCount)
        var coefficients: [Double] = b
        coefficients.append(contentsOf: a.suffix(from: 1))  // Ignore a0

        vDSP_biquad_SetCoefficientsDouble(biquadSetup, coefficients, sectionStart, sectionCountLength)

        // Reset delay line if sections count changes
    }

    /// Process one block of samples.
    /// - Parameter input: Input signal.
    /// - Returns: Filtered signal.
    public func process(_ input: [Double]) -> [Double] {
        let count = vDSP_Length(input.count)
        var output = [Double](repeating: 0, count: input.count)

        input.withUnsafeBufferPointer { inPtr in
            output.withUnsafeMutableBufferPointer { outPtr in
                delay.withUnsafeMutableBufferPointer { delayPtr in
                    vDSP_biquadD(
                        biquadSetup,
                        delayPtr.baseAddress!,
                        inPtr.baseAddress!,
                        1,
                        outPtr.baseAddress!,
                        1,
                        count
                    )
                }
            }
        }
        return output
    }

    /// Reset the filter's internal state (clear delay line).
    public func reset() {
        delay = [Double](repeating: 0, count: delay.count)
    }
}
