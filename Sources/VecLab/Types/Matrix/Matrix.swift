//
//  Matrix.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

import Accelerate

public enum MatrixLayout {
    case rowMajor
    case colMajor
}


public struct Matrix: Sendable {
    public var rows: Int = 0
    public var cols: Int = 0
    public var grid: [Double] = []

    public init(_ grid: [Double], _ rows: Int, _ cols: Int, layout: MatrixLayout = .rowMajor ) {
        assert(cols * rows == grid.count, "Grid size does not match rows and columns")
        self.rows = rows
        self.cols = cols
        self.grid = grid
        //self.grid = Self.rowToColMajor(self.grid, rows: self.rows, cols: self.cols)
        if layout == .rowMajor {
            transposeMatrix(grid, rows: rows, cols: cols, result: &self.grid)
        }

        
    }

    public init(_ rows: Int, _ cols: Int, ) {
        self.rows = rows
        self.cols = cols
        self.grid = [Double](repeating: 0.0, count: rows * cols)
    }

    public init(_ array: [[Double]]) {
        if array.isEmpty {
            return
        }
        self.rows = array.count
        self.cols = array[0].count
        for item in array {
            assert(item.count == self.cols, "Matrix must have consistent column count")
            self.grid.append(contentsOf: item)
        }
        //self.grid = Self.rowToColMajor(self.grid, rows: self.rows, cols: self.cols)
        
        transposeMatrix(grid, rows: rows, cols: cols, result: &self.grid)
    }

    public init() {
    }

    // Do not convert layout
    
    public init(_ matrix: Matrix, grid: [Double]) {
        self.rows = matrix.rows
        self.cols = matrix.cols
        self.grid = grid
    }
    
    public init(rows: Int, cols: Int, grid: [Double]) {
        self.rows = rows
        self.cols = cols
        self.grid = grid
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
