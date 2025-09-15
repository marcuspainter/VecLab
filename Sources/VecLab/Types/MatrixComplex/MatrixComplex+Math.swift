//
//  MatrixComplex+Math.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension MatrixComplex {
    
    public static func + (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        let c = a.grid + b.grid
        return MatrixComplex(a, grid: c)
    }
    
    public static func - (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        let c = a.grid - b.grid
        return MatrixComplex(a, grid: c)
    }
    
    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex matrix.
    ///   - rhs: A complex matrix.
    @inlinable
    public static func += (lhs: inout MatrixComplex, rhs: MatrixComplex) {
        lhs = lhs + rhs
    }
    
    public static func * (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        validateCompatible(a, b)
        let c = matrixMultiply(a.grid, b.grid, m: a.rows, k: a.cols, n: b.rows)
        return MatrixComplex(rows: a.rows, cols: b.cols, grid: c)
    }
    
    // Element-wise
    public static func .* (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        validateSize(a, b)
        let c = a.grid * b.grid
        return MatrixComplex(rows: a.rows, cols: a.cols, grid: c)
    }
    
    @available(*, unavailable, message: "Matrix division is not supported. Use ./ for element-wise division.")
    public static func / (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        return MatrixComplex()
    }
    
    // Element-wise
    public static func ./ (_ a: MatrixComplex, _ b: MatrixComplex) -> MatrixComplex {
        let c = a.grid / b.grid
        return MatrixComplex(rows: a.rows, cols: a.cols, grid: c)
    }
    
}
