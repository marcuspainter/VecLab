//
//  Matrix+Transpose.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

extension Matrix {

    public var T: Matrix {
        let data = matrixTranspose(self.data, rows: self.rows, cols: self.cols)
        return Matrix(rows: self.cols, cols: self.rows, data: data)
    }
}
