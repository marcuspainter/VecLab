//
//  MathComplex+Math+Double.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension MatrixComplex {
    
    public static func + (_ a: MatrixComplex, _ b: Double) -> MatrixComplex {
        let c = a.grid + b
        return MatrixComplex(a, grid: c)
    }
    
    public static func + (_ a: Double, _ b: MatrixComplex) -> MatrixComplex {
        let c = a + b.grid
        return MatrixComplex(b, grid: c)
    }
    
    // MARK -
    
    public static func - (_ a: MatrixComplex, _ b: Double) -> MatrixComplex {
        let c = a.grid - b
        return MatrixComplex(a, grid: c)
    }
    
    public static func - (_ a: Double, _ b: MatrixComplex) -> MatrixComplex {
        let c = a - b.grid
        return MatrixComplex(b, grid: c)
    }
    
    // MARK *
    
    public static func * (_ a: MatrixComplex, _ b: Double) -> MatrixComplex {
        let c = a.grid * b
        return MatrixComplex(a, grid: c)
    }
    
    public static func * (_ a: Double, _ b: MatrixComplex) -> MatrixComplex {
        let c = a * b.grid
        return MatrixComplex(b, grid: c)
    }
    
    // MARK /
    
    public static func / (_ a: MatrixComplex, _ b: Double) -> MatrixComplex {
        let c = a.grid / b
        return MatrixComplex(a, grid: c)
    }

    public static func / (_ a: Double, _ b: MatrixComplex) -> MatrixComplex {
        let c = a / b.grid
        return MatrixComplex(b, grid: c)
    }
}
