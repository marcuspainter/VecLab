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
//@available(iOS 16.4, *)
public func roots(coefficients: RealArray) -> ComplexArray {
    // Handle special cases
    if coefficients.isEmpty {
        return ([], [])
    }

    if coefficients.count == 1 {
        return ([], []) // Constant polynomial has no roots
    }

    // Find the index of the first non-zero coefficient
    var startIndex = 0
    while startIndex < coefficients.count && coefficients[startIndex] == 0 {
        startIndex += 1
    }

    // If all coefficients are zero, return empty array
    if startIndex == coefficients.count {
        return ([], [])
    }

    // Get normalized coefficients (divide by leading coefficient)
    let p = Array(coefficients[startIndex...])

    // Handle special case for linear polynomial
    if p.count == 2 {
        return ([-p[1] / p[0]], [0.0])
    }

    let n = p.count - 1

    // Create the companion matrix (column-major order for LAPACK)
    var A = [Double](repeating: 0.0, count: n * n)

    // Set the subdiagonal to ones: diag(ones(n-1,1),-1)
    for i in 0 ..< (n - 1) {
        A[(i + 1) + i * n] = 1.0
    }

    // Set the first row to -p(2:n+1)./p(1)
    for i in 0 ..< n {
        A[i * n] = -p[i + 1] / p[0]
    }

    // Prepare variables for eigenvalue computation
    var jobVL = "N".utf8CString[0] // Don't compute left eigenvectors
    var jobVR = "N".utf8CString[0] // Don't compute right eigenvectors
    var N = __LAPACK_int(n)
    var ldA = __LAPACK_int(n)
    var wR = [Double](repeating: 0.0, count: n) // Real parts of eigenvalues
    var wI = [Double](repeating: 0.0, count: n) // Imaginary parts of eigenvalues
    var VL = [Double](repeating: 0.0, count: 1) // Left eigenvectors (not used)
    var ldVL = __LAPACK_int(1)
    var VR = [Double](repeating: 0.0, count: 1) // Right eigenvectors (not used)
    var ldVR = __LAPACK_int(1)
    var workSize = __LAPACK_int(4 * n) // Size of work array
    var work = [Double](repeating: 0.0, count: Int(workSize))
    var info = __LAPACK_int(0)

    // Call LAPACK's dgeev to compute eigenvalues
    dgeev_(&jobVL, &jobVR, &N, &A, &ldA, &wR, &wI, &VL, &ldVL, &VR, &ldVR, &work, &workSize, &info)
    
    // Check if computation was successful
    if info != 0 {
        print("Error: dgeev returned info = \(info)")
        return ([], [])
    }

    // Convert eigenvalues to complex number tuples
    var result = [(Double, Double)]()
    for i in 0 ..< n {
        result.append((wR[i], wI[i]))
    }

    // If we had leading zeros, add them as roots
    if startIndex > 0 {
        for _ in 0 ..< startIndex {
            result.append((0.0, 0.0))
        }
    }

    // Convert to complex array

    var complexArray: ComplexArray = ([], [])
    for k in 0 ..< result.count {
        complexArray.0.append(result[k].0)
        complexArray.1.append(result[k].1)
    }

    return complexArray
}

// Example usage:
// let polynomial = [1.0, -5.0, 6.0]  // x^2 - 5x + 6
// let polyRoots = roots(coefficients: polynomial)
// print("Roots: \(polyRoots)")  // Should be [(3.0, 0.0), (2.0, 0.0)] matching MATLAB
