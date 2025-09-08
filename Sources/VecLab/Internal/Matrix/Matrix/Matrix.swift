//
//  Matrix.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

struct Matrix {
    var rows: Int = 0
    var cols: Int = 0
    var grid: [Double] = []
    
    init(_ grid: [Double], rows: Int, cols: Int, ) {
        assert(cols*rows == grid.count, "Grid size does not match rows and columns")
        self.rows = rows
        self.cols = cols
        self.grid = grid
    }
    
    init(_ array: [[Double]]) {
        grid = cat(array)
    }
    
    init() {
    }
    
    init(_ matrix: Matrix, grid: [Double]) {
        self.rows = matrix.rows
        self.cols = matrix.cols
        self.grid = grid
    }
}
