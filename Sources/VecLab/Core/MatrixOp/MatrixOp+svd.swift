//
//  svd.swift
//
//
//  Created by Marcus Painter on 13/09/2023.
//

import Accelerate
import Foundation

extension MatrixOp {

    // U = (M,M)
    // S = (M) or (M.L)
    // VT = (L,L)
    // Divide and conquer algorithm
    // This matches Matlab output
    enum Jobz {
        case all  // full SVD, like MATLAB's default
        case some  // economy SVD
        case none  // singular values only
        case overwrite  // overwrite A with U/VT (advanced use)

        var lapackChar: Int8 {
            switch self {
            case .all: return Int8(UInt8(ascii: "A"))
            case .some: return Int8(UInt8(ascii: "S"))
            case .none: return Int8(UInt8(ascii: "N"))
            case .overwrite: return Int8(UInt8(ascii: "O"))
            }
        }
    }

    /// Compute the singular value decomposition of matrix `a` (size m×n).
    /// - Parameters:
    ///   - a: Input matrix in column-major order
    ///   - rows: Number of rows (m)
    ///   - columns: Number of columns (n)
    ///   - jobz: Which form of SVD to compute
    /// - Returns: (U, S, VT) where shapes depend on `jobz`
    static func svd(
        a: [Double],
        rows m: Int,
        columns n: Int,
        jobz: Jobz = .all
    ) -> (u: [Double], s: [Double], vt: [Double]) {

        var jobzChar = jobz.lapackChar
        var m = m
        var n = n
        var lda = m
        var aa = a  // copy since LAPACK overwrites input
        let k = Swift.min(m, n)

        // Allocate outputs depending on jobz
        var u: [Double]
        var vt: [Double]
        switch jobz {
        case .all:
            u = [Double](repeating: 0.0, count: m * m)
            vt = [Double](repeating: 0.0, count: n * n)
        case .some:
            u = [Double](repeating: 0.0, count: m * k)
            vt = [Double](repeating: 0.0, count: k * n)
        case .none:
            u = []
            vt = []
        case .overwrite:
            // Advanced case, LAPACK overwrites A with U or VT depending on shape
            fatalError("jobz = .overwrite not implemented yet")
        }

        var s = [Double](repeating: 0.0, count: k)

        // Workspaces
        var work = [Double](repeating: 0.0, count: 1)
        var lwork = -1
        var iwork = [Int](repeating: 0, count: 8 * k)
        var info: Int = 0

        // Workspace query
        withUnsafeMutablePointer(to: &jobzChar) { jobzPtr in
            aa.withUnsafeMutableBufferPointer { aBuf in
                s.withUnsafeMutableBufferPointer { sBuf in
                    u.withUnsafeMutableBufferPointer { uBuf in
                        vt.withUnsafeMutableBufferPointer { vtBuf in
                            work.withUnsafeMutableBufferPointer { workBuf in
                                iwork.withUnsafeMutableBufferPointer { iworkBuf in
                                    guard let aPtr = aBuf.baseAddress,
                                        let sPtr = sBuf.baseAddress,
                                        let uPtr = uBuf.baseAddress,
                                        let vtPtr = vtBuf.baseAddress,
                                        let workPtr = workBuf.baseAddress,
                                        let iworkPtr = iworkBuf.baseAddress
                                    else { preconditionFailure("SVD buffers must not be empty") }

                                    dgesdd_(
                                        jobzPtr,
                                        &m,
                                        &n,
                                        aPtr,
                                        &lda,
                                        sPtr,
                                        uPtr,
                                        &m,
                                        vtPtr,
                                        &n,
                                        workPtr,
                                        &lwork,
                                        iworkPtr,
                                        &info
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
        precondition(info == 0, "SVD workspace query failed with info=\(info)")

        // Resize workspace and compute
        lwork = Int(work[0])
        work = [Double](repeating: 0.0, count: Int(lwork))

        withUnsafeMutablePointer(to: &jobzChar) { jobzPtr in
            aa.withUnsafeMutableBufferPointer { aBuf in
                s.withUnsafeMutableBufferPointer { sBuf in
                    u.withUnsafeMutableBufferPointer { uBuf in
                        vt.withUnsafeMutableBufferPointer { vtBuf in
                            work.withUnsafeMutableBufferPointer { workBuf in
                                iwork.withUnsafeMutableBufferPointer { iworkBuf in
                                    guard let aPtr = aBuf.baseAddress,
                                        let sPtr = sBuf.baseAddress,
                                        let uPtr = uBuf.baseAddress,
                                        let vtPtr = vtBuf.baseAddress,
                                        let workPtr = workBuf.baseAddress,
                                        let iworkPtr = iworkBuf.baseAddress
                                    else { preconditionFailure("SVD buffers must not be empty") }

                                    dgesdd_(
                                        jobzPtr,
                                        &m,
                                        &n,
                                        aPtr,
                                        &lda,
                                        sPtr,
                                        uPtr,
                                        &m,
                                        vtPtr,
                                        &n,
                                        workPtr,
                                        &lwork,
                                        iworkPtr,
                                        &info
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
        precondition(info == 0, "SVD computation failed with info=\(info)")

        return (u, s, vt)
    }
}
