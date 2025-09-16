//
//  MatricComplex+Math+Complex.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension ComplexMatrix {
    
    public static func + (_ a: ComplexMatrix, _ b: Complex) -> ComplexMatrix {
        let c = a.data + b
        return ComplexMatrix(a, data: c)
    }
    
    public static func + (_ a: Complex, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a + b.data
        return ComplexMatrix(b, data: c)
    }
    
    public static func - (_ a: ComplexMatrix, _ b: Complex) -> ComplexMatrix {
        let c = a.data - b
        return ComplexMatrix(a, data: c)
    }

    public static func - (_ a: Complex, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a - b.data
        return ComplexMatrix(b, data: c)
    }
    
    static func * (_ a: ComplexMatrix, _ b: Complex) -> ComplexMatrix {
        let c = a.data * b
        return ComplexMatrix(a, data: c)
    }
    
    static func * (_ a: Complex, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a * b.data
        return ComplexMatrix(b, data: c)
    }
    
    public static func / (_ a: ComplexMatrix, _ b: Complex) -> ComplexMatrix {
        let c = a.data / b
        return ComplexMatrix(a, data: c)
    }

    public static func / (_ a: Complex, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a / b.data
        return ComplexMatrix(b, data: c)
    }
}
