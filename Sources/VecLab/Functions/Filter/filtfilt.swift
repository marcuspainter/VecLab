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
    let nx = x.count
    
    // --- Step 1. Filter order length
    let nfact = 3 * (max(length(a), length(b)) - 1)

    // --- Step 2. Check input length
    if length(x) <= nfact {
        fatalError("Data sequence too short for filter order.")
    }

    // --- Step 3. Create reflected extensions
    let xPre = 2.0 * x[0] - flip(x[1 ..< (nfact + 1)])
    let xPost = 2.0 * x[nx - 1] - flip(x[(nx - nfact - 1) ..< (nx - 1)])
    let xExtended = cat(xPre, x, xPost)

    // --- Step 4. Forward filter
    var yExtended = filter(b: b, a: a, x: xExtended)

    // --- Step 5. Reverse and filter again
    yExtended = filter(b: b, a: a, x: flip(yExtended))

    // --- Step 6. Flip back
    yExtended = flip(yExtended)

    // -- Step 7. Trim off the extension
    let ny = yExtended.count
    let y = yExtended[nfact ..< (ny - nfact)]

    return y
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
