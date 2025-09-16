//
//  ComplexMatrix+Transpose.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

extension ComplexMatrix {

    public var T: ComplexMatrix {
        let data = matrixTranspose(self.data, rows: self.rows, cols: self.cols)
        return ComplexMatrix(rows: self.cols, cols: self.rows, data: data)
    }

    public var H: ComplexMatrix {
        let data = matrixConjugateTranspose(self.data, rows: self.rows, cols: self.cols)
        return ComplexMatrix(rows: self.cols, cols: self.rows, data: data)
    }
}
