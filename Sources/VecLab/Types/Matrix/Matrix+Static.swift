//
//  Matrix+Static.swift
//  VecLab
//
//  Created by Marcus Painter on 14/09/2025.
//

extension Matrix {

    public enum Layout {
        case rowMajor
        case colMajor
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
