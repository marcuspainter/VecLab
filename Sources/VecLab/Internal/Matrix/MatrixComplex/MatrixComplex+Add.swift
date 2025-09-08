//
//  MatrixComplex+Add.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

extension MatrixComplex {
    
    static func + (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        let c = a.grid + b.grid
        return MatrixComplex(a, grid: c)
    }
    
    static func + (_ a: MatrixComplex, _ b: Double) -> MatrixComplex {
        let c = a.grid + b
        return MatrixComplex(a, grid: c)
    }
    
    static func + (_ a: Double, _ b: MatrixComplex) -> MatrixComplex {
        let c = a + b.grid
        return MatrixComplex(b, grid: c)
    }
    
    static func + (_ a: MatrixComplex, _ b: Matrix) -> MatrixComplex {
        return a + MatrixComplex(b)
    }
    
    static func + (_ a: Matrix, _ b: MatrixComplex) -> MatrixComplex {
        return MatrixComplex(a) + b
    }
    
    static func + (_ a: MatrixComplex, _ b: ComplexDouble) -> MatrixComplex {
        let c = a.grid + b
        return MatrixComplex(a, grid: c)
    }
    
    static func + (_ a: ComplexDouble, _ b: MatrixComplex) -> MatrixComplex {
        let c = a + b.grid
        return MatrixComplex(b, grid: c)
    }
}


