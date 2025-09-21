//
//  Matrix_roots.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

import Accelerate

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
        return [Complex]()
    }

    // Get normalized coefficients (divide by leading coefficient)
    let p = coefficients[startIndex...]

    // Handle special case for linear polynomial
    if p.count == 2 {
        let realRoot = -p[1] / p[0]
        var result = [Complex(realRoot, 0.0)]

        // Add zero roots if needed
        if startIndex > 0 {
            let zeroRoots = ComplexArray(count: startIndex)
            result.append(contentsOf: zeroRoots)
        }
        return result
    }

    let n = p.count - 1

    // Create the companion matrix (column-major order for LAPACK)
    var A = Matrix(n, n)

    // Set the subdiagonal to ones: diag(ones(n-1,1),-1)
    //for i in 0..<(n - 1) {
    //    A.data[(i + 1) + i * n] = 1.0
    //}
    
    for i in 0..<(n - 1) {
        A[i+1, i] = 1.0
    }
    
    // Set the first row to -p(2:n+1)./p(1)
    //for i in 0..<n {
    //    A.data[i * n] = -p[i + 1] / p[0]
    //}
    
    for i in 0..<n {
        A[0, i] = -p[i + 1] / p[0]
    }

    // Compute eigenvalues using LAPACK
    var result = eig(A)

    // Add zero roots if needed
    if startIndex > 0 {
        let zeroRoots = ComplexArray(count: startIndex)
        result.append(contentsOf: zeroRoots)
    }

    return result
}

fileprivate func eig(_ a: Matrix) -> ComplexArray {
    precondition(a.rows == a.cols, "Matrix must be square")
    let values = eigenvalues(a.data, a.rows)
    return ComplexArray(real: values.real, imag: values.imag)
}

fileprivate func eigenvalues(_ A: [Double], _ n: Int) -> (real: [Double], imag: [Double]) {
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

