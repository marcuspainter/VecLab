//
//  Matrix+Transpose.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

public extension Matrix {
    
    var T: Matrix {
        let grid = matrixTranspose(self.grid, rows: self.rows, cols: self.cols)
        return Matrix(grid, self.cols, self.rows)
    }
}
