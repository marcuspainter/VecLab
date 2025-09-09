//
//  MatrixComplex+Transpose.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

extension MatrixComplex {

    public var T: MatrixComplex {
        let grid = matrixTranspose(self.grid, rows: self.rows, cols: self.cols)
        return MatrixComplex(grid, self.cols, self.rows)
    }

    public var H: MatrixComplex {
        let grid = matrixConjugateTranspose(self.grid, rows: self.rows, cols: self.cols)
        return MatrixComplex(grid, self.cols, self.rows)
    }
}
