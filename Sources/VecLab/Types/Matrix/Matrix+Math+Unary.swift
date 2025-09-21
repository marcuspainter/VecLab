//
//  Matrix+Math+Unary.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

extension Matrix {

    public static prefix func - (_ a: Matrix) -> Matrix {
        return Matrix(like: a, data: -a.data)
    }
}
