//
//  Matrix+Math+Multiply.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

import Foundation
import Accelerate

public extension Matrix {
    
    static func * (_ a: Matrix, _ b: Matrix) -> Matrix {
        validateCompatible(a, b)
        let c = matrixMultiply(a.grid, b.grid, m: a.rows, k: a.cols, n: b.rows)
        return Matrix(c, rows: a.rows, cols: b.cols)
    }
    
    static func .* (_ a: Matrix, _ b: Matrix) -> Matrix {
        validateSize(a, b)
        let c = a.grid * b.grid
        return Matrix(a, grid: c)
    }
    
    static func * (_ a: Matrix, _ b: Double) -> Matrix {
        let c = a.grid * b
        return Matrix(a, grid: c)
    }
    
    static func * (_ a: Double, _ b: Matrix) -> Matrix {
        let c = a * b.grid
        return Matrix(b, grid: c)
    }
    
}

