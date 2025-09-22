//
//  ComplexMatrix.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

import Accelerate

public struct ComplexMatrix {

    public var rows: Int = 0
    public var cols: Int = 0
    public var data: [Complex] = []

    public init(_ data: [Complex], _ rows: Int, _ cols: Int, order: MatrixOrder = .rowMajor) {
        precondition(rows * cols == data.count, "Wrong size for data")
        self.rows = rows
        self.cols = cols
        self.data = [Complex](repeating: .zero, count: rows * cols)

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

    public init(_ rows: Int, _ cols: Int) {
        self.rows = rows
        self.cols = cols
        self.data = [Complex](repeating: .zero, count: rows * cols)

        precondition(data.count == rows * cols, "Matrix failed")
    }

    public init(_ array: [[Complex]]) {
        if array.isEmpty {
            return
        }
        self.rows = array.count
        self.cols = array.first?.count ?? 0

        // Validate rectangular matrix
        assert(array.allSatisfy { $0.count == cols }, "All rows must have same length")

        let flatData = array.flatMap { $0 }

        self.data = MatrixOp.transposeMatrix(flatData, rows: rows, columns: cols)

        precondition(data.count == rows * cols, "Matrix failed")
    }

    init() {
    }

    init(like matrix: ComplexMatrix, data: [Complex]) {
        self.rows = matrix.rows
        self.cols = matrix.cols
        self.data = data

        precondition(data.count == rows * cols, "Matrix failed")
    }

    init(rows: Int, cols: Int, data: [Complex]) {
        if data.isEmpty {
            return
        }
        self.rows = rows
        self.cols = cols
        self.data = data

        precondition(data.count == rows * cols, "Matrix failed")
    }

    public init(_ matrix: Matrix) {
        self.rows = matrix.rows
        self.cols = matrix.cols
        self.data = matrix.data.map { Complex($0, 0) }

        precondition(data.count == rows * cols, "Matrix failed")
    }

    init(real: [Double], imag: [Double], rows: Int, cols: Int) {
        assert(real.count == imag.count, "Real and imaginary parts must have the same length")
        self.rows = rows
        self.cols = cols
        self.data = zip(real, imag).map { Complex($0, $1) }

        precondition(data.count == rows * cols, "Matrix failed")
    }

}

extension ComplexMatrix {

    public static func rowToColMajor(_ input: [Complex], rows: Int, cols: Int) -> [Complex] {
        precondition(input.count == rows * cols, "Invalid dimensions")

        var output = [Complex](repeating: .zero, count: input.count)

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
    public static func colToRowMajor(_ input: [Complex], rows: Int, cols: Int) -> [Complex] {
        precondition(input.count == rows * cols, "Invalid dimensions")

        var output = [Complex](repeating: .zero, count: input.count)

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
