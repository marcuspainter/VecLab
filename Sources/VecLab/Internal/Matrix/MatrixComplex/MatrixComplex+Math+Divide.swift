//
//  MatrixComplex+Math+Divide.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

import Accelerate

public extension MatrixComplex {
    
    @available(*, unavailable, message: "Use ./")
    static func / (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        return MatrixComplex()
    }
    
    // Element-wise
    static func ./ (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        let c = a.grid / b.grid
        return MatrixComplex(a, grid: c)
    }
    
    static func / (_ a: MatrixComplex, _ b: Double) -> MatrixComplex {
        let c = a.grid / b
        return MatrixComplex(a, grid: c)
    }
    
    static func / (_ a: Double, _ b: MatrixComplex) -> MatrixComplex {
        let c = a / b.grid
        return MatrixComplex(b, grid: c)
    }
    
    @available(*, unavailable, message: "Use ./")
    static func / (_ a: MatrixComplex, _ b: Matrix) -> MatrixComplex {
        return MatrixComplex()
    }
    
    // Element-wise
    static func ./ (_ a: MatrixComplex, _ b: Matrix) -> MatrixComplex {
        let c = a.grid / b.grid
        return MatrixComplex(a, grid: c)
    }
    
    @available(*, unavailable, message: "Use ./")
    static func / (_ a: Matrix, _ b: MatrixComplex) -> MatrixComplex {
        return MatrixComplex()
    }
    
    // Element-wise
    static func ./ (_ a: Matrix, _ b: MatrixComplex) -> MatrixComplex {
        let c = a.grid / b.grid
        return MatrixComplex(b, grid: c)
    }
    
    static func / (_ a: MatrixComplex, _ b: Complex) -> MatrixComplex {
        let c = a.grid / b
        return MatrixComplex(a, grid: c)
    }
    
    static func / (_ a: Complex, _ b: MatrixComplex) -> MatrixComplex {
        let c = a / b.grid
        return MatrixComplex(b, grid: c)
    }
}

