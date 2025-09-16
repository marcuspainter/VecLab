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

    public init(_ data: [Complex], _ rows: Int, _ cols: Int, layout: Matrix.Layout = .rowMajor) {
        precondition(rows * cols == data.count, "Wrong size for data")
        self.rows = rows
        self.cols = cols
        self.data = [Complex](repeating: .zero, count: rows * cols)
        
        transposeComplexMatrix(data, rows: rows, cols: cols, result: &self.data)
    }
    
    public init(_ rows: Int, _ cols: Int) {
        self.rows = rows
        self.cols = cols
        self.data = [Complex](repeating: .zero, count: rows * cols)
    }

    public init(_ array: [[Complex]]) {
        if array.isEmpty {
            return
        }
        self.rows = array.count
        self.cols = array[0].count
        for item in array {
            assert(item.count == self.cols, "Matrix must have consistent column count")
            self.data.append(contentsOf: item)
        }
        //self.data = Self.rowToColMajor(self.data, rows: self.rows, cols: self.cols)
        
        transposeComplexMatrix(self.data, rows: self.rows, cols: self.cols, result: &self.data)
        
       
    }

    init() {
    }
    
    init(_ matrix: ComplexMatrix, data: [Complex]) {
        self.rows = matrix.rows
        self.cols = matrix.cols
        self.data = data
    }

    init(rows: Int, cols: Int, data: [Complex]) {
        if data.isEmpty {
            return
        }
        self.rows = rows
        self.cols = cols
        self.data = data
    }

    init(_ matrix: Matrix) {
        self.rows = matrix.rows
        self.cols = matrix.cols
        self.data = matrix.data.map { Complex($0, 0) }
    }
    
    init(real: [Double], imag: [Double], rows: Int, cols: Int) {
        assert(real.count == imag.count, "Real and imaginary parts must have the same length")
        self.rows = rows
        self.cols = cols
        self.data = zip(real, imag).map { Complex($0, $1) }
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

private func transposeComplexMatrix(
    _ src: [Complex],
    rows M: Int,
    cols N: Int,
    result dst: inout [Complex]
) {
    precondition(src.count == M * N)
    precondition(dst.count == M * N)

    // Safety checks: Complex must be exactly two Doubles, tightly packed
    precondition(MemoryLayout<Complex>.stride == MemoryLayout<Double>.stride * 2,
                 "Complex must be two Doubles with no padding")
    precondition(MemoryLayout<Complex>.size == MemoryLayout<Double>.stride * 2,
                 "Complex must be exactly 16 bytes")
    precondition(MemoryLayout<Complex>.alignment == MemoryLayout<Double>.alignment,
                 "Complex must have same alignment as Double")

    src.withUnsafeBufferPointer { sPtr in
        dst.withUnsafeMutableBufferPointer { dPtr in
            let sBase = UnsafeRawPointer(sPtr.baseAddress!).assumingMemoryBound(to: Double.self)
            let dBase = UnsafeMutableRawPointer(dPtr.baseAddress!).assumingMemoryBound(to: Double.self)

            // Transpose real parts
            vDSP_mtransD(
                sBase, 2,
                dBase, 2,
                vDSP_Length(N),
                vDSP_Length(M)
            )

            // Transpose imaginary parts
            vDSP_mtransD(
                sBase + 1, 2,
                dBase + 1, 2,
                vDSP_Length(N),
                vDSP_Length(M)
            )
        }
    }
}
