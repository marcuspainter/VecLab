//
//  ComplexMatrix+Math.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension ComplexMatrix {
    
    public static func + (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        //let c = a.data + b.data
        //return ComplexMatrix(a, data: c)
        return CoreComplexMatrix.add(a, b)
    }
    
    public static func - (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        //let c = a.data - b.data
        //return ComplexMatrix(a, data: c)
        return CoreComplexMatrix.subtract(a, b)
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
        //validateCompatible(a, b)
        //let c = matrixMultiply(a.data, b.data, m: a.rows, k: a.cols, n: b.rows)
        //return ComplexMatrix(rows: a.rows, cols: b.cols, data: c)
        return CoreComplexMatrix.multiply(a, b)
    }
    
    // Element-wise
    public static func .* (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        //validateSize(a, b)
        //let c = a.data * b.data
        //return ComplexMatrix(rows: a.rows, cols: a.cols, data: c)
        return CoreComplexMatrix.elementMultiply(a, b)
    }
    
    @available(*, unavailable, message: "Matrix division is not supported. Use ./ for element-wise division.")
    public static func / (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix()
        //return CoreComplexMatrix.divide(a, b)
    }
    
    // Element-wise
    public static func ./ (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        //let c = a.data / b.data
        //return ComplexMatrix(rows: a.rows, cols: a.cols, data: c)
        return CoreComplexMatrix.elementDivide(a, b)
    }
    
}
