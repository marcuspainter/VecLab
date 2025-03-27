//
//  fir1.swift
//  VecLab
//
//  Created by Marcus Painter on 11/03/2025.
//

import Foundation

/// Swift implementation of MATLAB's fir1 function
///
/// - Parameters:
///   - n: Filter order (must be even for highpass and bandstop)
///   - wn: Normalized cutoff frequency/frequencies (0 < wn < 1, where 1 corresponds to π rad/sample)
///         For bandpass/bandstop, wn should be [wn1, wn2] where wn1 < wn2
///   - ftype: Filter type: "low" (default), "high", "bandpass", "stop"
///   - window: Window function to use, defaults to Hamming window
///   - scale: Whether to scale the filter for unity gain, defaults to true
/// - Returns: Array of filter coefficients
func fir1(n: Int, wn: [Double], ftype: String = "low", window: [Double]? = nil, scale: Bool = true) -> [Double] {
    // Ensure filter order is valid
    if n <= 0 {
        fatalError("Filter order must be greater than 0")
    }
    
    // Check filter type and cutoff frequencies
    var filterType = ftype.lowercased()
    
    // Make sure filter type is valid
    if !["low", "high", "bandpass", "stop"].contains(filterType) {
        fatalError("Invalid filter type. Use 'low', 'high', 'bandpass', or 'stop'")
    }
    
    // Set default filter type based on number of cutoff frequencies
    if wn.count == 1 && filterType == "bandpass" {
        filterType = "low"
    } else if wn.count == 2 && filterType == "low" {
        filterType = "bandpass"
    }
    
    // Validate cutoff frequencies based on filter type
    if ["low", "high"].contains(filterType) {
        if wn.count != 1 {
            fatalError("Lowpass and highpass filters require a single cutoff frequency")
        }
        if wn[0] <= 0 || wn[0] >= 1 {
            fatalError("Cutoff frequency must be between 0 and 1")
        }
    } else if ["bandpass", "stop"].contains(filterType) {
        if wn.count != 2 {
            fatalError("Bandpass and bandstop filters require two cutoff frequencies")
        }
        if wn[0] >= wn[1] || wn[0] <= 0 || wn[1] >= 1 {
            fatalError("Cutoff frequencies must satisfy 0 < wn[0] < wn[1] < 1")
        }
    }
    
    // For highpass and bandstop, order must be even
    var orderN = n
    if filterType == "high" || filterType == "stop" {
        if orderN % 2 != 0 {
            orderN += 1
            print("For highpass and bandstop filters, order must be even. Increasing order to \(orderN).")
        }
    }
    
    // Create window if not provided
    let filterLength = orderN + 1
    let win = window ?? hammingWindow(size: filterLength)
    
    if win.count != filterLength {
        fatalError("Window length must equal filter order + 1 (\(filterLength))")
    }
    
    // Compute frequency and magnitude vectors for FIRLS
    let (freq, magnitude) = computeFreqMagnitude(wn: wn, filterType: filterType)
    let firstBand = filterType != "high" && filterType != "stop"
    
    // Design filter using least-squares method
    let h = firls(n: orderN, freq: freq, amplitude: magnitude)
    
    // Apply window to the filter coefficients
    let b = zip(h, win).map { $0.0 * $0.1 }
    
    // Scale the filter if requested
    if scale {
        return scaleFilter(b: b, firstBand: firstBand, freq: freq, filterLength: filterLength)
    } else {
        return b
    }
}

/// Compute frequency and magnitude vectors for FIRLS
/// - Parameters:
///   - wn: Cutoff frequencies
///   - filterType: Filter type
/// - Returns: Tuple of frequency and magnitude vectors
func computeFreqMagnitude(wn: [Double], filterType: String) -> ([Double], [Double]) {
    var freq: [Double] = []
    var magnitude: [Double] = []
    
    switch filterType {
    case "low":
        freq = [0.0, wn[0], wn[0], 1.0]
        magnitude = [1.0, 1.0, 0.0, 0.0]
    case "high":
        freq = [0.0, wn[0], wn[0], 1.0]
        magnitude = [0.0, 0.0, 1.0, 1.0]
    case "bandpass":
        freq = [0.0, wn[0], wn[0], wn[1], wn[1], 1.0]
        magnitude = [0.0, 0.0, 1.0, 1.0, 0.0, 0.0]
    case "stop":
        freq = [0.0, wn[0], wn[0], wn[1], wn[1], 1.0]
        magnitude = [1.0, 1.0, 0.0, 0.0, 1.0, 1.0]
    default:
        fatalError("Invalid filter type")
    }
    
    return (freq, magnitude)
}

