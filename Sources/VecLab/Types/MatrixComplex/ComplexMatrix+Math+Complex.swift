//
//  MatricComplex+Math+Complex.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension ComplexMatrix {
    
    public static func + (_ a: ComplexMatrix, _ b: Complex) -> ComplexMatrix {
        let c = a.grid + b
        return ComplexMatrix(a, grid: c)
    }
    
    public static func + (_ a: Complex, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a + b.grid
        return ComplexMatrix(b, grid: c)
    }
    
    public static func - (_ a: ComplexMatrix, _ b: Complex) -> ComplexMatrix {
        let c = a.grid - b
        return ComplexMatrix(a, grid: c)
    }

    public static func - (_ a: Complex, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a - b.grid
        return ComplexMatrix(b, grid: c)
    }
    
    static func * (_ a: ComplexMatrix, _ b: Complex) -> ComplexMatrix {
        let c = a.grid * b
        return ComplexMatrix(a, grid: c)
    }
    
    static func * (_ a: Complex, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a * b.grid
        return ComplexMatrix(b, grid: c)
    }
    
    public static func / (_ a: ComplexMatrix, _ b: Complex) -> ComplexMatrix {
        let c = a.grid / b
        return ComplexMatrix(a, grid: c)
    }

    public static func / (_ a: Complex, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a / b.grid
        return ComplexMatrix(b, grid: c)
    }
}
