//
//  Matrix+Transpose.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

extension Matrix {

    public var T: Matrix {
        return CoreMatrix.transpose(self)
    }
}
