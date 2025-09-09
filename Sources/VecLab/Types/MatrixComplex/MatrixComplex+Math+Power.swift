//
//  MatrixComplex+Math+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

public extension MatrixComplex {
    
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
    
    // MARK: Not implemented
    
    @available(*, unavailable, renamed: ".**", message: "Matrices cannot be raised to the power of a matrix. Did you mean .**")
    static func ** (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        return MatrixComplex()
    }
    
    @available(*, unavailable, message: "Double cannot be raised to the power of a matrix")
    static func ** (_ a: Double, _ b: MatrixComplex) -> MatrixComplex {
        return MatrixComplex()
    }
}
