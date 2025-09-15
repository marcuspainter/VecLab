//
//  Matrix+Layout.swift
//  VecLab
//
//  Created by Marcus Painter on 15/09/2025.
//

import Accelerate
/*
func rowMajorToColumnMajor(_ src: [Double], rows M: Int, cols N: Int) -> [Double] {
    
    return [Double](unsafeUninitializedCapacity: M * N) { dst, initializedCount in
        
        src.withUnsafeBufferPointer { srcPtr in
            dst.withUnsafeMutableBufferPointer { dstPtr in
                for col in 0..<N {
                    cblas_dcopy(
                        (M),                     // number of elements in the column
                        srcPtr.baseAddress! + col,    // pointer to start of column in row-major
                        (N),                  // stride in source (skip to next row)
                        dstPtr.baseAddress! + col * M, // pointer to start of column in dst
                        1                             // stride in destination (contiguous)
                    )
                }
            }
        }
        initializedCount = src.count
    }
}

import Accelerate

func columnMajorToRowMajor(_ src: [Double], rows M: Int, cols N: Int) -> [Double] {
    
    return [Double](unsafeUninitializedCapacity: M * N) { dst, initializedCount in
        
        src.withUnsafeBufferPointer { srcPtr in
            dst.withUnsafeMutableBufferPointer { dstPtr in
                for col in 0..<N {
                    // Copy column from column-major into the correct row-major positions
                    cblas_dcopy(
                        (M),                            // number of elements (rows)
                        srcPtr.baseAddress! + col * M,  // start of column in column-major
                        1,                              // source stride = contiguous
                        dstPtr.baseAddress! + col,      // start of column in row-major
                        (N)                             // destination stride = number of columns
                    )
                }
            }
        }
        initializedCount = src.count
    }
}

/// Transpose a Double matrix.
/// - Parameters:
///   - src: Source matrix in row-major order (flattened array)
///   - rows: Number of rows in the source matrix
///   - cols: Number of columns in the source matrix
/// - Returns: Transposed matrix as a flattened array in row-major order
func transposeMatrix(_ src: [Double], rows M: Int, cols N: Int) -> [Double] {
    precondition(src.count == M * N, "Source array size does not match rows * cols")
    
    return [Double](unsafeUninitializedCapacity: M * N) { dst, initializedCount in
        
        src.withUnsafeBufferPointer { srcPtr in
            dst.withUnsafeMutableBufferPointer { dstPtr in
                // vDSP_mtransD copies M×N into N×M, performing a transpose
                vDSP_mtransD(
                    srcPtr.baseAddress!,
                    1,                     // source stride (row-major: 1 element apart)
                    dstPtr.baseAddress!,
                    1,                     // destination stride
                    vDSP_Length(N),        // number of columns in the source
                    vDSP_Length(M)         // number of rows in the source
                )
            }
        }
        initializedCount = src.count
    }
}

func transposeMatrix(_ src: [Double], rows M: Int, cols N: Int, result dst: inout [Double]) {
    precondition(src.count == M * N, "Source array size does not match rows * cols")

    src.withUnsafeBufferPointer { srcPtr in
        dst.withUnsafeMutableBufferPointer { dstPtr in
            // vDSP_mtransD copies M×N into N×M, performing a transpose
            vDSP_mtransD(
                srcPtr.baseAddress!,
                1,                     // source stride (row-major: 1 element apart)
                dstPtr.baseAddress!,
                1,                     // destination stride
                vDSP_Length(N),        // number of columns in the source
                vDSP_Length(M)         // number of rows in the source
            )
        }
    }

}

*/

