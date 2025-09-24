//
//  Matrix+rank.swift
//  VecLab
//
//  Created by Marcus Painter on 17/09/2025.
//

/// Rank of matrix
/// Convenience wrapper that selects between default, absolute, or relative tolerance rank.
/// Preference order if multiple options are provided: absolute tolerance first, then relative tolerance.
/// If neither is provided (or both are invalid), uses the default heuristic.
public func rank(_ a: Matrix, absTol: Double? = nil, rtol: Double? = nil) -> Int {
    if let absTol, absTol.isFinite, absTol > 0 {
        return rank(a, tol: absTol)
    }
    if let rtol, rtol.isFinite, rtol > 0 {
        return rankRelative(a, rtol: rtol)
    }
    return rank(a)
}

/// Returns the numerical rank of matrix `a` using SVD.
/// Singular values less than `tol = max(m, n) * eps * max(s)` are treated as zero,
/// where `eps` is machine epsilon for `Double` (`Double.ulpOfOne`).
func rank(_ a: Matrix) -> Int {
    // Numerical rank via SVD, excluding near-zero singular values
    // tol = max(m, n) * eps * max(s)
    let (_, s, _) = MatrixOp.svd(a: a.data, rows: a.rows, columns: a.cols)
    guard let sMax = s.max(), sMax > 0 else { return 0 }
    let tol = Double(max(a.rows, a.cols)) * Double.ulpOfOne * sMax
    return s.filter { $0 > tol }.count
}

/// Returns the numerical rank of matrix `a` using SVD with a user-specified absolute tolerance.
/// Singular values less than or equal to `tol` are treated as zero.
/// Pass a tolerance in the same scale as the singular values of `a`.
func rank(_ a: Matrix, tol: Double) -> Int {
    let (_, s, _) = MatrixOp.svd(a: a.data, rows: a.rows, columns: a.cols)
    guard !s.isEmpty else { return 0 }

    let threshold: Double
    if tol.isFinite && tol > 0 {
        threshold = tol
    } else if let sMax = s.max(), sMax > 0 {
        // Fallback to default heuristic if `tol` is non-positive or non-finite
        threshold = Double(max(a.rows, a.cols)) * Double.ulpOfOne * sMax
    } else {
        return 0
    }

    return s.filter { $0 > threshold }.count
}

/// Returns the numerical rank of matrix `a` using SVD with a user-specified relative tolerance.
/// Singular values less than or equal to `rtol * max(s)` are treated as zero.
/// If `rtol` is non-positive or non-finite, this falls back to the default heuristic
/// `tol = max(m, n) * eps * max(s)`.
func rankRelative(_ a: Matrix, rtol: Double) -> Int {
    let (_, s, _) = MatrixOp.svd(a: a.data, rows: a.rows, columns: a.cols)
    guard let sMax = s.max(), sMax > 0 else { return 0 }

    let threshold: Double
    if rtol.isFinite && rtol > 0 {
        threshold = rtol * sMax
    } else {
        threshold = Double(max(a.rows, a.cols)) * Double.ulpOfOne * sMax
    }

    return s.filter { $0 > threshold }.count
}


