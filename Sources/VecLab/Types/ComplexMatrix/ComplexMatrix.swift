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
    public var grid: [Complex] = []

    public init(_ grid: [Complex], _ rows: Int, _ cols: Int, layout: MatrixLayout = .rowMajor) {
        precondition(rows * cols == grid.count, "Wrong size for grid")
        self.rows = rows
        self.cols = cols
        self.grid = grid
        
        self.grid = Self.rowToColMajor(self.grid, rows: self.rows, cols: self.cols)
    }
    
    public init(_ rows: Int, _ cols: Int) {
        self.rows = rows
        self.cols = cols
        self.grid = [Complex](repeating: .zero, count: rows * cols)
    }

    public init(_ array: [[Complex]]) {
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

    init() {
    }
    
    init(_ matrix: ComplexMatrix, grid: [Complex]) {
        self.rows = matrix.rows
        self.cols = matrix.cols
        self.grid = grid
    }

    init(rows: Int, cols: Int, grid: [Complex]) {
        if grid.isEmpty {
            return
        }
        self.rows = rows
        self.cols = cols
        self.grid = grid
    }

    init(_ matrix: Matrix) {
        self.rows = matrix.rows
        self.cols = matrix.cols
        self.grid = matrix.grid.map { Complex($0, 0) }
    }
    
    init(real: [Double], imag: [Double], rows: Int, cols: Int) {
        assert(real.count == imag.count, "Real and imaginary parts must have the same length")
        self.rows = rows
        self.cols = cols
        self.grid = zip(real, imag).map { Complex($0, $1) }
    }

}

extension ComplexMatrix {
    
    func swapRowsCols() {
        
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


func transposeComplexMatrix(_ src: [Double], rows M: Int, cols N: Int, result dst: inout [Double]) {
    precondition(src.count == 2*M*N, "Source array size does not match 2 * rows * cols")
    
    src.withUnsafeBufferPointer { sPtr in
        dst.withUnsafeMutableBufferPointer { dPtr in
            // Transpose real parts
            vDSP_mtransD(
                sPtr.baseAddress!, 2,           // source stride = 2 (real part)
                dPtr.baseAddress!, 2,           // destination stride = 2
                vDSP_Length(N),                 // number of columns in source
                vDSP_Length(M)                  // number of rows in source
            )
            
            // Transpose imaginary parts
            vDSP_mtransD(
                sPtr.baseAddress! + 1,          // start at first imaginary element
                2,                              // source stride = 2
                dPtr.baseAddress! + 1,          // destination start
                2,                              // destination stride = 2
                vDSP_Length(N),
                vDSP_Length(M)
            )
        }
    }
}
