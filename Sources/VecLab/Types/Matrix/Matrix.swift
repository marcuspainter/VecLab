//
//  Matrix.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

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
        self.grid = Self.rowToColMajor(self.grid, rows: self.rows, cols: self.cols)
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
        self.grid = Self.rowToColMajor(self.grid, rows: self.rows, cols: self.cols)
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
