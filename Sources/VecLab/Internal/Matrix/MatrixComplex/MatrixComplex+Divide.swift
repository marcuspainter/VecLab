//
//  MatrixComplex+Divide.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

import Accelerate

extension MatrixComplex {
    
    @available(*, unavailable, message: "Use ./")
    static func / (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        return MatrixComplex()
    }
    
    // Element-wise
    static func ./ (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        let c = a.grid / b.grid
        return MatrixComplex(a, grid: c)
    }
    
    static func / (_ a: MatrixComplex, _ b: Double) -> MatrixComplex {
        let c = a.grid / b
        return MatrixComplex(a, grid: c)
    }
    
    static func / (_ a: Double, _ b: MatrixComplex) -> MatrixComplex {
        let c = a / b.grid
        return MatrixComplex(b, grid: c)
    }
    
    @available(*, unavailable, message: "Use ./")
    static func / (_ a: MatrixComplex, _ b: Matrix) -> MatrixComplex {
        return MatrixComplex()
    }
    
    // Element-wise
    static func ./ (_ a: MatrixComplex, _ b: Matrix) -> MatrixComplex {
        let c = a.grid / b.grid
        return MatrixComplex(a, grid: c)
    }
    
    @available(*, unavailable, message: "Use ./")
    static func / (_ a: Matrix, _ b: MatrixComplex) -> MatrixComplex {
        return MatrixComplex()
    }
    
    // Element-wise
    static func ./ (_ a: Matrix, _ b: MatrixComplex) -> MatrixComplex {
        let c = a.grid / b.grid
        return MatrixComplex(b, grid: c)
    }
    
    static func / (_ a: MatrixComplex, _ b: Complex) -> MatrixComplex {
        let c = a.grid / b
        return MatrixComplex(a, grid: c)
    }
    
    static func / (_ a: Complex, _ b: MatrixComplex) -> MatrixComplex {
        let c = a / b.grid
        return MatrixComplex(b, grid: c)
    }
}

func matrixDivide(_ a: [Complex], _ b: [Complex], m: Int, k: Int, n: Int) -> [Complex] {
    // This computes A / B as A * B^(-1) by solving B * X = A for X
    // Where A is m×k, B is k×k (must be square), result X is m×k
    
    var result = a // Copy A as initial value
    var bCopy = b  // Copy B since LAPACK will modify it
    var ipiv = [Int](repeating: 0, count: k) // Pivot indices
    var info: Int = 0
    var kk = k
    
    result.withUnsafeMutableBufferPointer { resultPtr in
        bCopy.withUnsafeMutableBufferPointer { bPtr in
            ipiv.withUnsafeMutableBufferPointer { ipivPtr in
                // Step 1: Factor B using LU decomposition
                zgetrf_(&kk,                             // M: Number of rows of B
                       &kk,                             // N: Number of columns of B
                       OpaquePointer(bPtr.baseAddress), // A: Matrix B (will be overwritten with LU)
                       &kk,                             // LDA: Leading dimension of B
                       ipivPtr.baseAddress,             // IPIV: Pivot indices
                       &info)                           // INFO: Success/error code
                
                guard info == 0 else {
                    fatalError("Matrix factorization failed with info = \(info)")
                }
                
                // Step 2: Solve B * X = A using the LU factorization
                zgetrs_("N",                            // TRANS: 'N' for no transpose
                       &kk,                             // N: Order of matrix B
                       &kk,                             // NRHS: Number of right-hand sides (columns of A)
                       OpaquePointer(bPtr.baseAddress), // A: LU factorization of B
                       &kk,                             // LDA: Leading dimension of B
                       ipivPtr.baseAddress,             // IPIV: Pivot indices from factorization
                       OpaquePointer(resultPtr.baseAddress), // B: Right-hand side A, overwritten with solution X
                       &kk,                             // LDB: Leading dimension of result
                       &info)                           // INFO: Success/error code
                
                guard info == 0 else {
                    fatalError("Matrix solve failed with info = \(info)")
                }
            }
        }
    }
    
    return result
}

import Accelerate

func matrixInverse(_ matrix: inout [Double], _ n: Int) {
    // Step 1: LU factorization
    var m = n
    var lda = n
    var ipiv = Array<Int>(repeating: 0, count: n)
    var info = 0
    
    dgetrf_(&m, &m, &matrix, &lda, &ipiv, &info)
    
    if info != 0 {
        print("DGETRF error: \(info)")
        return
    }
    
    // Step 2: Compute inverse
    var lwork = -1
    var workQuery = 0.0
    
    dgetri_(&m, &matrix, &lda, &ipiv, &workQuery, &lwork, &info)
    
    lwork = Int(workQuery)
    var work = Array<Double>(repeating: 0.0, count: lwork)
    
    dgetri_(&m, &matrix, &lda, &ipiv, &work, &lwork, &info)
    
    if info != 0 {
        print("DGETRI error: \(info)")
    }
}
