//
//  MatrixComplex.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

public struct MatrixComplex {

    public var rows: Int = 0
    public var cols: Int = 0
    public var grid: [Complex] = []

    public init(_ grid: [Complex], _ rows: Int, _ cols: Int) {
        if grid.isEmpty {
            return
        }
        self.rows = rows
        self.cols = cols
        self.grid = grid
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
    }

    init() {
    }

    init(_ matrix: MatrixComplex, grid: [Complex]) {
        if grid.isEmpty {
            return
        }
        self.rows = matrix.rows
        self.cols = matrix.cols
        self.grid = grid
    }

    init(_ matrix: Matrix) {
        self.rows = matrix.rows
        self.cols = matrix.cols
        grid = matrix.grid.map { Complex($0, 0) }
    }
    
    init(real: [Double], imag: [Double], rows: Int, cols: Int) {
        assert(real.count == imag.count, "Real and imaginary parts must have the same length")
        self.rows = rows
        self.cols = cols
        self.grid = zip(real, imag).map { Complex($0, $1) }
    }

}
