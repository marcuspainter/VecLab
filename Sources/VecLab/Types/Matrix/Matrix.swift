//
//  Matrix.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

public struct Matrix {
    public var rows: Int = 0
    public var cols: Int = 0
    public var grid: [Double] = []
    
    public init(_ grid: [Double], _ rows: Int, _ cols: Int, ) {
        assert(cols*rows == grid.count, "Grid size does not match rows and columns")
        self.rows = rows
        self.cols = cols
        self.grid = grid
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
    }
    
    public init() {
    }
    
    public init(_ matrix: Matrix, grid: [Double]) {
        self.rows = matrix.rows
        self.cols = matrix.cols
        self.grid = grid
    }
}
