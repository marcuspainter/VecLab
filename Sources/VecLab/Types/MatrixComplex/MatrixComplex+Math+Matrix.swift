//
//  MatrixComplex+Matrix.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension MatrixComplex {
    
    public static func + (_ a: MatrixComplex, _ b: Matrix) -> MatrixComplex {
        return a + MatrixComplex(b)
    }

    public static func + (_ a: Matrix, _ b: MatrixComplex) -> MatrixComplex {
        return MatrixComplex(a) + b
    }
    
    public static func - (_ a: MatrixComplex, _ b: Matrix) -> MatrixComplex {
        return a - MatrixComplex(b)
    }

    public static func - (_ a: Matrix, _ b: MatrixComplex) -> MatrixComplex {
        return MatrixComplex(a) - b
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
    
    @available(*, unavailable, message: "Division by a matrix is not supported. Use ./ for element-wise division.")
    public static func / (_ a: MatrixComplex, _ b: Matrix) -> MatrixComplex {
        return MatrixComplex()
    }

    // Element-wise
    public static func ./ (_ a: MatrixComplex, _ b: Matrix) -> MatrixComplex {
        let c = a.grid / b.grid
        return MatrixComplex(a, grid: c)
    }

    @available(*, unavailable, message: "Division by a matrix is not supported. Use ./ for element-wise division.")
    public static func / (_ a: Matrix, _ b: MatrixComplex) -> MatrixComplex {
        return MatrixComplex()
    }

    // Element-wise
    public static func ./ (_ a: Matrix, _ b: MatrixComplex) -> MatrixComplex {
        let c = a.grid / b.grid
        return MatrixComplex(b, grid: c)
    }
}
