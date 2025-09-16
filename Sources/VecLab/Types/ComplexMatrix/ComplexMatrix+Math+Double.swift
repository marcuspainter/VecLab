//
//  MathComplex+Math+Double.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension ComplexMatrix {
    
    public static func + (_ a: ComplexMatrix, _ b: Double) -> ComplexMatrix {
        let c = a.data + b
        return ComplexMatrix(a, data: c)
    }
    
    public static func + (_ a: Double, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a + b.data
        return ComplexMatrix(b, data: c)
    }
    
    // MARK -
    
    public static func - (_ a: ComplexMatrix, _ b: Double) -> ComplexMatrix {
        let c = a.data - b
        return ComplexMatrix(a, data: c)
    }
    
    public static func - (_ a: Double, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a - b.data
        return ComplexMatrix(b, data: c)
    }
    
    // MARK *
    
    public static func * (_ a: ComplexMatrix, _ b: Double) -> ComplexMatrix {
        let c = a.data * b
        return ComplexMatrix(a, data: c)
    }
    
    public static func * (_ a: Double, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a * b.data
        return ComplexMatrix(b, data: c)
    }
    
    // MARK /
    
    public static func / (_ a: ComplexMatrix, _ b: Double) -> ComplexMatrix {
        let c = a.data / b
        return ComplexMatrix(a, data: c)
    }

    public static func / (_ a: Double, _ b: ComplexMatrix) -> ComplexMatrix {
        let c = a / b.data
        return ComplexMatrix(b, data: c)
    }
}
