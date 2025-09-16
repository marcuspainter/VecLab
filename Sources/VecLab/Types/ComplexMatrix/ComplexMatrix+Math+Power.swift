//
//  ComplexMatrix+Math+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

public extension ComplexMatrix {
    
    // Element-wise
    static func .** (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a.grid ** b.grid
        return ComplexMatrix(a, grid: c)
    }
    
    // Element-wise
    static func .** (_ a: ComplexMatrix, _ b: Double) -> ComplexMatrix {
        let c =  a.grid ** b
        return ComplexMatrix(a, grid: c)
    }
    
    // Element-wise
    static func .** (_ a: ComplexMatrix, _ b: Matrix) -> ComplexMatrix {
        let c =  a.grid ** b.grid
        return ComplexMatrix(a, grid: c)
    }
    
    // MARK: Not implemented
    
    @available(*, unavailable, renamed: ".**", message: "Matrices cannot be raised to the power of a matrix. Did you mean .**")
    static func ** (_ a: ComplexMatrix, _ b: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix()
    }
    
    @available(*, unavailable, message: "Double cannot be raised to the power of a matrix")
    static func ** (_ a: Double, _ b: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix()
    }
}