/// Scale filter to have unity gain in passband
/// - Parameters:
///   - b: Filter coefficients
///   - firstBand: Whether first band is a passband
///   - freq: Frequency vector
///   - filterLength: Length of filter
/// - Returns: Scaled filter coefficients
func scaleFilter(b: [Double], firstBand: Bool, freq: [Double], filterLength: Int) -> [Double] {
    if firstBand {
        // Unity gain at DC
        let sum = b.reduce(0, +)
        return b.map { $0 / sum }
    } else {
        // Unity gain at center of first passband or at Fs/2
        let f0: Double
        if freq[3] == 1.0 {
            // Unity gain at Fs/2
            f0 = 1.0
        } else {
            // Unity gain at center of first passband
            f0 = (freq[2] + freq[3]) / 2.0
        }
        
        // Calculate frequency response at f0
        var response: Double = 0.0
        for i in 0..<filterLength {
            response += b[i] * cos(2.0 * Double.pi * Double(i) * (f0/2.0))
        }
        
        return b.map { $0 / abs(response) }
    }
}

/// Create a Hamming window of given size
/// - Parameter size: Window size
/// - Returns: Array of window coefficients
func hammingWindow(size: Int) -> [Double] {
    return (0..<size).map { i in
        0.54 - 0.46 * cos(2.0 * Double.pi * Double(i) / Double(size - 1))
    }
}

/// Swift implementation of MATLAB's firls function
/// FIR filter design using least-squares method
/// - Parameters:
///   - n: Filter order
///   - freq: Frequency breakpoints (between 0 and 1)
///   - amplitude: Desired amplitude at each frequency breakpoint
/// - Returns: Filter coefficients
func firls(n: Int, freq: [Double], amplitude: [Double]) -> [Double] {
    // Validate inputs
    if freq.count != amplitude.count {
        fatalError("Frequency and amplitude vectors must have the same length")
    }
    if freq.count % 2 != 0 {
        fatalError("Frequency vector must have an even number of elements")
    }
    if freq.first != 0.0 || freq.last != 1.0 {
        fatalError("Frequency vector must start with 0 and end with 1")
    }
    
    // Number of frequency bands (pair of points)
    let nbands = freq.count / 2
    
    // We need at least Hermitian symmetry for a real filter
    let L = n + 1      // Filter length
    let k = 0..<L      // Coefficient indices
    let M = (n + 1) / 2  // Number of unique coefficients for even-symmetric filter
    
    // Create the matrix of basis vectors for the least-squares problem
    var A = Array(repeating: Array(repeating: 0.0, count: M), count: M)
    var b = Array(repeating: 0.0, count: M)
    
    // For each frequency band
    for band in 0..<nbands {
        // Get band edges and desired amplitudes
        let w1 = freq[2 * band] * Double.pi
        let w2 = freq[2 * band + 1] * Double.pi
        let amp1 = amplitude[2 * band]
        let amp2 = amplitude[2 * band + 1]
        
        // Skip if band is empty
        if w2 <= w1 {
            continue
        }
        
        // Process each basis vector (cosine) against each other
        for i in 0..<M {
            // Calculate b vector (projections of desired response onto basis)
            let integral = bandIntegral(i: i, w1: w1, w2: w2, amp1: amp1, amp2: amp2)
            b[i] += integral
            
            // Calculate A matrix (Gram matrix of basis vectors)
            for j in 0...i {
                let integral = bandCosIntegral(i: i, j: j, w1: w1, w2: w2)
                A[i][j] += integral
                // Matrix is symmetric
                if i != j {
                    A[j][i] = A[i][j]
                }
            }
        }
    }
    
    // Solve the system Ax = b
    let c = solveSymmetricSystem(A: A, b: b)
    
    // Form the impulse response
    var h = Array(repeating: 0.0, count: L)
    
    // For even-order filters
    if n % 2 == 0 {
        // Type I filter (even order, even symmetry)
        h[n/2] = c[0]
        for i in 1..<M {
            h[n/2 + i] = c[i] / 2
            h[n/2 - i] = c[i] / 2
        }
    } else {
        // Type II filter (odd order, even symmetry)
        for i in 0..<M {
            let idx = (n-1)/2
            h[idx + i + 1] = c[i] / 2
            h[idx - i] = c[i] / 2
        }
    }
    
    return h
}

