//
//  Matrix+Math+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

public extension Matrix {
    
    // Element-wise
    static func .** (_ a: Matrix, _ b: Matrix) -> Matrix {
        validateSize(a, b)
        let c = a.grid ** b.grid
        return Matrix(a, grid: c)
    }
    
    // Element-wise
    static func .** (_ a: Matrix, _ b: Double) -> Matrix {
        let c =  a.grid ** b
        return Matrix(a, grid: c)
    }
    
    // Element-wise
    static func .** (_ a: Double, _ b: Matrix) -> Matrix {
        let c =  a ** b.grid
        return Matrix(b, grid: c)
    }
    
    // MARK: Not implemented
    
    @available(*, unavailable, renamed: ".**", message: "Matrices cannot be raised to the power of a matrix. Did you mean .**")
    static func ** (_ a: Matrix, _ b: Matrix) -> Matrix {
        return Matrix()
    }
    
    @available(*, unavailable, message: "Double cannot be raised to the power of a matrix")
    static func ** (_ a: Double, _ b: Matrix) -> Matrix {
        return Matrix()
    }

}
