//
//  MatrixComplex+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

extension MatrixComplex {
    
    // Element-wise
    static func .** (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        let c = a.grid ** b.grid
        return MatrixComplex(a, grid: c)
    }
    
    // Element-wise
    static func .** (_ a: MatrixComplex, _ b: Double) -> MatrixComplex {
        let c =  a.grid ** b
        return MatrixComplex(a, grid: c)
    }
    
    // Element-wise
    static func .** (_ a: MatrixComplex, _ b: Matrix) -> MatrixComplex {
        let c =  a.grid ** b.grid
        return MatrixComplex(a, grid: c)
    }
}
