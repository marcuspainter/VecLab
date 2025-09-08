//
//  MatrixComplex+Math*Multiply.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

import Accelerate

public extension MatrixComplex {
    
    static func * (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        validateCompatible(a, b)
        let c = matrixMultiply(a.grid, b.grid, m: a.rows, k: a.cols, n: b.rows)
        return MatrixComplex(c, rows: a.rows, cols: b.cols)
    }
    
    // Element-wise
    static func .* (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        validateSize(a, b)
        let c = a.grid * b.grid
        return MatrixComplex(a, grid: c)
    }
    
    static func * (_ a: MatrixComplex, _ b: Double) -> MatrixComplex {
        let c = a.grid * b
        return MatrixComplex(a, grid: c)
    }
    
    static func * (_ a: Double, _ b: MatrixComplex) -> MatrixComplex {
        let c = a * b.grid
        return MatrixComplex(b, grid: c)
    }
    
    static func * (_ a: MatrixComplex, _ b: Matrix) -> MatrixComplex {
        return a * MatrixComplex(b)
    }
    
    // Element-wise
    static func .* (_ a: MatrixComplex, _ b: Matrix) -> MatrixComplex {
        validateSize(a, b)
        let c = a.grid * b.grid
        return MatrixComplex(a, grid: c)
    }
    
    static func * (_ a: Matrix, _ b: MatrixComplex) -> MatrixComplex {
        return MatrixComplex(a) * b
    }
    
    // Element-wise
    static func .* (_ a: Matrix, _ b: MatrixComplex) -> MatrixComplex {
        validateSize(a, b)
        let c = a.grid * b.grid
        return MatrixComplex(b, grid: c)
    }
    
    static func * (_ a: MatrixComplex, _ b: Complex) -> MatrixComplex {
        let c = a.grid * b
        return MatrixComplex(a, grid: c)
    }
    
    static func * (_ a: Complex, _ b: MatrixComplex) -> MatrixComplex {
        let c = a * b.grid
        return MatrixComplex(b, grid: c)
    }
}

