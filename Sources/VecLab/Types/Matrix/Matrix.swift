//
//  Matrix.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

import Accelerate

public struct Matrix {
    public var rows: Int = 0
    public var cols: Int = 0
    public var data: [Double] = [] // Column-major

    public init(_ data: [Double], _ rows: Int, _ cols: Int, order: MatrixOrder = .rowMajor) {
        assert(cols * rows == data.count, "Grid size does not match rows and columns")
        self.rows = rows
        self.cols = cols
        self.data = data

        switch order {
        case .rowMajor:
                self.data = MatrixOp.transposeMatrix(data, rows: rows, columns: cols)
            break
        case .colMajor:
            // No transpose
            break
        }

        precondition(data.count == rows * cols, "Matrix failed")
    }

    public init(_ rows: Int, _ cols: Int, ) {
        self.rows = rows
        self.cols = cols
        self.data = [Double](repeating: 0.0, count: rows * cols)

        precondition(data.count == rows * cols, "Matrix failed")
    }

    public init(_ array: [[Double]]) {
        if array.isEmpty {
            self.data = []
            return
        }
        self.rows = array.count
        self.cols = array.first?.count ?? 0

        // Validate rectangular matrix
        assert(array.allSatisfy { $0.count == cols }, "All rows must have same length")

        let flatData = array.flatMap { $0 }
        self.data = MatrixOp.transposeMatrix(flatData, rows: rows, columns: cols)

        assert(data.count == rows * cols, "Matrix init failed")
    }

    public init() {
        self.data = []
    }

    // Do not convert layout

    public init(rows: Int, cols: Int, data: [Double]) {
        self.rows = rows
        self.cols = cols
        self.data = data
        precondition(data.count == rows * cols, "Matrix failed")
    }

    public init(like matrix: Matrix, data: [Double]) {
        self.rows = matrix.rows
        self.cols = matrix.cols
        self.data = data
        precondition(data.count == rows * cols, "Matrix failed")
    }
}

extension Matrix {

    public static func rowToColMajor(_ input: [Double], rows: Int, cols: Int) -> [Double] {
        precondition(input.count == rows * cols, "Invalid dimensions")

        var output = Array(repeating: 0.0, count: input.count)

        for row in 0..<rows {
            for col in 0..<cols {
                let rowMajorIndex = row * cols + col
                let colMajorIndex = col * rows + row
                output[colMajorIndex] = input[rowMajorIndex]
            }
        }

        return output
    }

    // Row and columns are row-major dimensions
    public static func colToRowMajor(_ input: [Double], rows: Int, cols: Int) -> [Double] {
        precondition(input.count == rows * cols, "Invalid dimensions")

        var output = Array(repeating: 0.0, count: input.count)

        for row in 0..<rows {
            for col in 0..<cols {
                let rowMajorIndex = row * cols + col
                let colMajorIndex = col * rows + row
                output[rowMajorIndex] = input[colMajorIndex]
            }
        }

        return output
    }

}

/*
func transposeMatrix(_ src: [Double], rows M: Int, cols N: Int, result dst: inout [Double]) {
    precondition(src.count == M * N, "Source array size does not match rows * cols")

    src.withUnsafeBufferPointer { srcPtr in
        dst.withUnsafeMutableBufferPointer { dstPtr in
            // vDSP_mtransD copies M×N into N×M, performing a transpose
            vDSP_mtransD(
                srcPtr.baseAddress!,
                1,  // source stride (row-major: 1 element apart)
                dstPtr.baseAddress!,
                1,  // destination stride
                vDSP_Length(N),  // number of columns in the source
                vDSP_Length(M)  // number of rows in the source
            )
        }
    }

}
*/
