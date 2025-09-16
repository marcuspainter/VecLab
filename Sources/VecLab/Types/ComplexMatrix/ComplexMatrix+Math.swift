//
//  ComplexMatrix+Math.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension ComplexMatrix {
    
    public static func + (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a.data + b.data
        return ComplexMatrix(a, data: c)
    }
    
    public static func - (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a.data - b.data
        return ComplexMatrix(a, data: c)
    }
    
    /// Addition.
    /// - Parameters:
    ///   - lhs: This complex matrix.
    ///   - rhs: A complex matrix.
    @inlinable
    public static func += (lhs: inout ComplexMatrix, rhs: ComplexMatrix) {
        lhs = lhs + rhs
    }
    
    public static func * (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        validateCompatible(a, b)
        let c = matrixMultiply(a.data, b.data, m: a.rows, k: a.cols, n: b.rows)
        return ComplexMatrix(rows: a.rows, cols: b.cols, data: c)
    }
    
    // Element-wise
    public static func .* (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        validateSize(a, b)
        let c = a.data * b.data
        return ComplexMatrix(rows: a.rows, cols: a.cols, data: c)
    }
    
    @available(*, unavailable, message: "Matrix division is not supported. Use ./ for element-wise division.")
    public static func / (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix()
    }
    
    // Element-wise
    public static func ./ (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a.data / b.data
        return ComplexMatrix(rows: a.rows, cols: a.cols, data: c)
    }
    
}
