//
//  filtfilt.swift
//  VecLab
//
//  Created by Marcus Painter on 31/08/2025.
//

/// Zero phase IIR Filter
///
/// Direct Form II IIR filter.
/// - Parameters:
///   - b: b coefficients.
///   - a: a coefficients.
///   - x: Real input signal.
/// - Returns: Filtered signal.
public func filtfilt(b: RealArray, a: RealArray, x: RealArray) -> RealArray {
    let inputLength = x.count

    // --- Step 1. Filter order length
    let mirrorLength = 3 * (max(length(a), length(b)) - 1)

    // --- Step 2. Check input length
    if inputLength <= mirrorLength {
        fatalError("Data sequence too short for filter order.")
    }

    // --- Step 3. Create reflected extensions
    let signalBefore = 2.0 * x[0] - flip(x[1 ..< (mirrorLength + 1)])
    let signalAfter = 2.0 * x[inputLength - 1] - flip(x[(inputLength - mirrorLength - 1) ..< (inputLength - 1)])
    let signalExtended = cat(signalBefore, x, signalAfter)

    // --- Step 4. Forward filter
    var outputExtended = filter(b: b, a: a, x: signalExtended)

    // --- Step 5. Reverse and filter again
    outputExtended = filter(b: b, a: a, x: flip(outputExtended))

    // --- Step 6. Flip back
    outputExtended = flip(outputExtended)

    // -- Step 7. Trim off the extension
    let outputExtendedLength = outputExtended.count
    let output = outputExtended[mirrorLength ..< (outputExtendedLength - mirrorLength)]

    return output
}

/// Zero phase IIR Filter
///
/// Direct Form II IIR filter.
/// - Parameters:
///   - b: b coefficients.
///   - a: a coefficients.
///   - x: Complex input signal.
/// - Returns: Filtered signal.
public func filtfilt(b: RealArray, a: RealArray, x: ComplexArray) -> ComplexArray {
    validateSize(x)
    let yr = filtfilt(b: b, a: a, x: x.real)
    let yi = filtfilt(b: b, a: a, x: x.imag)
    return ComplexArray(yr, yi)
}

private func mirror(filterLength: Int, x: RealArray) -> RealArray {
    let inputLength = x.count

    // --- Step 1. Filter order length
    let mirrorLength = 3 * (filterLength - 1)

    // --- Step 2. Check input length
    if inputLength <= mirrorLength {
        fatalError("Data sequence too short for filter order.")
    }

    // --- Step 3. Create reflected extensions
    let signalBefore = 2.0 * x[0] - flip(x[1 ..< (mirrorLength + 1)])
    let signalAfter = 2.0 * x[inputLength - 1] - flip(x[(inputLength - mirrorLength - 1) ..< (inputLength - 1)])
    let signalExtended = cat(signalBefore, x, signalAfter)

    return signalExtended
}

private func imirror(filterLength: Int, x: RealArray) -> RealArray {
    // --- Step 1. Filter order length
    let mirrorLength = 3 * (filterLength - 1)

    // -- Step 7. Trim off the extension
    let startIndex = mirrorLength
    let endIndex = x.count - mirrorLength

    if startIndex > endIndex {
        fatalError("Data sequence too short for filter order.")
    }

    let y = x[startIndex ... endIndex]

    return y
}
