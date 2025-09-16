//
//  MathComplex+Math+Double.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension ComplexMatrix {
    
    public static func + (_ a: ComplexMatrix, _ b: Double) -> ComplexMatrix {
        let c = a.grid + b
        return ComplexMatrix(a, grid: c)
    }
    
    public static func + (_ a: Double, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a + b.grid
        return ComplexMatrix(b, grid: c)
    }
    
    // MARK -
    
    public static func - (_ a: ComplexMatrix, _ b: Double) -> ComplexMatrix {
        let c = a.grid - b
        return ComplexMatrix(a, grid: c)
    }
    
    public static func - (_ a: Double, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a - b.grid
        return ComplexMatrix(b, grid: c)
    }
    
    // MARK *
    
    public static func * (_ a: ComplexMatrix, _ b: Double) -> ComplexMatrix {
        let c = a.grid * b
        return ComplexMatrix(a, grid: c)
    }
    
    public static func * (_ a: Double, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a * b.grid
        return ComplexMatrix(b, grid: c)
    }
    
    // MARK /
    
    public static func / (_ a: ComplexMatrix, _ b: Double) -> ComplexMatrix {
        let c = a.grid / b
        return ComplexMatrix(a, grid: c)
    }

    public static func / (_ a: Double, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a / b.grid
        return ComplexMatrix(b, grid: c)
    }
}
