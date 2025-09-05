//
//  roots.swift
//  VecLab
//
//  Created by Marcus Painter on 08/03/2025.
//

import Accelerate

/// Finds the roots of a polynomial with real coefficients.
/// - Parameter coefficients: Array of polynomial coefficients in descending order of power
///   (e.g., [1, -5, 6] represents x^2 - 5x + 6)
/// - Returns: Array of complex values representing the roots of the polynomial
public func rootsX(coefficients: RealArray) -> ComplexArray {
    // Handle special cases
    if coefficients.isEmpty {
        return ComplexArray()
    }

    if coefficients.count == 1 {
        return ComplexArray()  // Constant polynomial has no roots
    }

    // Find the index of the first non-zero coefficient
    var startIndex = 0
    while startIndex < coefficients.count && coefficients[startIndex] == 0 {
        startIndex += 1
    }

    // If all coefficients are zero, return empty array
    if startIndex == coefficients.count {
        return ComplexArray()
    }

    // Get normalized coefficients (divide by leading coefficient)
    let p = coefficients[startIndex...]

    // Handle special case for linear polynomial
    if p.count == 2 {
        return ComplexArray([-p[1] / p[0]], [0.0])
    }

    let n = p.count - 1

    // Create the companion matrix (column-major order for LAPACK)
    var A = [Real](repeating: 0.0, count: n * n)

    // Set the subdiagonal to ones: diag(ones(n-1,1),-1)
    for i in 0..<(n - 1) {
        A[(i + 1) + i * n] = 1.0
    }

    // Set the first row to -p(2:n+1)./p(1)
    for i in 0..<n {
        A[i * n] = -p[i + 1] / p[0]
    }

    // Prepare variables for eigenvalue computation
    var wR = [Real](repeating: 0.0, count: n)  // Real parts of eigenvalues
    var wI = [Real](repeating: 0.0, count: n)  // Imaginary parts of eigenvalues

    // Call LAPACK's dgeev to compute eigenvalues
    // sgeev_(&jobVL, &jobVR, &N, &A, &ldA, &wR, &wI, &VL, &ldVL, &VR, &ldVR, &work, &workSize, &info)

    (wR, wI) = eigenvalues(A, n)

    // Convert eigenvalues to complex number tuples
    var result = [(Real, Real)]()
    for i in 0..<n {
        result.append((wR[i], wI[i]))
    }

    // If we had leading zeros, add them as roots
    if startIndex > 0 {
        for _ in 0..<startIndex {
            result.append((0.0, 0.0))
        }
    }

    // Convert to complex array

    var complexArray = ComplexArray()
    for k in 0..<result.count {
        let item = Complex(result[k].0, result[k].1)
        complexArray.append(item)
    }

    return complexArray
}

/// Finds the roots of a polynomial with real coefficients.
/// - **Parameter** coefficients: Array of polynomial coefficients in descending order of power
///   (e.g., [1, -5, 6] represents x^2 - 5x + 6)
/// - **Returns**: Array of complex values representing the roots of the polynomial
public func roots(coefficients: RealArray) -> ComplexArray {
    // Handle special cases
    if coefficients.isEmpty || coefficients.count == 1 {
        return ComplexArray()
    }

    // Find the index of the first non-zero coefficient
    var startIndex = 0
    while startIndex < coefficients.count && coefficients[startIndex] == 0 {
        startIndex += 1
    }

    // If all coefficients are zero, return empty array
    if startIndex == coefficients.count {
        return ComplexArray()
    }

    // Get normalized coefficients (divide by leading coefficient)
    let p = coefficients[startIndex...]

    // Handle special case for linear polynomial
    if p.count == 2 {
        let realRoot = -p[1] / p[0]
        var result = ComplexArray([realRoot], [0.0])

        // Add zero roots if needed
        if startIndex > 0 {
            let zeroRoots = ComplexArray(count: startIndex)
            result.append(contentsOf: zeroRoots)
        }
        return result
    }

    let n = p.count - 1

    // Create the companion matrix (column-major order for LAPACK)
    var A = [Real](repeating: 0.0, count: n * n)

    // Set the subdiagonal to ones: diag(ones(n-1,1),-1)
    for i in 0..<(n - 1) {
        A[(i + 1) + i * n] = 1.0
    }

    // Set the first row to -p(2:n+1)./p(1)
    for i in 0..<n {
        A[i * n] = -p[i + 1] / p[0]
    }

    // Compute eigenvalues using LAPACK
    let (wR, wI) = eigenvalues(A, n)
    var result = ComplexArray(wR, wI)

    // Add zero roots if needed
    if startIndex > 0 {
        let zeroRoots = ComplexArray(count: startIndex)
        result.append(contentsOf: zeroRoots)
    }

    return result
}

private func eigenvalues(_ A: [Double], _ n: Int) -> ([Double], [Double]) {
    // Copy A since LAPACK will overwrite it
    var Acopy = A
    // Prepare variables for eigenvalue computation
    var jobVL = "N".utf8CString[0]  // Don't compute left eigenvectors
    var jobVR = "N".utf8CString[0]  // Don't compute right eigenvectors
    var N = n
    var ldA = n
    var wR = [Double](repeating: 0.0, count: n)  // Real parts of eigenvalues
    var wI = [Double](repeating: 0.0, count: n)  // Imaginary parts of eigenvalues
    var VL = [Double](repeating: 0.0, count: 1)  // Left eigenvectors (not used)
    var ldVL = 1
    var VR = [Double](repeating: 0.0, count: 1)  // Right eigenvectors (not used)
    var ldVR = 1
    var workSize = (4 * n)  // Size of work array
    var work = [Double](repeating: 0.0, count: Int(workSize))
    var info = 0

    // Call LAPACK's dgeev to compute eigenvalues
    dgeev_(&jobVL, &jobVR, &N, &Acopy, &ldA, &wR, &wI, &VL, &ldVL, &VR, &ldVR, &work, &workSize, &info)

    // Check if computation was successful
    if info != 0 {
        print("Error: dgeev returned info = \(info)")
        return ([], [])
    }

    return (wR, wI)
}