/// Calculate the integral of the product of basis function i and the desired response
/// over a frequency band with linear transition
/// - Parameters:
///   - i: Basis vector index
///   - w1: Lower band edge frequency (radians)
///   - w2: Upper band edge frequency (radians)
///   - amp1: Desired amplitude at w1
///   - amp2: Desired amplitude at w2
/// - Returns: Value of the integral
func bandIntegral(i: Int, w1: Double, w2: Double, amp1: Double, amp2: Double) -> Double {
    // For DC component (i=0)
    if i == 0 {
        return (amp2 * w2 - amp1 * w1) + (amp1 - amp2) * (w1 + w2) / 2
    }
    
    // Define helper function for linear amplitude
    let amp = { (w: Double) -> Double in
        amp1 + (amp2 - amp1) * (w - w1) / (w2 - w1)
    }
    
    // For cosine basis functions (i>0)
    let i_double = Double(i)
    let cos_w1i = cos(w1 * i_double)
    let cos_w2i = cos(w2 * i_double)
    let sin_w1i = sin(w1 * i_double)
    let sin_w2i = sin(w2 * i_double)
    
    // Calculate integral of amplitude * cos(i*w)
    let term1 = (amp2 * sin_w2i - amp1 * sin_w1i) / i_double
    let term2 = (amp1 - amp2) * (sin_w2i - sin_w1i) / (i_double * (w2 - w1))
    let term3 = (amp1 - amp2) * (cos_w2i - cos_w1i) / (i_double * i_double * (w2 - w1))
    
    return term1 + term2 + term3
}

/// Calculate the integral of the product of two basis functions over a frequency band
/// - Parameters:
///   - i: First basis vector index
///   - j: Second basis vector index
///   - w1: Lower band edge frequency (radians)
///   - w2: Upper band edge frequency (radians)
/// - Returns: Value of the integral
func bandCosIntegral(i: Int, j: Int, w1: Double, w2: Double) -> Double {
    let i_double = Double(i)
    let j_double = Double(j)
    
    // Special case for DC component
    if i == 0 && j == 0 {
        return w2 - w1
    }
    
    // When either i or j is 0 (but not both)
    if i == 0 {
        return sin(w2 * j_double) / j_double - sin(w1 * j_double) / j_double
    }
    if j == 0 {
        return sin(w2 * i_double) / i_double - sin(w1 * i_double) / i_double
    }
    
    // When i equals j
    if i == j {
        return (w2 - w1) / 2
    }
    
    // When i and j are different non-zero values
    let diff = i_double - j_double
    let sum = i_double + j_double
    
    let term1 = sin(w2 * diff) / diff - sin(w1 * diff) / diff
    let term2 = sin(w2 * sum) / sum - sin(w1 * sum) / sum
    
    return (term1 + term2) / 2
}

/// Solve a symmetric positive definite linear system using Cholesky decomposition
/// - Parameters:
///   - A: Symmetric coefficient matrix
///   - b: Right-hand side vector
/// - Returns: Solution vector
func solveSymmetricSystem(A: [[Double]], b: [Double]) -> [Double] {
    let n = A.count
    
    // Perform Cholesky decomposition: A = L * L^T
    var L = Array(repeating: Array(repeating: 0.0, count: n), count: n)
    
    for i in 0..<n {
        for j in 0...i {
            var sum = 0.0
            
            if j == i {
                for k in 0..<j {
                    sum += L[j][k] * L[j][k]
                }
                L[j][j] = sqrt(A[j][j] - sum)
            } else {
                for k in 0..<j {
                    sum += L[i][k] * L[j][k]
                }
                if L[j][j] > 0 {
                    L[i][j] = (A[i][j] - sum) / L[j][j]
                }
            }
        }
    }
    
    // Forward substitution to solve L * y = b
    var y = Array(repeating: 0.0, count: n)
    for i in 0..<n {
        var sum = 0.0
        for j in 0..<i {
            sum += L[i][j] * y[j]
        }
        y[i] = (b[i] - sum) / L[i][i]
    }
    
    // Backward substitution to solve L^T * x = y
    var x = Array(repeating: 0.0, count: n)
    for i in (0..<n).reversed() {
        var sum = 0.0
        for j in (i+1)..<n {
            sum += L[j][i] * x[j]
        }
        x[i] = (y[i] - sum) / L[i][i]
    }
    
    return x
}

// Example usage:
// let lowpassCoeffs = fir1(n: 30, wn: [0.5])
// let highpassCoeffs = fir1(n: 30, wn: [0.5], ftype: "high")
// let bandpassCoeffs = fir1(n: 30, wn: [0.25, 0.75], ftype: "bandpass")
// let bandstopCoeffs = fir1(n: 30, wn: [0.25, 0.75], ftype: "stop")
