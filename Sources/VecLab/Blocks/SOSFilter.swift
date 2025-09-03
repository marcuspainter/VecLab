//
//  SOSFilter.swift
//  VecLab
//
//  Created by Marcus Painter on 30/08/2025.
//

import Accelerate

public enum SOSFilterError: Error {
    case setupFailed

    var localizedDescription: String {
        switch self {
        case .setupFailed:
            return "Failed to create vDSP biquad setup."
        }
    }
}

/// Second-order (biquadratic) IIR digital filter.
public final class SOSFilter {
    private var biquadSetup: vDSP_biquad_SetupD
    private var delay: [Double] = []
    private var gain: Double = 1.0

    /// Initialize SOSFilter with second-order sections.
    /// - Parameter sos: Array of sections.
    /// - Parameter gain: Gain.
    public init(sos: [[Double]], gain: Double = 1.0) throws {
        let sectionCount = sos.count  // Single section for now
        let coefficients = Self.convertSosCoefficients(sos)

        guard let setup = vDSP_biquad_CreateSetupD(coefficients, vDSP_Length(sectionCount)) else {
            throw SOSFilterError.setupFailed
        }
        self.biquadSetup = setup
        self.gain = gain

        setDelay(sectionCount: sectionCount)
    }

    deinit {
        vDSP_biquad_DestroySetupD(biquadSetup)
    }

    func setDelay(sectionCount: Int) {
        let delayCount = (sectionCount * 2) + 2
        delay = [Double](repeating: 0, count: delayCount)
    }

    static func convertSosCoefficients(_ sos: [[Double]]) -> [Double] {
        var coefficients: [Double] = []
        for section in sos {
            precondition(section.count == 6, "Section must be [b0, b1, b2, a0, a1, a2].")
            // Remove a0 at index 3
            var newCoefficients = section
            newCoefficients.remove(at: 3)
            coefficients.append(contentsOf: newCoefficients)
        }
        return coefficients
    }

    /// Filter signal.
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
        return gain == 1.0 ? output : gain * output
    }

    /// Reset the filter's internal state (clear delay line).
    public func reset() {
        delay = [Double](repeating: 0, count: delay.count)
    }
}
