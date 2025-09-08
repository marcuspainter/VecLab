//
//  MatrixComlex+Unary.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

extension MatrixComplex {
    
    static prefix func - (_ a: MatrixComplex) -> MatrixComplex {
        return MatrixComplex(a, grid: -a.grid)
    }
}
