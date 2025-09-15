//
//  ComplexMatrix+Transpose.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

extension ComplexMatrix {

    public var T: ComplexMatrix {
        let grid = matrixTranspose(self.grid, rows: self.rows, cols: self.cols)
        return ComplexMatrix(rows: self.cols, cols: self.rows, grid: grid)
    }

    public var H: ComplexMatrix {
        let grid = matrixConjugateTranspose(self.grid, rows: self.rows, cols: self.cols)
        return ComplexMatrix(rows: self.cols, cols: self.rows, grid: grid)
    }
}
